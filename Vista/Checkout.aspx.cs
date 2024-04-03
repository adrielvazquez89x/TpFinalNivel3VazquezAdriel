using dominio;
using negocio;
using System;
using System.Collections.Generic;

namespace Vista
{
    public partial class Checkout : System.Web.UI.Page
    {
        public bool FormularioAprobado { get; set; }
        public bool Spiner { get; set; }
        public Usuario Usuario { get; set; }
        public List<Articulo> Carrito { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FormularioAprobado = false;
                Spiner = false;
            }

            Carrito = ((Usuario)Session["usuario"]).Carrito;

        }

        protected void btnConfirmarCompra_Click(object sender, EventArgs e)
        {
            FormularioAprobado = true;
        }

        protected void btnFinalizar_Click(object sender, EventArgs e)
        {
            Usuario usuario = (Usuario)Session["usuario"];
            Compra compra = new Compra();
            ComprasNegocio compras = new ComprasNegocio();

            compra.IdUsuario = usuario.Id;
            compra.NroCompra = GenerarIdCompra();
            compra.Productos = usuario.Carrito;
            compra.Total = usuario.CalcularTotal();

            compra.NombreComprador = txtNombreConfirmar.Text;
            compra.Dni = int.Parse(txtDni.Text);
            compra.Direccion = txtDireccion.Text;
            compra.Localidad = txtLocalidad.Text;
            compra.CodigoPostal = int.Parse(txtCP.Text);
            compra.MetodoPago = int.Parse(ddlMetodoPago.SelectedItem.Value);
            Spiner = true;

            try
            {
                compras.agregarCompra(compra);
                Spiner = false;
                Response.Redirect("CompraRealizada.aspx", false);
            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }


            
        }

        private string GenerarIdCompra()
        {
            // Obtener la fecha y hora actual
            DateTime fechaHoraActual = DateTime.Now;

            // Obtener los ticks de la fecha y hora actual
            long ticks = fechaHoraActual.Ticks;

            // Convertir los ticks a un número entero
            string id = (ticks & 0x7FFFFFFF).ToString(); 

            return id;
        }
    }
}