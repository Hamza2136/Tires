using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TiresBackend.Models;

namespace TiresBackend_DBContext.Services.Contract
{
    public interface IAddress
    {
        Task<IEnumerable<AddressModel>> GetAllAddress();
        Task<IEnumerable<AddressModel>> GetAddressByUserId(int userId);
        Task<AddressModel> GetAddressById(int id);
        Task AddAddress(AddressModel newAddress);
        Task UpdateAddress(AddressModel updatedAddress);
        Task DeleteAddress(int id);
    }
}
