using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TiresBackend.Models;
using TiresBackend.Services.BusinessLogic;
using TiresBackend_DBContext.Model;
using TiresBackend_DBContext.Services.Contract;

namespace TiresBackend.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class OrderHeaderController : ControllerBase
    {
        private readonly IOrderHeader _orderHeaderRepository;

        public OrderHeaderController(IOrderHeader orderHeaderRepository)
        {
            _orderHeaderRepository = orderHeaderRepository;
        }

        [HttpGet("all")]
        public async Task<ActionResult<IEnumerable<OrderHeaderModel>>> GetOrderHeaders()
        {
            var orderHeaders = await _orderHeaderRepository.GetAllOrderHeader();
            return Ok(orderHeaders);

        }
        [HttpGet("id/{id}")]
        public async Task<ActionResult<OrderHeaderModel>> GetOrderHeaderById(int id)
        {
            var orderHeader = await _orderHeaderRepository.GetOrderHeaderById(id);
            if (orderHeader == null)
            {
                return NotFound();
            }
            return Ok(orderHeader);
        }

        [HttpGet("uid/{userId}")]
        public async Task<ActionResult<IEnumerable<OrderHeaderModel>>> GetOrderHeaderByUserId(int userId)
        {
            var orderHeaders = await _orderHeaderRepository.GetOrderHeaderByUserId(userId);

            if (orderHeaders == null || !orderHeaders.Any())
            {
                return NotFound();
            }

            return Ok(orderHeaders);
        }

        [HttpPost("add")]
        public async Task<ActionResult<OrderHeaderModel>> AddItem(OrderHeaderModel newOrderHeader)
        {
            await _orderHeaderRepository.AddOrderHeader(newOrderHeader);
            return CreatedAtAction(nameof(GetOrderHeaderById), new { id = newOrderHeader.OrderHeaderId }, newOrderHeader);
        }

        [HttpPut("update/{id}")]
        public async Task<IActionResult> UpdateOrderHeader(int id, OrderHeaderModel updatedOrderHeader)
        {
            if (id != updatedOrderHeader.OrderHeaderId)
            {
                return BadRequest();
            }

            await _orderHeaderRepository.UpdateOrderHeader(updatedOrderHeader);

            return NoContent();
        }

        [HttpDelete("delete/{id}")]
        public async Task<IActionResult> DeleteOrderHeader(int id)
        {
            var orderHeadertoDelete = await _orderHeaderRepository.GetOrderHeaderById(id);
            if (orderHeadertoDelete == null)
            {
                return NotFound();
            }

            await _orderHeaderRepository.DeleteOrderHeader(id);

            return NoContent();
        }
        [HttpDelete("deleteuid/{uid}")]
        public async Task<IActionResult> DeleteOrderHeaderWithUserId(int uid)
        {
            var orderHeadersToDelete = await _orderHeaderRepository.GetOrderHeaderByUserId(uid);

            if (orderHeadersToDelete == null)
            { 
                return NotFound();
            }
            await _orderHeaderRepository.DeleteOrderHeaderWithUid(uid);
            return NoContent();
        }
    }
}
