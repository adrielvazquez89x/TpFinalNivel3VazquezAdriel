using dominio;
using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace Vista
{
    public partial class Carrito : System.Web.UI.Page
    {
        public List<Articulo> ListaCompras { get; set; }
        public decimal TotalAPagar { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            //Comprobar session activa
            Usuario usuario = (Usuario)Session["usuario"];
            ListaCompras = usuario.Carrito;

            TotalAPagar = usuario.CalcularTotal();
            repeater.DataSource = ListaCompras;
            repeater.DataBind();

        }

        protected void btnAumentar_Click(object sender, EventArgs e)
        {
            var articuloId = int.Parse(((LinkButton)sender).CommandArgument);
            var articulo = ListaCompras.Find(art => art.Id == articuloId);

            articulo.Cantidad++;
            Response.Redirect(Request.RawUrl);
        }

        protected void btnDisminuir_Click(object sender, EventArgs e)
        {
            var articuloId = int.Parse(((LinkButton)sender).CommandArgument);
            var articulo = ListaCompras.Find(art => art.Id == articuloId);

            if (articulo.Cantidad > 1)
                articulo.Cantidad--;
            else
                ListaCompras.Remove(articulo);

            Response.Redirect(Request.RawUrl);
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            var articuloId = int.Parse(((LinkButton)sender).CommandArgument);
            var articulo = ListaCompras.Find(art => art.Id == articuloId);

            ListaCompras.Remove(articulo);
            Response.Redirect(Request.RawUrl);
        }

        protected void btnVaciarCarrito_Click(object sender, EventArgs e)
        {
            ListaCompras.Clear();
            Response.Redirect(Request.RawUrl);
        }
    }
}