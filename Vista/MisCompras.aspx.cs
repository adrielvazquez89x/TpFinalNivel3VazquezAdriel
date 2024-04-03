using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vista
{
    public partial class MisCompras : System.Web.UI.Page
    {
        public Usuario Usuario { get; set; }
        public List<Compra> MisComprasRealizadas { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario = (Usuario)Session["usuario"];
            var compras = new ComprasNegocio();

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
    }
}