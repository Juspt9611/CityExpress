using SupportCenter.Datos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SupportCenter.Negocio
{
    public class NGPersonal
    {
        public int NG_RegistrarPer(string nombre, string apPaterno, string apMaterno, string idGrupo, string nombreUsuario, string contrasena, string idRol)
        {
            DTPersonal Objeto = new DTPersonal();
            return Objeto.DT_RegistrarPersonal(nombre, apPaterno, apMaterno, idGrupo, nombreUsuario, contrasena, idRol);
        }

        public DataSet NG_ConsultaPersonal()
        {
            DTPersonal Objeto = new DTPersonal();
            return Objeto.DT_ConsultaPersonal();
        }
    }
}
