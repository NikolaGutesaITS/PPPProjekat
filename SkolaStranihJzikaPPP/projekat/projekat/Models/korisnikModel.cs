namespace projekat.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Korisnik")]
    public partial class korisnikModel
    {
        public int ID { get; set; }

        [StringLength(20)]
        public string Ime { get; set; }

        [StringLength(20)]
        public string Adresa { get; set; }

        [StringLength(50)]
        public string Email { get; set; }

        public int? Telefon { get; set; }

        [StringLength(15)]
        public string JMGB { get; set; }
    }
}
