using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace WebApplication3.Models;

public partial class QltiemhoaContext : DbContext
{
    public QltiemhoaContext()
    {
    }

    public QltiemhoaContext(DbContextOptions<QltiemhoaContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Adminn> Adminns { get; set; }

    public virtual DbSet<Customer> Customers { get; set; }

    public virtual DbSet<Flower> Flowers { get; set; }

    public virtual DbSet<KindFlower> KindFlowers { get; set; }

    public virtual DbSet<OrderStatus> OrderStatuses { get; set; }

    public virtual DbSet<Orderr> Orderrs { get; set; }

    public virtual DbSet<Test> Tests { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        => optionsBuilder.UseSqlServer("Data Source=DESKTOP-2P3GHK5\\SQLEXPRESS;Initial Catalog=qltiemhoa;Integrated Security=True;Connect Timeout=30;Encrypt=True;Trust Server Certificate=True;Application Intent=ReadWrite;Multi Subnet Failover=False");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Adminn>(entity =>
        {
            entity.HasKey(e => e.AdminId).HasName("PK__adminn__43AA414110E1A651");

            entity.ToTable("adminn");

            entity.Property(e => e.AdminId)
                .ValueGeneratedNever()
                .HasColumnName("admin_id");
            entity.Property(e => e.AdminPassword)
                .HasMaxLength(100)
                .HasColumnName("admin_password");
            entity.Property(e => e.AdminUsername)
                .HasMaxLength(100)
                .HasColumnName("admin_username");
        });

        modelBuilder.Entity<Customer>(entity =>
        {
            entity.HasKey(e => e.CustomerId).HasName("PK__customer__CD65CB85A1409E9D");

            entity.ToTable("customer");

            entity.Property(e => e.CustomerId)
                .ValueGeneratedNever()
                .HasColumnName("customer_id");
            entity.Property(e => e.CustomeBday).HasColumnName("custome_bday");
            entity.Property(e => e.CustomerAddress)
                .HasMaxLength(100)
                .HasColumnName("customer_address");
            entity.Property(e => e.CustomerLastname)
                .HasMaxLength(100)
                .HasColumnName("customer_lastname");
            entity.Property(e => e.CustomerPassword)
                .HasMaxLength(100)
                .HasColumnName("customer_password");
            entity.Property(e => e.CustomerPhone)
                .HasMaxLength(10)
                .HasColumnName("customer_phone");
            entity.Property(e => e.CustomerSurname)
                .HasMaxLength(100)
                .HasColumnName("customer_surname");
            entity.Property(e => e.CustomerUsername)
                .HasMaxLength(100)
                .HasColumnName("customer_username");
        });

        modelBuilder.Entity<Flower>(entity =>
        {
            entity.HasKey(e => e.FlowerId).HasName("PK__flower__177E0A7E38253719");

            entity.ToTable("flower");

            entity.Property(e => e.FlowerId).HasColumnName("flower_id");
            entity.Property(e => e.Fdescribe)
                .HasMaxLength(200)
                .HasColumnName("fdescribe");
            entity.Property(e => e.Fimg)
                .HasMaxLength(100)
                .HasColumnName("fimg");
            entity.Property(e => e.Fname)
                .HasMaxLength(100)
                .HasColumnName("fname");
            entity.Property(e => e.Fprice).HasColumnName("fprice");
            entity.Property(e => e.Fstock).HasColumnName("fstock");
            entity.Property(e => e.KindId).HasColumnName("kind_id");

            entity.HasOne(d => d.Kind).WithMany(p => p.Flowers)
                .HasForeignKey(d => d.KindId)
                .HasConstraintName("FK__flower__kind_id__5070F446");
        });

        modelBuilder.Entity<KindFlower>(entity =>
        {
            entity.HasKey(e => e.KindId).HasName("PK__kind_flo__CDCCA86D0DBB6F09");

            entity.ToTable("kind_flower");

            entity.Property(e => e.KindId)
                .ValueGeneratedNever()
                .HasColumnName("kind_id");
            entity.Property(e => e.KindName)
                .HasMaxLength(100)
                .HasColumnName("kind_name");
        });

        modelBuilder.Entity<OrderStatus>(entity =>
        {
            entity.HasKey(e => e.OrderName).HasName("PK__order_st__00D3016E82B0B387");

            entity.ToTable("order_status");

            entity.Property(e => e.OrderName)
                .HasMaxLength(100)
                .HasColumnName("order_name");
            entity.Property(e => e.OrderId).HasColumnName("order_id");
            entity.Property(e => e.OrderStatus1)
                .HasMaxLength(20)
                .HasColumnName("order_status");

            entity.HasOne(d => d.Order).WithMany(p => p.OrderStatuses)
                .HasForeignKey(d => d.OrderId)
                .HasConstraintName("fk_ordersta_order");
        });

        modelBuilder.Entity<Orderr>(entity =>
        {
            entity.HasKey(e => e.OrderId).HasName("PK__orderr__465962292C20D7F9");

            entity.ToTable("orderr");

            entity.Property(e => e.OrderId)
                .ValueGeneratedNever()
                .HasColumnName("order_id");
            entity.Property(e => e.CustomerId).HasColumnName("customer_id");
            entity.Property(e => e.DeliAddress)
                .HasMaxLength(100)
                .HasColumnName("deli_address");
            entity.Property(e => e.OrderDate).HasColumnName("order_date");
            entity.Property(e => e.ReceiverName)
                .HasMaxLength(100)
                .HasColumnName("receiver_name");
            entity.Property(e => e.ReceiverPhone)
                .HasMaxLength(100)
                .HasColumnName("receiver_phone");
            entity.Property(e => e.Totalbill).HasColumnName("totalbill");

            entity.HasOne(d => d.Customer).WithMany(p => p.Orderrs)
                .HasForeignKey(d => d.CustomerId)
                .HasConstraintName("fk_order_ordsta");
        });

        modelBuilder.Entity<Test>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("test");

            entity.Property(e => e.Idtest).HasColumnName("idtest");
            entity.Property(e => e.Nametest)
                .HasMaxLength(100)
                .HasColumnName("nametest");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
