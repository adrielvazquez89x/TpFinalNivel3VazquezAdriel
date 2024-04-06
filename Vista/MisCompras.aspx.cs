using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace Vista
{
    public partial class MisCompras : System.Web.UI.Page
    {
        public Usuario Usuario { get; set; }
        public List<Compra> MisComprasRealizadas { get; set; }
        public Compra CompraDetallada { get; set; }
        public bool Spinner { get; set; }
        public bool VerDetalle { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario = (Usuario)Session["usuario"];
            var compras = new ComprasNegocio();
            VerDetalle = false;

            try
            {
                MisComprasRealizadas = compras.ListarCompras(Usuario);
                repeater.DataSource = MisComprasRealizadas;
                repeater.DataBind();

            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }


        }

        protected void btnDetalle_Click(object sender, EventArgs e)
        {
            //Un get a la base de ddatos con el contenido
            Spinner = true;
            var negocio = new ComprasNegocio();
            string nroCompra = (((LinkButton)sender).CommandArgument);
            var compra = MisComprasRealizadas.Find(c => c.NroCompra == nroCompra);
            negocio.ListarDetalle(compra);
            CompraDetallada = compra;
           Spinner = false;


            VerDetalle = true;

        }
    }
}