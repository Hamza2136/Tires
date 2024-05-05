using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TiresBackend.Models;
using TiresBackend_DBContext.Model;

namespace TiresBackend_DBContext.Services.Contract
{
    public interface IOrderHeader
    {
        Task<IEnumerable<OrderHeaderModel>> GetAllOrderHeader();
        Task<IEnumerable<OrderHeaderModel>> GetOrderHeaderByUserId(int userId);
        Task<OrderHeaderModel> GetOrderHeaderById(int id);
        Task AddOrderHeader(OrderHeaderModel newOrderHeader);
        Task UpdateOrderHeader(OrderHeaderModel updatedOrderHeader);
        Task DeleteOrderHeader(int id);
        Task DeleteOrderHeaderWithUid(int uid);
    }
}
