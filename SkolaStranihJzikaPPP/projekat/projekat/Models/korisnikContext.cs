namespace projekat.Models
{
	using System;
	using System.Data.Entity;
	using System.ComponentModel.DataAnnotations.Schema;
	using System.Linq;

	public partial class korisnikContext : DbContext
	{
		public korisnikContext()
			: base("name=Model11")
		{
		}

		public virtual DbSet<korisnikModel> Korisnik { get; set; }

		protected override void OnModelCreating(DbModelBuilder modelBuilder)
		{
		}
	}
}
