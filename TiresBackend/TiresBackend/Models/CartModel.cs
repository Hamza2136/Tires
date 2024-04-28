using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System.ComponentModel.DataAnnotations;
using TiresBackend_DBContext.Model;

namespace TiresBackend.Models
{
    public class CartModel
    {
        [Key]
        public int CartId { get; set; }
        public string ProductName { get; set; }
        public string ImageUrl { get; set; }
        public int ProductPrice { get; set; }
        public int ProductId { get; set; }
        public int UserId { get; set; }
        public int Count { get; set; }
    }
}
