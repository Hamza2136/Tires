﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TiresBackend_DBContext.Model
{
    public static class OrderStatus
    {
        public const string StatusPending = "Pending";
        public const string StatusRefund = "Refunded";
        public const string StatusApproved = "Approved";
        public const string StatusInProcess = "UnderProcessing";
        public const string StatusCancelled = "Cancelled";
        public const string StatusShipped = "Shipped";
    }
}
