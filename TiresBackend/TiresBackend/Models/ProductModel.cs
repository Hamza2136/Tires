using System.ComponentModel.DataAnnotations;

namespace TiresBackend.Models
{
    public class ProductModel
    {
        [Key]
        public int ProductId { get; set; }
        [Required]
        public string ProductName { get; set; }
        [Required]
        public string ProductDescription { get; set; }
        [Required]
        public string ImageUrl { get; set; }
        [Required]
        public string ProductCategory { get; set; }
        [Required]
        public double ProductPrice { get; set; }
        [Required]
        public string AddedDate { get; set; }
        public string? UPdatedDate { get; set; }

    }
}
