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
    public partial class ArticulosLista : System.Web.UI.Page
    {
        public bool ListaVacia { get; set; }

        public bool FiltroAvanzado { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!Seguridad.esAdmin(Session["usuario"]))
            //{
            //    Session.Add("error", "Se requiere permisos de Admin para esta sección");
            //    Response.Redirect("Error.aspx");
            //}
            FiltroAvanzado = chkAvanzado.Checked;
            ListaVacia = false;

            if (!IsPostBack)
            {
                ddlCriterio.Items.Clear();
                ddlCriterio.Items.Add("Comienza con ");
                ddlCriterio.Items.Add("Termina con ");
                ddlCriterio.Items.Add("Contiene ");

            }

            try
            {
                ArticulosNegocio negocio = new ArticulosNegocio();
                List<Articulo> lista = negocio.listarArticulos();
                Session.Add("listaArticulos", lista);
                
                dgvArticulos.DataSource = Session["listaArticulos"];
                dgvArticulos.DataBind();

            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }



        }

        // Enviamos Id para modificarlo
        protected void dgvArticulos_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvArticulos.SelectedDataKey.Value.ToString();
            Response.Redirect("FormularioArticulos.aspx?id=" + id);
        }

        //Paginación
        protected void dgvArticulos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvArticulos.PageIndex = e.NewPageIndex;
            dgvArticulos.DataBind();
        }
        //Check eliminar
        protected void chkAvanzado_CheckedChanged(object sender, EventArgs e)
        {
            FiltroAvanzado = chkAvanzado.Checked;
            txtFiltro.Text = "";
            txtFiltro.Enabled = !FiltroAvanzado; //Para "toglear"
        }
        //Cambios del ddlcampo
        protected void ddlCampo_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCriterio.Items.Clear();

            if (ddlCampo.SelectedItem.ToString() == "Precio")
            {
                ddlCriterio.Items.Add("Igual a ");
                ddlCriterio.Items.Add("Mayor a ");
                ddlCriterio.Items.Add("Menor a ");
            }
            else
            {
                ddlCriterio.Items.Add("Comienza con ");
                ddlCriterio.Items.Add("Termina con ");
                ddlCriterio.Items.Add("Contiene ");
            }
        }

        //Filtro sencillo
        protected void txtFiltro_TextChanged(object sender, EventArgs e)
        {
            List<Articulo> lista = (List<Articulo>)Session["listaArticulos"];
            List<Articulo> listaFiltrada = lista.FindAll(x => x.Nombre.ToLower().Contains(txtFiltro.Text.ToLower()) ||
            x.Fabricante.Nombre.ToLower().Contains(txtFiltro.Text.ToLower()));

            dgvArticulos.DataSource = listaFiltrada;
            dgvArticulos.DataBind();

            ListaVacia = verificarVacio(listaFiltrada);
            
        }

        // Filtro AVanzado
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            ArticulosNegocio negocio = new ArticulosNegocio();

            //Validamos para que no se rompa

            if (ddlCampo.SelectedValue == "Precio")
            {
                if (string.IsNullOrEmpty(txtFiltroAvanzado.Text))
                {

                    return;
                }
            }

            List<Articulo> lista = negocio.filtrar(ddlCampo.SelectedItem.ToString(), ddlCriterio.SelectedItem.ToString(),
            txtFiltroAvanzado.Text);

            if (ddlEstado.SelectedIndex == 1)
                lista = lista.FindAll(x => x.Activo);
            else if (ddlEstado.SelectedIndex == 2)
                lista = lista.FindAll(x => !x.Activo);

            dgvArticulos.DataSource = lista;
            dgvArticulos.DataBind();

            
            ListaVacia = verificarVacio(lista);
        }

        private bool verificarVacio(List<Articulo> lista)
        {
            if (lista.Count == 0)
                return true;
            return false;
        }

    }


}
