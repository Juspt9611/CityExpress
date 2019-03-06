using SupportCenter.Framework.AccesoDatos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SupportCenter.Entidades;

namespace SupportCenter.Datos
{
    public class DTReporte
    {



        //public DataTable DT_ConsultaReporte(String fechaInicial, String fechaFinal)
        //{
        //    SqlConnection connection = null;
        //    DataTable dt = new DataTable();
        //    try
        //    {
        //        using (connection = Conexion.ObtieneConexion("ConexionBD"))
        //        {
        //            SqlDataReader consulta;
        //            connection.Open();

        //            var parametros = new[]
        //           {
        //                ParametroAcceso.CrearParametro("@fechaInicio", SqlDbType.VarChar, fechaInicial, ParameterDirection.Input),
        //                ParametroAcceso.CrearParametro("@fechaFin", SqlDbType.VarChar, fechaFinal, ParameterDirection.Input),

        //            };

        //            consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_ReporteArticulosMasVistos", parametros);
        //            dt.Load(consulta);
        //            connection.Close();
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        Console.WriteLine(ex);
        //    }

        //    return dt;
        //}

        public DataSet DT_ConsultaReporte(string fechaInicial, string fechaFinal, string valReporte, string valTop)
        {
            SqlConnection connection = null;
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            List<Reporte> entidad = new List<Reporte>();

            try
            {
                using (connection = Conexion.ObtieneConexion("ConexionBD"))
                {

                    SqlDataReader consulta;

                    var parametros = new[]
                    {
                        ParametroAcceso.CrearParametro("@fechaInicio", SqlDbType.DateTime, fechaInicial, ParameterDirection.Input),
                        ParametroAcceso.CrearParametro("@fechaFin", SqlDbType.DateTime, fechaFinal, ParameterDirection.Input),
                        ParametroAcceso.CrearParametro("@top", SqlDbType.VarChar, valTop, ParameterDirection.Input)

                    };

                    connection.Open();
                    if (valReporte == "palabras")
                    {
                        consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_ReportePalabrasMasBuscadas", parametros);
                        dt.Load(consulta);
                    }
                    else if (valReporte == "valorados")
                    {
                        consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_ReporteArticulosMasValorados", parametros);
                        dt.Load(consulta);
                    }
                    else if (valReporte == "vistos")
                    {
                        consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_ReporteArticulosMasVistos", parametros);
                        dt.Load(consulta);
                    }
                    else if (valReporte == "vistas")
                    {
                        consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_ReporteCategoriasMasVistas", parametros);
                        dt.Load(consulta);
                    }
                    else if (valReporte == "accesos")
                    {
                        consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_ReporteAccesos", parametros);
                        dt.Load(consulta);
                    }

                    connection.Close();
                }

                ds.Tables.Add(dt);

                //foreach (DataRow item in dt.Rows)
                //{
                //    Reporte obj = new Reporte();

                //    if (valReporte == "palabras")
                //    {

                //        obj.palabraBuscada = item["PalabraBuscada"].ToString();
                //        obj.numeroDeBusquedas = Convert.ToInt32(item["NumeroDeBusquedas"].ToString());
                //        entidad.Add(obj);
                //    }
                //    else if (valReporte == "valorados")
                //    {
                //        obj.idArticulo = Convert.ToInt32(item["idArticulo"].ToString());
                //        obj.nombreArticulo = item["nombreArticulo"].ToString();
                //        obj.categoria = item["nombreCategoria"].ToString();
                //        obj.promedioCalificacion = Convert.ToInt32(item["PromedioCalificacion"].ToString());
                //        obj.calificacionTotal = Convert.ToInt32(item["calificacionTotal"].ToString());
                //        entidad.Add(obj);
                //    }
                //    else if (valReporte == "vistos")
                //    {
                //        obj.idArticulo = Convert.ToInt32(item["idArticulo"].ToString());
                //        obj.nombreArticulo = item["nombreArticulo"].ToString();
                //        obj.categoria = item["categoria"].ToString();
                //        obj.visitas = Convert.ToInt32(item["visitas"].ToString());
                //        entidad.Add(obj);
                //    }
                //    else if (valReporte == "vistas")
                //    {
                //        obj.categoria = item["nombreCategoria"].ToString();
                //        obj.categoriaMasVista = Convert.ToInt32(item["CategoriaMasVista"].ToString());
                //        entidad.Add(obj);
                //    } 
                //}
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }

            return ds;
        }
    }


}
