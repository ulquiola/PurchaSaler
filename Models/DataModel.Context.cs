﻿//------------------------------------------------------------------------------
// <auto-generated>
//     此代码已从模板生成。
//
//     手动更改此文件可能导致应用程序出现意外的行为。
//     如果重新生成代码，将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class PurchaSalerEntities : DbContext
    {
        public PurchaSalerEntities()
            : base("name=PurchaSalerEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<AdressInfo> AdressInfoes { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<GoodComment> GoodComments { get; set; }
        public virtual DbSet<Good> Goods { get; set; }
        public virtual DbSet<OrderItem> OrderItems { get; set; }
        public virtual DbSet<Order> Orders { get; set; }
        public virtual DbSet<ReplyComment> ReplyComments { get; set; }
        public virtual DbSet<ShopCart> ShopCarts { get; set; }
        public virtual DbSet<Shop> Shops { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<User> Users { get; set; }
    }
}
