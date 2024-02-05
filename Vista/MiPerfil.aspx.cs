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
        public bool IsAnAdmin { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    if (Seguridad.sesionActiva(Session["usuario"]))
                    {
                        Usuario usuario = (Usuario)Session["usuario"];
                                                
                        saludo.InnerText = "Perfil de " + (string.IsNullOrEmpty(usuario.Nombre) ? "usuario" : usuario.Nombre);
                                            

                        txtEmail.Text = usuario.Email;
                        txtEmail.ReadOnly = true;

                        txtNombre.Text = usuario.Nombre;
                        txtApellido.Text = usuario.Apellido;

                        IsAnAdmin = usuario.Admin;

                        lblPrueba.Text = IsAnAdmin.ToString();

                        if (!string.IsNullOrEmpty(usuario.UrlImagen))
                        {
                            if (usuario.UrlImagen.Contains("http"))
                            {
                                imgNuevoPerfil.ImageUrl = usuario.UrlImagen;
                            }
                            else
                            {
                                imgNuevoPerfil.ImageUrl = "~/images/" + usuario.UrlImagen;
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);

            }

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {

            try
            {
                Usuario usuario = (Usuario)Session["usuario"];
                UsuarioNegocio negocio = new UsuarioNegocio();


                //Datos del usuario:
                usuario.Nombre = txtNombre.Text;
                usuario.Apellido = txtApellido.Text;

                negocio.actualizarUsuario(usuario);

                saludo.InnerText = "Perfil de " + (string.IsNullOrEmpty(usuario.Nombre) ? "usuario" : usuario.Nombre);

            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);

            }

        }

        protected void btnImg_Click(object sender, EventArgs e)
        {
            try
            {
                UsuarioNegocio negocio = new UsuarioNegocio();
                Usuario usuarioImg = (Usuario)Session["usuario"];

                string ruta = Server.MapPath("/images/");

                if (txtUrlImagen.Value != "")
                {
                    usuarioImg.UrlImagen = txtUrlImagen.Value;
                    lblPrueba.Text = "Cambio de imagen realizado";
                }

                if (txtImagen.PostedFile != null && txtImagen.PostedFile.ContentLength > 0)
                {
                    txtImagen.PostedFile.SaveAs(ruta + "perfil-" + usuarioImg.Id + ".jpg");
                    usuarioImg.UrlImagen = "perfil-" + usuarioImg.Id + ".jpg";
                }

                if( (string.IsNullOrEmpty(usuarioImg.UrlImagen)) && txtUrlImagen.Value == "" && txtImagen.PostedFile == null )
                {
                    return;
                }

                negocio.actualizarUsuario(usuarioImg);

                // Actualizar preview
                //Actualizar el avatar
                Image img = (Image)Master.FindControl("imgAvatar");

                if (img.ImageUrl.Contains("http"))
                {
                    img.ImageUrl = usuarioImg.UrlImagen;
                    imgNuevoPerfil.ImageUrl = usuarioImg.UrlImagen;
                }
                else
                {
                    img.ImageUrl = "~/images/" + usuarioImg.UrlImagen;
                    imgNuevoPerfil.ImageUrl = "~/images/" + usuarioImg.UrlImagen;
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