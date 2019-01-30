using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SupportCenter.Datos;
using SupportCenter.Entidades;

namespace SupportCenter.Negocio
{
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

        public bool NGEditarPers(int idPersonal, int idUsuario, int idGrupo, int idRol)
        {
            return Objeto.DTEditarPers(idPersonal, idUsuario, idGrupo, idRol);
        }

        public DataSet NGRolUser(string Usuario)
        {
            return Objeto.DTRolUser(Usuario);
        }

        public List<UsuarioEntidades> NG_ConsultarUsuarioxAdmin(string usuario)
        {
            return Objeto.DT_ConsultarUsuariosxAdmin(usuario);
        }
    }
}
