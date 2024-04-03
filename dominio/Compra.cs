using System.Collections.Generic;

namespace dominio
{
    public class Compra
    {
        public int Id { get; set; }
        public int IdUsuario { get; set; }
        public string NroCompra { get; set; }
        public List<Articulo> Productos { get; set; }
        public decimal Total { get; set; }

        public string NombreComprador { get; set; }
        public int Dni { get; set; }
        public string Direccion { get; set; }   
        public string Localidad { get; set; }
        public int CodigoPostal { get; set; }
        public int MetodoPago { get; set; }

    }
}
