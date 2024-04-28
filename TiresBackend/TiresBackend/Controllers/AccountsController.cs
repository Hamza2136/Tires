using Microsoft.AspNetCore.Mvc;
using TiresBackend_DBContext.Model;
using TiresBackend_DBContext.Services.Contract;

namespace TiresBackend.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class AccountsController : ControllerBase
    {
        private readonly IAccounts _accountRepository;

        public AccountsController(IAccounts accountRepository)
        {
            _accountRepository = accountRepository;
        }

        [HttpGet("all")]
        public async Task<ActionResult<IEnumerable<AccountModel>>> GetUsers()
        {
            var users = await _accountRepository.GetAllUsers();
            return Ok(users);

        }
        [HttpGet("id/{id}")]
        public async Task<ActionResult<AccountModel>> GetUserById(int id)
        {
            var user = await _accountRepository.GetUserById(id);
            if (user == null)
            {
                return NotFound();
            }
            return Ok(user);
        }

        [HttpGet("email/{email}")]
        public async Task<ActionResult<AccountModel>> GetUserByEmail(string email)
        {
            var user = await _accountRepository.GetUserByEmail(email);
            if (user == null)
            {
                return NotFound();
            }
            return Ok(user);
        }

        [HttpPost("create")]
        public async Task<ActionResult<AccountModel>> CreateUser(AccountModel newUser)
        {
            await _accountRepository.AddUser(newUser);
            return CreatedAtAction(nameof(GetUserById), new { id = newUser.UserId }, newUser);
        }

        [HttpPut("update/{id}")]
        public async Task<IActionResult> UpdateUser(int id, AccountModel updatedUser)
        {
            if (id != updatedUser.UserId)
            {
                return BadRequest();
            }

            await _accountRepository.UpdateUser(updatedUser);

            return NoContent();
        }

        [HttpDelete("delete/{id}")]
        public async Task<IActionResult> DeleteUser(int id)
        {
            var userToDelete = await _accountRepository.GetUserById(id);
            if (userToDelete == null)
            {
                return NotFound();
            }

            await _accountRepository.DeleteUser(id);

            return NoContent();
        }
    }
}
