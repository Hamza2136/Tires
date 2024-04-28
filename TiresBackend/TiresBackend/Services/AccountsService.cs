using TiresBackend_DBContext.Services.Contract;
using TiresBackend_DBContext.Model;
using TiresBackend_DBContext.Data;
using Microsoft.EntityFrameworkCore;

namespace TiresBackend.Services.BusinessLogic
{
    class AccountsService :  IAccounts
    {
        private readonly ApplicationDbContext _context;

        public AccountsService(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<AccountModel>> GetAllUsers()
        {
            return await _context.UserAccount.ToListAsync();
        }

        public async Task<AccountModel> GetUserByEmail(string email)
        {
            return await _context.UserAccount.FirstOrDefaultAsync(u => u.Email == email);
        }

        public async Task<AccountModel> GetUserById(int id)
        {
            return await _context.UserAccount.FirstOrDefaultAsync(u => u.UserId == id);
        }
        public async Task AddUser(AccountModel newUser)
        {
            _context.UserAccount.Add(newUser);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateUser(AccountModel updatedUser)
        {
            _context.Entry(updatedUser).State = EntityState.Modified;
            await _context.SaveChangesAsync();
        }

        public async Task DeleteUser(int id)
        {
            var userToDelete = await _context.UserAccount.FindAsync(id);
            if (userToDelete != null)
            {
                _context.UserAccount.Remove(userToDelete);
                await _context.SaveChangesAsync();
            }
        }
    }
}
