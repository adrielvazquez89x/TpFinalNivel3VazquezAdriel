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
        public List<Articulo> ListaFavoritos { get; set; }

        public List<ArticuloFavorito> ListaIdsFavoritos { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    if (Seguridad.sesionActiva(Session["usuario"]))
                    {
                        Usuario usuario = (Usuario)Session["usuario"];
                        ListaIdsFavoritos = listarIds(usuario.Id);

                        ListaFavoritos = listarFavoritos(ListaIdsFavoritos);

                        ripiter.DataSource = ListaFavoritos;
                        ripiter.DataBind();
                    }
                }

            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);

            }
        }

        private List<ArticuloFavorito> listarIds(int idUsuario)
        {
            FavoritosNegocio favoritos = new FavoritosNegocio();
            List<ArticuloFavorito> lista = new List<ArticuloFavorito>();

            lista = favoritos.listarFavoritos(idUsuario);

            return lista;
        }

        private List<Articulo> listarFavoritos(List<ArticuloFavorito> listaIds)
        {
            List<Articulo> listaArticulos = new List<Articulo>();
            List<Articulo> listaAux = new List<Articulo>();
            ArticulosNegocio negocio = new ArticulosNegocio();

            listaAux = negocio.listarArticulos();

            foreach (Articulo art in listaAux)
            {
                foreach (ArticuloFavorito fav in listaIds)
                {
                    if (art.Id == fav.IdArticulo)
                    {
                        listaArticulos.Add(art);
                    }
                }
            }

            return listaArticulos;
        }

        protected void bntEliminar_Click(object sender, EventArgs e)
        {
            int idFav = int.Parse(((LinkButton)sender).CommandArgument);
            int idUser = ((Usuario)Session["usuario"]).Id;

            try
            {
                FavoritosNegocio negocio = new FavoritosNegocio();
                negocio.eliminarFavorito(idUser, idFav);

                ListaIdsFavoritos = listarIds(idUser);

                ListaFavoritos = listarFavoritos(ListaIdsFavoritos);

                ripiter.DataSource = ListaFavoritos;
                ripiter.DataBind();

            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }


        }


    }
}