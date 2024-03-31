namespace dominio
{
    internal class Compra
    {
        public int Id { get; set; }
        public int IdUsuario { get; set; }
        public int NroCompra { get; set; }
        public Articulo Producto { get; set; }
        public decimal Total { get; set; }

    }
}
