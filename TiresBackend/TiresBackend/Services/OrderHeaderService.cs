using TiresBackend_DBContext.Services.Contract;
using TiresBackend_DBContext.Model;
using TiresBackend_DBContext.Data;
using Microsoft.EntityFrameworkCore;
using TiresBackend.Models;

namespace TiresBackend.Services.BusinessLogic
{
    class OrderHeaderService :  IOrderHeader
    {
        private readonly ApplicationDbContext _context;

        public OrderHeaderService(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<OrderHeaderModel>> GetAllOrderHeader()
        {
            return await _context.OrderHeader.ToListAsync();
        }
        public async Task<IEnumerable<OrderHeaderModel>> GetOrderHeaderByUserId(int userId)
        {
            return await _context.OrderHeader.Where(u => u.UserId == userId).ToListAsync();
        }
        public async Task<OrderHeaderModel> GetOrderHeaderById(int id)
        {
            return await _context.OrderHeader.FirstOrDefaultAsync(u => u.OrderHeaderId == id);
        }
        public async Task AddOrderHeader(OrderHeaderModel newOrderHeader)
        {
            _context.OrderHeader.Add(newOrderHeader);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateOrderHeader(OrderHeaderModel updatedOrderHeader)
        {
            _context.Entry(updatedOrderHeader).State = EntityState.Modified;
            await _context.SaveChangesAsync();
        }

        public async Task DeleteOrderHeader(int id)
        {
            var orderHeaderToDelete = await _context.OrderHeader.FindAsync(id);
            if (orderHeaderToDelete != null)
            {
                _context.OrderHeader.Remove(orderHeaderToDelete);
                await _context.SaveChangesAsync();
            }
        }
        public async Task DeleteOrderHeaderWithUid(int uid)
        {
            var orderHeadersToDelete = await _context.OrderHeader.Where(c => c.UserId == uid).ToListAsync();
            if (orderHeadersToDelete != null)
            {
                _context.OrderHeader.RemoveRange(orderHeadersToDelete);
                await _context.SaveChangesAsync();
            }
        }
    }
}
