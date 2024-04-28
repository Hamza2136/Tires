using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TiresBackend_DBContext.Model;

namespace TiresBackend_DBContext.Services.Contract
{
    public interface IAccounts
    {
        Task<IEnumerable<AccountModel>> GetAllUsers();
        Task<AccountModel> GetUserByEmail(string email);
        Task<AccountModel> GetUserById(int id);
        Task AddUser(AccountModel newUser);
        Task UpdateUser(AccountModel updatedUser);
        Task DeleteUser(int id);

    }
}
