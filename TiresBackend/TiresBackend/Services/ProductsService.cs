using TiresBackend_DBContext.Services.Contract;
using TiresBackend_DBContext.Model;
using TiresBackend_DBContext.Data;
using Microsoft.EntityFrameworkCore;
using TiresBackend.Models;

namespace TiresBackend.Services.BusinessLogic
{
    class ProductsService :  IProducts
    {
        private readonly ApplicationDbContext _context;

        public ProductsService(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<ProductModel>> GetAllProducts()
        {
            return await _context.Products.ToListAsync();
        }
        public async Task<ProductModel> GetProductById(int id)
        {
            return await _context.Products.FirstOrDefaultAsync(u => u.ProductId == id);
        }
        public async Task AddProduct(ProductModel newProduct)
        {
            _context.Products.Add(newProduct);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateProduct(ProductModel updatedProduct)
        {
            _context.Entry(updatedProduct).State = EntityState.Modified;
            await _context.SaveChangesAsync();
        }

        public async Task DeleteProduct(int id)
        {
            var productToDelete = await _context.Products.FindAsync(id);
            if (productToDelete != null)
            {
                _context.Products.Remove(productToDelete);
                await _context.SaveChangesAsync();
            }
        }
    }
}
