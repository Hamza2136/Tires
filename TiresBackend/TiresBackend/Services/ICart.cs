using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TiresBackend.Models;

namespace TiresBackend_DBContext.Services.Contract
{
    public interface ICart
    {
        Task<IEnumerable<CartModel>> GetAllItems();
        Task<IEnumerable<CartModel>> GetItemsByUserId(int userId);
        Task<CartModel> GetItemById(int id);
        Task AddItem(CartModel newCart);
        Task UpdateItem(CartModel updatedCart);
        Task DeleteItem(int id);
        Task DecrementCartItem(int cartId);
        Task IncrementCartItem(int cartId);
    }
}
