//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class Good
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Good()
        {
            this.GoodComments = new HashSet<GoodComment>();
            this.ShopCarts = new HashSet<ShopCart>();
        }
    
        public int GoodID { get; set; }
        public Nullable<int> ShopID { get; set; }
        public string GoodTitle { get; set; }
        public string GoodPhoto { get; set; }
        public string GoodDescribe { get; set; }
        public Nullable<int> Amount { get; set; }
        public string Quality { get; set; }
        public Nullable<decimal> Price { get; set; }
    
        public virtual Category Category { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<GoodComment> GoodComments { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ShopCart> ShopCarts { get; set; }
    }
}
