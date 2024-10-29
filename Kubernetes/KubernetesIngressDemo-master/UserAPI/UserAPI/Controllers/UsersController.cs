using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using UserAPI.Models;

namespace UserAPI.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class UsersController : ControllerBase
    {
        private static List<User> _users = new List<User>
        {
            new User { Id = 1, Name = "User 1", Email = "user1@example.com" },
            new User { Id = 2, Name = "User 2", Email = "user2@example.com" }
        };

        private readonly ILogger<UsersController> _logger;

        public UsersController(ILogger<UsersController> logger)
        {
            _logger = logger;
        }

        [HttpGet]
        public IEnumerable<User> Get()
        {
            return _users;
        }

        [HttpGet("{id}")]
        public ActionResult<User> Get(int id)
        {
            var user = _users.FirstOrDefault(u => u.Id == id);
            if (user == null)
            {
                return NotFound();
            }
            return user;
        }

        [HttpPost]
        public ActionResult<User> Post(User user)
        {
            user.Id = _users.Count + 1;
            _users.Add(user);
            return CreatedAtAction(nameof(Get), new { id = user.Id }, user);
        }

        [HttpPut("{id}")]
        public IActionResult Put(int id, User user)
        {
            var existingUser = _users.FirstOrDefault(u => u.Id == id);
            if (existingUser == null)
            {
                return NotFound();
            }
            existingUser.Name = user.Name;
            existingUser.Email = user.Email;
            return NoContent();
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            var user = _users.FirstOrDefault(u => u.Id == id);
            if (user == null)
            {
                return NotFound();
            }
            _users.Remove(user);
            return NoContent();
        }
    }
}
