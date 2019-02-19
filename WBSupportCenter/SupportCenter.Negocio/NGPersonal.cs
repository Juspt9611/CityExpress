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
        public DataSet NGOptenerGrup(int idUsuario)
        {
            return Objeto.DTLlenaGrupo(idUsuario);
        }
        public DataSet NGOptenerRol()
        {
            return Objeto.DTLlenaRoles();
        }
        public bool NGInsertarPers(int idCreador, string Nombres, string Apellido, string Usuario, string grupos, string rol)
        {
            return Objeto.DTInsertarPers(idCreador, Nombres, Apellido, Usuario, grupos, rol);
        }

        public bool NGEditarPers(int idPersonal, int idUsuario, string idGrupo, int idRol)
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

        public List<UsuarioEntidades> NG_ConsultarUsuarioExist(string nombreUsuario)
        {
            return Objeto.DT_ConsultarUsuarioExist(nombreUsuario);
        }
    }
}
