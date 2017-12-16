namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Content")]
    public partial class Content
    {
        public long ID { get; set; }

        [StringLength(250)]
        public string Name { get; set; }


        [StringLength(500)]
        public string Description { get; set; }

        [StringLength(250)]
        public string Image { get; set; }


        [Column(TypeName = "ntext")]
        public string Detail { get; set; }


        public DateTime? CreatedDate { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(50)]
        public string ModifiedBy { get; set; }


        public bool Status { get; set; }


        public int? ViewCount { get; set; }
    }
}
