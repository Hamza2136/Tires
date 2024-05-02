using Microsoft.AspNetCore.Mvc;
using TiresBackend.Models;
using TiresBackend.Services.BusinessLogic;
using TiresBackend_DBContext.Model;
using TiresBackend_DBContext.Services.Contract;

namespace TiresBackend.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class AddressController : ControllerBase
    {
        private readonly IAddress _addressRepository;

        public AddressController(IAddress addressRepository)
        {
            _addressRepository = addressRepository;
        }

        [HttpGet("all")]
        public async Task<ActionResult<IEnumerable<AddressController>>> GetAddresses()
        {
            var addresses = await _addressRepository.GetAllAddress();
            return Ok(addresses);

        }
        [HttpGet("id/{id}")]
        public async Task<ActionResult<AddressModel>> GetAddressById(int id)
        {
            var address = await _addressRepository.GetAddressById(id);
            if (address == null)
            {
                return NotFound();
            }
            return Ok(address);
        }

        [HttpGet("uid/{userId}")]
        public async Task<ActionResult<IEnumerable<AddressModel>>> GetAddressByUserId(int userId)
        {
            var address = await _addressRepository.GetAddressByUserId(userId);

            if (address == null || !address.Any())
            {
                return NotFound(); 
            }

            return Ok(address);
        }

        [HttpPost("add")]
        public async Task<ActionResult<AddressModel>> AddAddress(AddressModel newAddress)
        {
            await _addressRepository.AddAddress(newAddress);
            return CreatedAtAction(nameof(GetAddressById), new { id = newAddress.AddressId }, newAddress);
        }

        [HttpPut("update/{id}")]
        public async Task<IActionResult> UpdateAddress(int id, AddressModel updatedAddress)
        {
            if (id != updatedAddress.AddressId)
            {
                return BadRequest();
            }

            await _addressRepository.UpdateAddress(updatedAddress);

            return NoContent();
        }

        [HttpDelete("delete/{id}")]
        public async Task<IActionResult> DeleteAddress(int id)
        {
            var addressToDelete = await _addressRepository.GetAddressById(id);
            if (addressToDelete == null)
            {
                return NotFound();
            }

            await _addressRepository.DeleteAddress(id);
            return NoContent();
        }
    }
}
