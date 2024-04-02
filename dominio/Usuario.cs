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

        public decimal CalcularTotal()
        {
            decimal TotalAPagar = 0;
            foreach (var item in Carrito)
            {
                TotalAPagar += item.Precio * item.Cantidad;
            }
            return TotalAPagar;
        }
    }
}
