//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Workshop_Application.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Material
    {
        public int MaterialId { get; set; }
        public string MaterialDesc { get; set; }
        public string MaterialPath { get; set; }
        public Nullable<int> WorkshopId { get; set; }
    
        public virtual Workshop Workshop { get; set; }
    }
}
