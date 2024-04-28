using TiresBackend_DBContext.Services.Contract;
using TiresBackend_DBContext.Model;
using TiresBackend_DBContext.Data;
using Microsoft.EntityFrameworkCore;
using TiresBackend.Models;

namespace TiresBackend.Services.BusinessLogic
{
    class CartService :  ICart
    {
        private readonly ApplicationDbContext _context;

        public CartService(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<CartModel>> GetAllItems()
        {
            return await _context.Cart.ToListAsync();
        }
        public async Task<IEnumerable<CartModel>> GetItemsByUserId(int userId)
        {
            return await _context.Cart.Where(u => u.UserId == userId).ToListAsync();
        }
        public async Task<CartModel> GetItemById(int id)
        {
            return await _context.Cart.FirstOrDefaultAsync(u => u.CartId == id);
        }
        public async Task AddItem(CartModel newCart)
        {
            _context.Cart.Add(newCart);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateItem(CartModel updatedCart)
        {
            _context.Entry(updatedCart).State = EntityState.Modified;
            await _context.SaveChangesAsync();
        }

        public async Task DeleteItem(int id)
        {
            var itemToDelete = await _context.Cart.FindAsync(id);
            if (itemToDelete != null)
            {
                _context.Cart.Remove(itemToDelete);
                await _context.SaveChangesAsync();
            }
        }
        public async Task IncrementCartItem(int cartId)
        {
            var cartItem = await _context.Cart.FindAsync(cartId);
            if (cartItem != null)
            {
                cartItem.Count++;
                await _context.SaveChangesAsync(); 
            }
        }

        public async Task DecrementCartItem(int cartId)
        {
            var cartItem = await _context.Cart.FindAsync(cartId);
            if (cartItem != null)
            {
                if(cartItem.Count <= 1)
                {
                    await DeleteItem(cartId);
                    await _context.SaveChangesAsync();
                }
                else
                {
                    cartItem.Count--;
                    await _context.SaveChangesAsync();
                }
            }
        }

    }
}
