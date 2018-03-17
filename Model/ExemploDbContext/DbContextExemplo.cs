using Model.Cliente;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace Exemplo.Model.ExemploDbContext
{
    public class DbContextExemplo : DbContext
    {
        public DbContextExemplo()
            : base("Exemplo")
        {

        }

        public DbSet<ClienteModel> Clientes { get; set; } 
    }
}