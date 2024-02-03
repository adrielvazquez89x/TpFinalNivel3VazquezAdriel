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
            if (Page is MiPerfil || Page is Favoritos)
            {
                if (!Seguridad.sesionActiva(Session["usuario"]))
                    Response.Redirect("Login.aspx", false);
                else
                {
                    Usuario usuario = (Usuario)Session["usuario"];
                    if (!string.IsNullOrEmpty(usuario.UrlImagen))
                    {

                        if (usuario.UrlImagen.Contains("http"))
                        {
                            imgAvatar.ImageUrl = usuario.UrlImagen;
                        }
                        else
                        {
                            imgAvatar.ImageUrl = "~/images/" + usuario.UrlImagen;
                        }
                    }
                }

            }
            else
            {
                if (Seguridad.sesionActiva(Session["usuario"]))
                {
                    Usuario usuario = (Usuario)Session["usuario"];
                    if (!string.IsNullOrEmpty(usuario.UrlImagen))
                    {

                        if (usuario.UrlImagen.Contains("http"))
                        {
                            imgAvatar.ImageUrl = usuario.UrlImagen;
                        }
                        else
                        {
                            imgAvatar.ImageUrl = "~/images/" + usuario.UrlImagen;
                        }
                    }
                }
            }

        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
    }
}