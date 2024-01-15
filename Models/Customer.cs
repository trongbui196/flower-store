using System;
using System.Collections.Generic;

namespace WebApplication3.Models;

public partial class Customer
{
    public int CustomerId { get; set; }

    public string? CustomerUsername { get; set; }

    public string? CustomerPassword { get; set; }

    public string? CustomerSurname { get; set; }

    public string? CustomerLastname { get; set; }

    public string? CustomerAddress { get; set; }

    public string? CustomerPhone { get; set; }

    public int? CustomeBday { get; set; }

    public virtual ICollection<Orderr> Orderrs { get; set; } = new List<Orderr>();
}
