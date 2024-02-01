using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace Vista
{
    public partial class Detalle : System.Web.UI.Page
    {
        public Articulo articulo { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"] != null ? Request.QueryString["id"] : "";
            lblPrueba.Text = id;    
            try
            {
                ArticulosNegocio negocio = new ArticulosNegocio();
                articulo = (negocio.listarArticulos(id))[0];
                lblPrueba.Text = articulo.Id.ToString();

            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}