using dominio;
using System;

namespace negocio
{
    public class ComprasNegocio
    {
        public void agregarCompra(Compra compra)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setConsulta("INSERT INTO COMPRAS (IdUsuario, nroCompra, total, nombreComprador, dni, direccion, localidad, cp, metodoPago) " +
                  "VALUES (@IdUsuario, @NroCompra, @Total, @NombreComprador, @Dni, @Direccion, @Localidad, @Cp, @MetodoPago);");

                datos.setParams("@IdUsuario", compra.IdUsuario);
                datos.setParams("@NroCompra", compra.NroCompra);
                datos.setParams("@Total", compra.Total);
                datos.setParams("@NombreComprador", compra.NombreComprador);
                datos.setParams("@Dni", compra.Dni);
                datos.setParams("@Direccion", compra.Direccion);
                datos.setParams("@Localidad", compra.Localidad);
                datos.setParams("@Cp", compra.CodigoPostal);
                datos.setParams("@MetodoPago", compra.MetodoPago);

                datos.ejecutarLectura();
                datos.cerrarConexion();


                foreach (var art in compra.Productos)
                {

                    datos.setConsulta("INSERT INTO COMPRA_DETALLE (NroCompra, IdArticulo, cantidad) VALUES (@NroC, @IdArticulo, @Cantidad)");

                    datos.setParams("@NroC", compra.NroCompra);
                    datos.setParams("@IdArticulo", art.Id);
                    datos.setParams("@Cantidad", art.Cantidad);

                    datos.ejecutarAccion();


                    datos.clearParams();
                    datos.cerrarConexion();

                }

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
