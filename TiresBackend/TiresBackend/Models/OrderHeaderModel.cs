using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TiresBackend_DBContext.Model
{
    public class OrderHeaderModel
    {
        public int OrderHeaderId { get; set; }
        [Required]
        public string UserId { get; set; }
        public DateTime DateOfOrder { get; set; }
        public DateTime DateOfShipping { get; set; }
        public double OrderTotal { get; set; }
        public string? OrderStatus { get; set; }
        public string? PaymentStatus { get; set; }
        public string? TrackingNumber { get; set; }
        public string? Carrier { get; set; }
        public string? SessionId { get; set; }
        public string? PaymentIntentId { get; set; }
        public DateTime DateOfPayment { get; set; }
        public DateTime DueDate { get; set; }
        [Required]
        public int PhoneNumber { get; set; }
        [Required]
        public string CompleteAddress { get; set; }
        [Required]
        public string Area { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public string PostalCode { get; set; }
    }
}
