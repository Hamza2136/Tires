using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System.ComponentModel.DataAnnotations;
using TiresBackend_DBContext.Model;

namespace TiresBackend.Models
{
    public class OrderDetailsModel
    {
        [Key]
        public int OrderDetailsId { get; set; }
        [Required]
        public int OrderHeaderId { get; set; }
        [ValidateNever]
        public OrderHeaderModel OrderHeader { get; set; }
        public int ProductId { get; set; }
        [ValidateNever]
        public ProductModel Products { get; set; }
        public double Price { get; set; }
        public int Count { get; set; }
    }
}
