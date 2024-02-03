using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
    public class UsuarioNegocio
    {
        public void insertarUsuario(Usuario nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setConsulta($"INSERT INTO USERS (email, pass, admin) VALUES ('{nuevo.Email}', '{nuevo.Password}', 0)");
                datos.ejecutarLectura();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public List<Usuario> listarUsuarios()
        {
            AccesoDatos datos = new AccesoDatos();
            List<Usuario> lista = new List<Usuario>();
            try
            {
                datos.setConsulta("SELECT email, admin FROM USERS");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Usuario aux = new Usuario();

                    aux.Email = (string)datos.Lector["email"];
                    aux.Admin = (bool)datos.Lector["admin"];

                    lista.Add(aux);
                }
                return lista;

            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public bool Login(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setConsulta($"SELECT Id, email, pass, nombre, apellido, urlImagenPerfil, admin FROM USERS where email = '{usuario.Email}' AND pass = '{usuario.Password}'");
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    usuario.Id = (int)datos.Lector["Id"];
                    usuario.Admin = (bool)datos.Lector["admin"];
                    if (!(datos.Lector["nombre"] is DBNull))
                        usuario.Nombre = (string)datos.Lector["nombre"];
                    if (!(datos.Lector["apellido"] is DBNull))
                        usuario.Apellido = (string)datos.Lector["apellido"];
                    if (!(datos.Lector["urlImagenPerfil"] is DBNull))
                        usuario.UrlImagen = (string)datos.Lector["urlImagenPerfil"];

                    return true;
                }
                return false;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }

        }

        public void actualizarUsuario(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setConsulta($"UPDATE USERS SET nombre ='{usuario.Nombre}', apellido = '{usuario.Apellido}', urlImagenPerfil = @imagen where Id = {usuario.Id} ");
                datos.setParams("@imagen", (object)usuario.UrlImagen ?? DBNull.Value);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}
