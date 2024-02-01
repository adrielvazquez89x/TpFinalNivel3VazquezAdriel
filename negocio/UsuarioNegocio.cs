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
    }
}
