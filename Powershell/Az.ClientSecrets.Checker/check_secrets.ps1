$LimitExpirationDays = 30 # Secret expiration date filter
$HighlightDays = 7 # Days to highlight secrets

# Retrieving the list of secrets that expire in the above days
$SecretsToExpire = Get-AzureADApplication -All:$true | ForEach-Object {
    $app = $_
    @(
        Get-AzureADApplicationPasswordCredential -ObjectId $_.ObjectId
        Get-AzureADApplicationKeyCredential -ObjectId $_.ObjectId
    ) | Where-Object {
        $_.EndDate -lt (Get-Date).AddDays($LimitExpirationDays)
    } | ForEach-Object {
        $id = "Not set"
        if($_.CustomKeyIdentifier) {
            $id = [System.Text.Encoding]::UTF8.GetString($_.CustomKeyIdentifier)
        }
        [PSCustomObject] @{
            App = $app.DisplayName
            ObjectID = $app.ObjectId
            AppId = $app.AppId
            Type = $_.GetType().Name
            KeyIdentifier = $id
            EndDate = $_.EndDate
        }
    }
}

# Sort the secrets by EndDate from newest to oldest
$SecretsToExpire = $SecretsToExpire | Sort-Object -Property EndDate -Descending

# Calculate the start and end dates for highlighting
$currentDate = Get-Date
$highlightStartDate = $currentDate
$highlightEndDate = $currentDate.AddDays($HighlightDays)

# Generate the current timestamp for the filename and report
$timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
$reportDateTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$outputFilePath = "SecretsExpirationReport_$timestamp.html"

# Create an HTML report
if ($SecretsToExpire.Count -eq 0) {
    $htmlContent = @"
<!DOCTYPE html>
<html>
<head>
    <title>Secrets Expiration Report</title>
    <style>
        body { font-family: Arial, sans-serif; }
        table { width: 100%; border-collapse: collapse; }
        th, td { border: 1px solid #ddd; padding: 8px; }
        th { background-color: #f4f4f4; }
        h2 { color: #333; }
    </style>
</head>
<body>
    <h2>No secrets found that will expire in this range</h2>
    <p>Report generated on: $reportDateTime</p>
</body>
</html>
"@
} else {
    $htmlContent = @"
<!DOCTYPE html>
<html>
<head>
    <title>Secrets Expiration Report</title>
    <style>
        body { font-family: Arial, sans-serif; }
        table { width: 100%; border-collapse: collapse; }
        th, td { border: 1px solid #ddd; padding: 8px; }
        th { background-color: #f4f4f4; }
        h2 { color: #333; }
        .highlight { background-color: #f8d7da; } /* Red highlight */
    </style>
</head>
<body>
    <h2>Secrets Expiring Soon</h2>
    <p>Total secrets expiring in this range: $($SecretsToExpire.Count)</p>
    <p>Report generated on: $reportDateTime</p>
    <table>
        <thead>
            <tr>
                <th>Application Name</th>
                <th>Object ID</th>
                <th>App ID</th>
                <th>Type</th>
                <th>Key Identifier</th>
                <th>Expiration Date</th>
            </tr>
        </thead>
        <tbody>
"@

    foreach ($secret in $SecretsToExpire) {
        # Determine if the secret should be highlighted
        $highlightClass = if ($secret.EndDate -gt $highlightStartDate -and $secret.EndDate -le $highlightEndDate) { "highlight" } else { "" }
        
        $htmlContent += @"
            <tr class="$highlightClass">
                <td>$($secret.App)</td>
                <td>$($secret.ObjectID)</td>
                <td>$($secret.AppId)</td>
                <td>$($secret.Type)</td>
                <td>$($secret.KeyIdentifier)</td>
                <td>$($secret.EndDate.ToString("yyyy-MM-dd"))</td>
            </tr>
"@
    }

    $htmlContent += @"
        </tbody>
    </table>
</body>
</html>
"@
}

# Write the HTML content to a file with the timestamped filename
$htmlContent | Out-File -FilePath $outputFilePath -Encoding utf8

Write-Output "HTML report has been generated: $outputFilePath"
