using System;
using System.Collections.Generic;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
    public class FavoritosNegocio
    {
        public List<ArticuloFavorito> listarFavoritos(int id = 0)
        {
            List<ArticuloFavorito> listaFavoritos = new List<ArticuloFavorito>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                string consulta = "SELECT Id, IdUser, IdArticulo FROM FAVORITOS ";

                if(id != 0)
                {
                    consulta += " WHERE IdUser = " + id;
                }

                datos.setConsulta(consulta);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    ArticuloFavorito aux = new ArticuloFavorito();

                    aux.Id = (int)datos.Lector["Id"];
                    aux.IdUser = (int)datos.Lector["IdUser"];
                    aux.IdArticulo = (int)datos.Lector["IdArticulo"];

                    listaFavoritos.Add(aux);

                }
                return listaFavoritos;
            }

            catch (Exception)
            {

                throw;
            }
            finally
            {
                datos.cerrarConexion();
            }

            
        }

        public void agregarFavorito(int idUser, int idArticulo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setConsulta($"INSERT INTO FAVORITOS (IdUser, IdArticulo) VALUES ({idUser},{idArticulo})");
                datos.ejecutarLectura();
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

        public void eliminarFavorito(int idUser, int idArticulo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setConsulta($"DELETE FROM FAVORITOS WHERE IdUser = {idUser} AND IdArticulo = {idArticulo}");
                datos.ejecutarLectura();
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

        public void eliminacionMultiple(int IdUser, List<int> listaIds)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                string idsStringify = string.Join(",", listaIds);
                datos.setConsulta($"DELETE FROM FAVORITOS WHERE IdUser = {IdUser} AND IdArticulo IN ({idsStringify})");
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                
                throw ex;
            }
        }
    }
}
