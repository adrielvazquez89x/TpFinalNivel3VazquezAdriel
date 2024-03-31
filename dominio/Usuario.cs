using System.Collections.Generic;

namespace dominio
{
    public class Usuario
    {
        public int Id { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string UrlImagen { get; set; }
        public List<Articulo> Carrito { get; set; }
        public bool Admin { get; set; }

    }
}
