using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;
using dominio;

namespace Vista
{
    public partial class Favoritos : System.Web.UI.Page
    {
        List<ArticuloFavorito> ListaFavoritos { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {


            try
            {
                if (!IsPostBack)
                {
                    if (Seguridad.sesionActiva(Session["usuario"]))
                    {
                        Usuario usuario = (Usuario)Session["usuario"];
                        FavoritosNegocio favoritos = new FavoritosNegocio();
                        ArticulosNegocio articulos = new ArticulosNegocio();

                        ListaFavoritos = favoritos.listarFavoritos(usuario.Id);

                        
                



                    }
                }




            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}