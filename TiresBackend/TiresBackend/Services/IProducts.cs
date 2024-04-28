using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TiresBackend.Models;

namespace TiresBackend_DBContext.Services.Contract
{
    public interface IProducts
    {
        Task<IEnumerable<ProductModel>> GetAllProducts();
        Task<ProductModel> GetProductById(int id);
        Task AddProduct(ProductModel newProduct);
        Task UpdateProduct(ProductModel updatedProduct);
        Task DeleteProduct(int id);

    }
}
