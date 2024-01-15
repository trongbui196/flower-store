using System;
using System.Collections.Generic;

namespace WebApplication3.Models;

public partial class Flower
{
    public int FlowerId { get; set; }

    public int? KindId { get; set; }

    public string? Fname { get; set; }

    public int? Fprice { get; set; }

    public string? Fdescribe { get; set; }

    public string? Fimg { get; set; }

    public int? Fstock { get; set; }

    public virtual KindFlower? Kind { get; set; }
}
