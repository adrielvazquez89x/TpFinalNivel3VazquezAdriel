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
    public partial class Default : System.Web.UI.Page
    {
        public List<Articulo> ListaArticulos { get; set; }
        public bool FiltrosAplicados { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            //Cargar los articulos
            ArticulosNegocio negocio = new ArticulosNegocio();
            ListaArticulos = negocio.listarArticulos();
            Session.Add("listaArticulos", ListaArticulos);
            FiltrosAplicados = false;

            if (!IsPostBack)
            {

                //Cargar los despegables
                MarcasNegocio marcasNegocio = new MarcasNegocio();
                ddlMarcas.DataSource = marcasNegocio.listarMarcas();
                ddlMarcas.DataBind();

                CategoriasNegocio categoriasNegocio = new CategoriasNegocio();
                ddlCategorias.DataSource = categoriasNegocio.listarCategorias();
                ddlCategorias.DataBind();

                //Agregamos un valor mas al despegable, para poder seleccionar todos los elementos luego.
                ddlMarcas.Items.Insert(0, new ListItem("Todas", "Todas"));
                ddlCategorias.Items.Insert(0, new ListItem("Todas", "Todas"));

            }

        }

        protected void ddlMarcas_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Volver a ver este evento
        }

        protected void ddlOrdenar_SelectedIndexChanged(object sender, EventArgs e)
        {
            consola.Text = ddlOrdenar.SelectedIndex.ToString();
            if (ddlOrdenar.SelectedIndex == 0)
            {
                ListaArticulos = ListaArticulos.OrderBy(x => x.Nombre).ToList();

            }
            else if (ddlOrdenar.SelectedIndex == 1)
            {
                ListaArticulos = ListaArticulos.OrderByDescending(x => x.Nombre).ToList();
            }
            else if (ddlOrdenar.SelectedIndex == 2)
            {
                ListaArticulos = ListaArticulos.OrderBy(x => x.Precio).ToList();
            }
            else
            {
                ListaArticulos = ListaArticulos.OrderByDescending(x => x.Precio).ToList();
            }

        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            ListaArticulos = filtrar();
            FiltrosAplicados = true;

        }

        protected void btnLimpiarFiltros_Click(object sender, EventArgs e)
        {
            ListaArticulos = (List<Articulo>)Session["listaArticulos"];
            txtMaxPrecio.Text = "";
            txtMinPrecio.Text = "";
            FiltrosAplicados = false;
        }

        // Métodos y funciones.

        private List<Articulo> filtrarMarcas(string marca, List<Articulo> lista)
        {
            //Filtramos las marcas
            if (marca != "Todas")
            {
                List<Articulo> listaFiltrada = lista.FindAll(x => x.Fabricante.Nombre.ToLower().Contains(marca.ToLower()));
                return listaFiltrada;
            }

            return lista;
        }

        private List<Articulo> filtrarCategorias(string categoria, List<Articulo> lista)
        {
            //Filtramos las categorias
            if (categoria != "Todas")
            {
                List<Articulo> listaFiltrada = lista.FindAll(x => x.Tipo.Descripcion.ToLower().Contains(categoria.ToLower()));
                return listaFiltrada;
            }

            return lista;
        }

        private List<Articulo> filtrarPrecios(List<Articulo> lista)
        {
            //Filtramos los precios

            int minimo = 0;
            int maximo = 0;
            if (string.IsNullOrEmpty(txtMinPrecio.Text))
            {
                minimo = (int)obtenerMenorPrecio();
            }
            else
            {
                minimo = int.Parse(txtMinPrecio.Text);
            }
            if (string.IsNullOrEmpty(txtMaxPrecio.Text))
            {
                maximo = (int)obtenerMayorPrecio();
            }
            else
            {
                maximo = int.Parse(txtMaxPrecio.Text);
            }

            List<Articulo> listaFiltrada = lista.FindAll(x => x.Precio >= minimo && x.Precio <= maximo);
            return listaFiltrada;

        }

        private decimal obtenerMayorPrecio()
        {
            //Programación 1 mode on: 

            decimal maximo = 0;

            List<Articulo> lista = (List<Articulo>)Session["listaArticulos"];

            foreach (Articulo x in lista)
            {
                if (x.Precio > maximo)
                {
                    maximo = x.Precio;
                }
            }

            return maximo;
        }

        private decimal obtenerMenorPrecio()
        {
            //Programación 1 turbo mode on:
            List<Articulo> lista = (List<Articulo>)Session["listaArticulos"];

            decimal minimo = 0;

            for (int x = 0; x < lista.Count; x++)
            {
                if (x == 0)
                {
                    minimo = lista[x].Precio;
                }
                else
                {
                    if (lista[x].Precio < minimo)
                    {
                        minimo = lista[x].Precio;
                    }
                }

            }
            return minimo;

        }

        private List<Articulo> filtrar()
        {
            // Función de filtro completo.

            //Seleccionamos los valores de los desplegables.
            string marca = ddlMarcas.SelectedValue.ToString();
            string categoria = ddlCategorias.SelectedValue.ToString();

            List<Articulo> listaFiltrada = (List<Articulo>)Session["listaArticulos"];

            listaFiltrada = filtrarMarcas(marca, filtrarCategorias(categoria, filtrarPrecios(listaFiltrada)));

            aplicarFiltros(marca, categoria);

            return listaFiltrada;
        }

        private void aplicarFiltros(string marca, string categoria)
        {

            lblCategoria.Text = "";
            lblCategoria.Text += "Categoria: " + categoria;
            lblMarcas.Text = "";
            lblMarcas.Text += "Marca: " + marca;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            List<Articulo> lista = (List<Articulo>)Session["listaArticulos"];


            List<Articulo> listaBusqueda =
                lista.FindAll(x => x.Nombre.ToLower().Contains(txtBuscar.Text.ToLower()) ||
            (x.Fabricante.Nombre.ToLower().Contains(txtBuscar.Text.ToLower())) ||
            (x.Tipo.Descripcion.ToLower().Contains(txtBuscar.Text.ToLower())));



            ListaArticulos = listaBusqueda;
        }
    }
}