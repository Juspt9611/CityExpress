﻿using SupportCenter.Entidades;
using SupportCenter.Framework.AccesoDatos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SupportCenter.Datos
{
    public class DTHistorial
    {
        public List<Historial> DT_ConsultarHistorialArticulo(int idArt)
        {
            SqlConnection connection = null;

            try
            {
                using (connection = Conexion.ObtieneConexion("ConexionBD"))
                {
                    SqlDataReader consulta;

                    var paramHist = new[]

                    connection.Open();
                    consulta = Ejecuta.ProcedimientoAlmacenado(connection, "SP_HistorialArticulo", paramHist);
                    dt.Load(consulta);
                }

                foreach (DataRow item in dt.Rows)
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex);
            }

            return listaHistorial;
        }
    }
}