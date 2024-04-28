using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TiresBackend.Models;
using TiresBackend_DBContext.Model;

namespace TiresBackend_DBContext.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {

        }
        public DbSet<AccountModel> UserAccount { get; set; }
        public DbSet<ProductModel> Products { get; set; }
        public DbSet<CartModel> Cart { get; set; }
    }
}
