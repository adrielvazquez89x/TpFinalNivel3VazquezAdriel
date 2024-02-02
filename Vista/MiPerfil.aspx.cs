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
    public partial class MiPerfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
			try
			{
				if (!IsPostBack)
				{
					if (Seguridad.sesionActiva(Session["usuario"]))
					{
						Usuario usuario = (Usuario)Session["usuario"];

						txtEmail.Text = usuario.Email;
						txtEmail.ReadOnly = true;

						txtNombre.Text = usuario.Nombre;
						txtApellido.Text  = usuario.Apellido;
					}
				}
			}
			catch (Exception ex)
			{
				Session.Add("error", ex.ToString());
				Response.Redirect("Error.aspx", false);
				
			}

        }
    }
}