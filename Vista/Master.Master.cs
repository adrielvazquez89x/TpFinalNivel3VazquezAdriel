using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;

namespace Vista
{
    public partial class Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            imgAvatar.ImageUrl = "https://cdn-icons-png.flaticon.com/512/9131/9131529.png";

            if (Seguridad.sesionActiva(Session["usuario"]))
            {
                Usuario usuario = (Usuario)Session["usuario"];
                string urlImagen = usuario.UrlImagen;

                if (!string.IsNullOrEmpty(urlImagen))
                {
                    imgAvatar.ImageUrl = urlImagen.Contains("http") ? urlImagen : "~/images/" + urlImagen;
                }
            }
            else if (Page is MiPerfil || Page is Favoritos)
            {
                Response.Redirect("Login.aspx", false);
            }
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
    }
}