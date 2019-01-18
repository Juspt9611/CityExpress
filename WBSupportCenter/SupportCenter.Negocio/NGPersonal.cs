using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SupportCenter.Datos;

namespace SupportCenter.Negocio {
    public class NGPersonal
    {
        DTPersonal Objeto = new DTPersonal();
        public DataSet NGOptenerGrup()
        {
            return Objeto.DTLlenaGrupo();
        }
        public DataSet NGOptenerRol()
        {
            return Objeto.DTLlenaRoles();
        }
        public bool NGInsertarPers(string Nombres, string Apellido, string Usuario, string grupos, string rol)
        {

            return Objeto.DTInsertarPers(Nombres, Apellido, Usuario, grupos, rol);
        }
        public DataSet NGRolUser(string Usuario)
        {
            return Objeto.DTRolUser(Usuario);
        }
    }
}
