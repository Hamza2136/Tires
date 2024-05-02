using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System.ComponentModel.DataAnnotations;
using TiresBackend_DBContext.Model;

namespace TiresBackend.Models
{
    public class AddressModel
    {
        [Key]
        public int AddressId { get; set; }
        public int UserId { get; set; }
        public string Name { get; set; }
        public string CompleteAddress { get; set; }
        public string Area { get; set; }
        public int PostalCode { get; set; }
        public int PhoneNumber { get; set; }
    }
}
