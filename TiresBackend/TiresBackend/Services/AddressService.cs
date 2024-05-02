using TiresBackend_DBContext.Services.Contract;
using TiresBackend_DBContext.Model;
using TiresBackend_DBContext.Data;
using Microsoft.EntityFrameworkCore;
using TiresBackend.Models;

namespace TiresBackend.Services.BusinessLogic
{
    class AddressService :  IAddress
    {
        private readonly ApplicationDbContext _context;

        public AddressService(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<AddressModel>> GetAllAddress()
        {
            return await _context.Address.ToListAsync();
        }
        public async Task<IEnumerable<AddressModel>> GetAddressByUserId(int userId)
        {
            return await _context.Address.Where(u => u.UserId == userId).ToListAsync();
        }
        public async Task<AddressModel> GetAddressById(int id)
        {
            return await _context.Address.FirstOrDefaultAsync(u => u.AddressId == id);
        }
        public async Task AddAddress(AddressModel newAddress)
        {
            _context.Address.Add(newAddress);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateAddress(AddressModel updatedAddress)
        {
            _context.Entry(updatedAddress).State = EntityState.Modified;
            await _context.SaveChangesAsync();
        }

        public async Task DeleteAddress(int id)
        {
            var addressToDelete = await _context.Address.FindAsync(id);
            if (addressToDelete != null)
            {
                _context.Address.Remove(addressToDelete);
                await _context.SaveChangesAsync();
            }
        }
    }
}
