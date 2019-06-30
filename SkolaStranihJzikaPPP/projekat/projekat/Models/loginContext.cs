namespace projekat.Models
{
	using System;
	using System.Data.Entity;
	using System.ComponentModel.DataAnnotations.Schema;
	using System.Linq;

	public partial class loginContext : DbContext
	{
		public loginContext()
			: base("name=Model1")
		{
		}

		public virtual DbSet<loginModel> login { get; set; }

		protected override void OnModelCreating(DbModelBuilder modelBuilder)
		{
			modelBuilder.Entity<loginModel>()
				.Property(e => e.userType)
				.IsUnicode(false);
		}
	}
}
