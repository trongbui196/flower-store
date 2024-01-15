using System;
using System.Collections.Generic;

namespace WebApplication3.Models;

public partial class Orderr
{
    public int OrderId { get; set; }

    public DateOnly? OrderDate { get; set; }

    public string? DeliAddress { get; set; }

    public int? CustomerId { get; set; }

    public string? ReceiverName { get; set; }

    public string? ReceiverPhone { get; set; }

    public double? Totalbill { get; set; }

    public virtual Customer? Customer { get; set; }

    public virtual ICollection<OrderStatus> OrderStatuses { get; set; } = new List<OrderStatus>();
}
