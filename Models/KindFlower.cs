using System;
using System.Collections.Generic;

namespace WebApplication3.Models;

public partial class KindFlower
{
    public int KindId { get; set; }

    public string? KindName { get; set; }

    public virtual ICollection<Flower> Flowers { get; set; } = new List<Flower>();
}
