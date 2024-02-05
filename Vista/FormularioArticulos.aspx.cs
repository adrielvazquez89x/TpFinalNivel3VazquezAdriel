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
    public partial class FormularioArticulos : System.Web.UI.Page
    {
        public bool ConfirmaEliminacion { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            CategoriasNegocio categorias = new CategoriasNegocio();
            MarcasNegocio marcas = new MarcasNegocio();
            ConfirmaEliminacion = false;


            if (!IsPostBack)
            {
                ddlMarca.DataSource = marcas.listarMarcas();
                ddlMarca.DataValueField = "Id";
                ddlMarca.DataTextField = "Nombre";
                ddlMarca.DataBind();

                ddlCategoria.DataSource = categorias.listarCategorias();
                ddlCategoria.DataValueField = "Id";
                ddlCategoria.DataTextField = "Descripcion";
                ddlCategoria.DataBind();

                txtId.Enabled = false;
                btnDesactivar.Enabled = false;
                btnEliminar.Enabled = false;
            }

            //Carga cuando se modifica:

            string id = Request.QueryString["id"] != null ? Request.QueryString["id"] : "";
            if (id != "" && !IsPostBack)
            {
                btnDesactivar.Enabled = true;
                btnEliminar.Enabled = true;

                ArticulosNegocio negocio = new ArticulosNegocio();
                //Usamos el id para retornar una lista con un solo elemento.
                List<Articulo> lista = negocio.listarArticulos(id);
                Articulo articulo = lista[0];

                // Guardamos en Session para los otros eventos
                Session.Add("articuloSeleccionado", articulo);

                txtId.Text = articulo.Id.ToString();
                txtCodigo.Text = articulo.Codigo.ToString();
                txtNombre.Text = articulo.Nombre.ToString();
                txtPrecio.Text = articulo.Precio.ToString();
                txtDescripcion.Text = articulo.Descripcion;
                txtUrl.Text = articulo.UrlImg;

                //Deslegables
                ddlCategoria.SelectedValue = articulo.Tipo.Id.ToString();
                ddlMarca.SelectedValue = articulo.Fabricante.Id.ToString();
                //imagen
                txtUrl_TextChanged(sender, e);

                //Check boton activar/desactivar
                if (!articulo.Activo)
                    btnDesactivar.Text = "Reactivar";
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            ArticulosNegocio negocio = new ArticulosNegocio();

            try
            {
                Articulo nuevo = new Articulo();

                nuevo.Codigo = txtCodigo.Text;
                nuevo.Nombre = txtNombre.Text;
                nuevo.Descripcion = txtDescripcion.Text;
                nuevo.UrlImg = txtUrl.Text;

                string precio = txtPrecio.Text.Trim();

                //Desplegables

                nuevo.Fabricante = new Marca();
                nuevo.Fabricante.Id = int.Parse(ddlMarca.SelectedValue);

                nuevo.Tipo = new Categoria();
                nuevo.Tipo.Id = int.Parse(ddlMarca.SelectedValue);

                //validacion de campos

                nuevo.Precio = Convert.ToDecimal(precio.Replace(".", ","));

                if (Request.QueryString["id"] != null)
                {
                    nuevo.Id = int.Parse(txtId.Text);
                    negocio.modificarArticulo(nuevo);
                }
                else
                {
                    negocio.agregarArticulo(nuevo);
                }

                Response.Redirect("ArticulosLista.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);


            }
        }

        protected void txtUrl_TextChanged(object sender, EventArgs e)
        {
            imgArticulo.ImageUrl = txtUrl.Text;
        }

        protected void btnDesactivar_Click(object sender, EventArgs e)
        {
            try
            {
                ArticulosNegocio negocio = new ArticulosNegocio();
                Articulo articulo = (Articulo)Session["articuloSeleccionado"];

                if (articulo.Activo)
                    negocio.eliminarArticulo(articulo);
                else
                    negocio.eliminarArticulo(articulo, true);


                Response.Redirect("ArticulosLista.aspx", false);

            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);

            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            ConfirmaEliminacion = true;
        }

        protected void btnConfirmarEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                if (chkConfirmarEliminacion.Checked)
                {
                    ArticulosNegocio negocio = new ArticulosNegocio();
                    Articulo seleccionado = (Articulo)Session["articuloSeleccionado"];
                    negocio.desaparecerDeLaFazDeLaBaseDeDatos(seleccionado.Id);
                    Response.Redirect("ArticulosLista.aspx", false);
                }
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}