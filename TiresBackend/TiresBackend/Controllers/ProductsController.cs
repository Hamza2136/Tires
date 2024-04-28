using Microsoft.AspNetCore.Mvc;
using TiresBackend.Models;
using TiresBackend_DBContext.Model;
using TiresBackend_DBContext.Services.Contract;

namespace TiresBackend.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ProductsController : ControllerBase
    {
        private readonly IProducts _productRepository;

        public ProductsController(IProducts productRepository)
        {
            _productRepository = productRepository;
        }

        [HttpGet("all")]
        public async Task<ActionResult<IEnumerable<ProductModel>>> GetProducts()
        {
            var users = await _productRepository.GetAllProducts();
            return Ok(users);

        }
        [HttpGet("id/{id}")]
        public async Task<ActionResult<ProductModel>> GetProductById(int id)
        {
            var user = await _productRepository.GetProductById(id);
            if (user == null)
            {
                return NotFound();
            }
            return Ok(user);
        }

        [HttpPost("add")]
        public async Task<ActionResult<ProductModel>> AddProduct(ProductModel newProduct)
        {
            await _productRepository.AddProduct(newProduct);
            return CreatedAtAction(nameof(GetProductById), new { id = newProduct.ProductId }, newProduct);
        }

        [HttpPut("update/{id}")]
        public async Task<IActionResult> UpdateProduct(int id, ProductModel updatedProduct)
        {
            if (id != updatedProduct.ProductId)
            {
                return BadRequest();
            }

            await _productRepository.UpdateProduct(updatedProduct);

            return NoContent();
        }

        [HttpDelete("delete/{id}")]
        public async Task<IActionResult> DeleteProduct(int id)
        {
            var productToDelete = await _productRepository.GetProductById(id);
            if (productToDelete == null)
            {
                return NotFound();
            }

            await _productRepository.DeleteProduct(id);

            return NoContent();
        }
    }
}
