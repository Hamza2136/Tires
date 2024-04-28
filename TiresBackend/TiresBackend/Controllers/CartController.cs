using Microsoft.AspNetCore.Mvc;
using TiresBackend.Models;
using TiresBackend.Services.BusinessLogic;
using TiresBackend_DBContext.Model;
using TiresBackend_DBContext.Services.Contract;

namespace TiresBackend.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class CartController : ControllerBase
    {
        private readonly ICart _cartRepository;

        public CartController(ICart cartRepository)
        {
            _cartRepository = cartRepository;
        }

        [HttpGet("all")]
        public async Task<ActionResult<IEnumerable<CartController>>> GetItems()
        {
            var items = await _cartRepository.GetAllItems();
            return Ok(items);

        }
        [HttpGet("id/{id}")]
        public async Task<ActionResult<CartModel>> GetItemById(int id)
        {
            var item = await _cartRepository.GetItemById(id);
            if (item == null)
            {
                return NotFound();
            }
            return Ok(item);
        }

        [HttpGet("uid/{userId}")]
        public async Task<ActionResult<IEnumerable<CartModel>>> GetItems(int userId)
        {
            var items = await _cartRepository.GetItemsByUserId(userId);

            if (items == null || !items.Any()) // Check for empty collection
            {
                return NotFound(); // Handle case where no items found
            }

            return Ok(items);
        }

        [HttpPost("add")]
        public async Task<ActionResult<CartModel>> AddItem(CartModel newCart)
        {
            await _cartRepository.AddItem(newCart);
            return CreatedAtAction(nameof(GetItemById), new { id = newCart.CartId }, newCart);
        }

        [HttpPut("update/{id}")]
        public async Task<IActionResult> UpdateCart(int id, CartModel updatedCart)
        {
            if (id != updatedCart.CartId)
            {
                return BadRequest();
            }

            await _cartRepository.UpdateItem(updatedCart);

            return NoContent();
        }

        [HttpDelete("delete/{id}")]
        public async Task<IActionResult> DeleteItem(int id)
        {
            var itemtoDelete = await _cartRepository.GetItemById(id);
            if (itemtoDelete == null)
            {
                return NotFound();
            }

            await _cartRepository.DeleteItem(id);

            return NoContent();
        }

        [HttpPut("increment/{cartId}")]
        public async Task<IActionResult> IncrementCartItem(int cartId)
        {
            await _cartRepository.IncrementCartItem(cartId);
            return Ok();
        }

        [HttpPut("decrement/{cartId}")]
        public async Task<IActionResult> DecrementCartItem(int cartId)
        {
            await _cartRepository.DecrementCartItem(cartId);
            return Ok();
        }
    }
}
