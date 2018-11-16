using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SupportCenter.Entidades;
using SupportCenter.Framework.AccesoDatos;
using System.Data;
using System.Data.SqlClient;


namespace SupportCenter.Datos {
    public class UsuarioDatos {

       public List<UsuarioEntidades> DataUsuario() {

            List<UsuarioEntidades> datosUsuario = new List<UsuarioEntidades>();
            SqlConnection connection = null;
            DataTable dt = new DataTable();

            try {

                using (connection = Conexion.ObtieneConexion("ConexionBD")) {
                    SqlDataReader consulta;
                    connection.Open();
                    consulta = Ejecuta.ConsultaConRetorno(connection, "SELECT * FROM RecursosHumanos.Personal");
                    dt.Load(consulta);
                    connection.Close();
                }

                foreach (DataRow row in dt.Rows) {

                }

            } catch {


            }

            return datosUsuario;

        } 


    }
}
