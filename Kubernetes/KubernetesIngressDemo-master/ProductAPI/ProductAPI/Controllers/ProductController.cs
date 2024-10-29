using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using ProductAPI.Models;

namespace ProductAPI.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ProductsController : ControllerBase
    {
        private static List<Product> _products = new List<Product>
        {
            new Product { Id = 1, Name = "Product 1", Price = 10.99m },
            new Product { Id = 2, Name = "Product 2", Price = 20.49m }
        };

        private readonly ILogger<ProductsController> _logger;

        public ProductsController(ILogger<ProductsController> logger)
        {
            _logger = logger;
        }

        [HttpGet]
        public IEnumerable<Product> Get()
        {
            return _products;
        }

        [HttpGet("{id}")]
        public ActionResult<Product> Get(int id)
        {
            var product = _products.FirstOrDefault(p => p.Id == id);
            if (product == null)
            {
                return NotFound();
            }
            return product;
        }

        [HttpPost]
        public ActionResult<Product> Post(Product product)
        {
            product.Id = _products.Count + 1;
            _products.Add(product);
            return CreatedAtAction(nameof(Get), new { id = product.Id }, product);
        }

        [HttpPut("{id}")]
        public IActionResult Put(int id, Product product)
        {
            var existingProduct = _products.FirstOrDefault(p => p.Id == id);
            if (existingProduct == null)
            {
                return NotFound();
            }
            existingProduct.Name = product.Name;
            existingProduct.Price = product.Price;
            return NoContent();
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            var product = _products.FirstOrDefault(p => p.Id == id);
            if (product == null)
            {
                return NotFound();
            }
            _products.Remove(product);
            return NoContent();
        }
    }
}
