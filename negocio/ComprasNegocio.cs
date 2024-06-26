﻿using dominio;
using System;
using System.Collections.Generic;

namespace negocio
{
    public class ComprasNegocio
    {
        public void agregarCompra(Compra compra)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setConsulta("INSERT INTO COMPRAS (IdUsuario, nroCompra, fecha, total, nombreComprador, dni, direccion, localidad, cp, metodoPago) " +
                  "VALUES (@IdUsuario, @NroCompra, @Fecha, @Total, @NombreComprador, @Dni, @Direccion, @Localidad, @Cp, @MetodoPago);");

                datos.setParams("@IdUsuario", compra.IdUsuario);
                datos.setParams("@NroCompra", compra.NroCompra);
                datos.setParams("@Fecha", compra.Fecha);
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

        public List<Compra> ListarCompras(Usuario usuario)
        {
            var listaCompras = new List<Compra>();
            var datos = new AccesoDatos();

            try
            {
                datos.setConsulta("select nroCompra,fecha,total,direccion,localidad,cp from COMPRAS where IdUsuario = @Id");
                datos.setParams("@Id", usuario.Id);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    var aux = new Compra();

                    aux.NroCompra = (string)datos.Lector["nroCompra"];
                    aux.Fecha = (DateTime)datos.Lector["fecha"];
                    aux.Total = (decimal)datos.Lector["total"];
                    aux.Direccion = (string)datos.Lector["direccion"];
                    aux.Localidad = (string)datos.Lector["localidad"];
                    aux.CodigoPostal = (int)datos.Lector["cp"];

                    listaCompras.Add(aux);
                }
                return listaCompras;

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

        public void ListarDetalle(Compra compra)
        {
            var datos = new AccesoDatos();
            try
            {
                compra.Productos = new List<Articulo>();
                datos.setConsulta("SELECT c.IdArticulo, c.cantidad, c.NroCompra,  a.Nombre, a.IdMarca, m.Descripcion, a.ImagenUrl, a.Precio FROM COMPRA_DETALLE as c INNER JOIN ARTICULOS a ON c.IdArticulo = a.Id INNER JOIN MARCAS m ON a.IdMarca = m.Id WHERE c.NroCompra = @NroCompra");
                datos.setParams("@NroCompra", compra.NroCompra);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    var aux = new Articulo();

                    aux.Id = (int)datos.Lector["IdArticulo"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Fabricante = new Marca();
                    aux.Fabricante.Nombre = (string)datos.Lector["Descripcion"];
                    aux.Precio = (decimal)datos.Lector["Precio"];
                    aux.UrlImg = (string)datos.Lector["ImagenUrl"];
                    aux.Cantidad = (int)datos.Lector["Cantidad"];
                    compra.Productos.Add(aux);
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
