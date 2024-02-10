using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
using dominio;
using negocio;

namespace Vista
{
    public partial class Registro : System.Web.UI.Page
    {
        public bool RegistroExistente { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            RegistroExistente = false;
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            try
            {
                //Primera validación, si pasan los filtros
                Page.Validate();
                if (!Page.IsValid)
                {
                    return;
                }

                Usuario nuevoUsuario = new Usuario();
                UsuarioNegocio negocio = new UsuarioNegocio();

                nuevoUsuario.Email = txtUserName.Text;
                nuevoUsuario.Password = txtPassword.Text;
                
                RegistroExistente = verificarExisten(nuevoUsuario);

                if (RegistroExistente)
                {
                    lblCorreoExistente.Visible = true;
                    return;
                }

               lblCorreoExistente.Visible = false;
               negocio.insertarUsuario(nuevoUsuario);

               negocio.Login(nuevoUsuario);


               Session.Add("usuario", nuevoUsuario);

               Response.Redirect("MiPerfil.aspx", false);


            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
                
            }

        }

        private bool verificarExisten(Usuario nuevo)
        {
            UsuarioNegocio negocio = new UsuarioNegocio();
            List<Usuario> usuariosExistentes = negocio.listarUsuarios();

            foreach (Usuario usuario in usuariosExistentes)
            {
                if (usuario.Email == nuevo.Email)
                {
                    return true;
                }
            }


            return false;
        }
    }

}