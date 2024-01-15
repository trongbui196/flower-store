using System;
using System.Collections.Generic;

namespace WebApplication3.Models;

public partial class OrderStatus
{
    public string OrderName { get; set; } = null!;

    public int? OrderId { get; set; }

    public string? OrderStatus1 { get; set; }

    public virtual Orderr? Order { get; set; }
}
