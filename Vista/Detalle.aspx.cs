using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;

namespace Vista
{
    public partial class Detalle : System.Web.UI.Page
    {
        // Para renderizar en Front
        public bool SesionActiva { get; set; }
        public bool ArticuloFaveado { get; set; }

        public Articulo ArticuloActual { get; set; }

        public Usuario UsuarioLogeado { get; set; }

        //Eventos
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"] != null ? Request.QueryString["id"] : "";
            ArticuloFaveado = false;
            btnAgregarCarrito.Enabled = false;
            btnAgregarCarrito.ToolTip = "Debes estar logeado para poder agregar al carrito";

            try
            {
                //Para saber si hay sesion activa y favorito
                FavoritosNegocio favoritos = new FavoritosNegocio();
                UsuarioLogeado = (Usuario)Session["usuario"];

                if (Seguridad.sesionActiva(UsuarioLogeado))
                {

                    SesionActiva = true;
                }

                ArticulosNegocio negocio = new ArticulosNegocio();
                ArticuloActual = (negocio.listarArticulos(id))[0];

                if (SesionActiva)
                {

                    ArticuloFaveado = checkearFavorito(ArticuloActual, UsuarioLogeado);

                    if (ArticuloActual.Activo)
                        btnAgregarCarrito.Enabled = true;

                }

            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnHeartChecked_Click(object sender, EventArgs e)
        {
            try
            {
                FavoritosNegocio negocio = new FavoritosNegocio();
                negocio.eliminarFavorito(UsuarioLogeado.Id, ArticuloActual.Id);
                ArticuloFaveado = false;

            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void bntHeart_Click(object sender, EventArgs e)
        {
            try
            {
                FavoritosNegocio negocio = new FavoritosNegocio();
                negocio.agregarFavorito(UsuarioLogeado.Id, ArticuloActual.Id);
                ArticuloFaveado = true;
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }

        //Métodos
        private bool checkearFavorito(Articulo articulo, Usuario usuario)
        {
            FavoritosNegocio negocio = new FavoritosNegocio();
            List<ArticuloFavorito> listaFavoritos = negocio.listarFavoritos();

            foreach (ArticuloFavorito favorito in listaFavoritos)
            {
                if (favorito.IdUser == usuario.Id && favorito.IdArticulo == articulo.Id)
                {
                    return true;
                }
            }

            return false;
        }


        protected void btnAgregarCarrito_Click(object sender, EventArgs e)
        {
            var articuloId = ArticuloActual.Id;
            var ListaCompras = ((Usuario)Session["usuario"]).Carrito;
            var articuloExistente = ListaCompras.FirstOrDefault(a => a.Id == articuloId);

            if (articuloExistente != null)
            {
                // El artículo ya está en el carrito, actualiza la cantidad
                articuloExistente.Cantidad++;
            }
            else
            {
                // El artículo no está en el carrito, agrégalo
                ArticuloActual.Cantidad = 1; // Otra cantidad inicial si es necesario
                UsuarioLogeado.Carrito.Add(ArticuloActual);
            }

            // Guarda el usuario actualizado en la sesión
            Session["usuario"] = UsuarioLogeado;

            // Redirige a la misma página para actualizar la vista
            Response.Redirect(Request.RawUrl);
        }

    }
}