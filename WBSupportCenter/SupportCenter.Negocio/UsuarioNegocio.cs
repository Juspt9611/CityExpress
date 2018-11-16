using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SupportCenter.Datos;
using SupportCenter.Entidades;

namespace SupportCenter.Negocio {
    public class UsuarioNegocio {
        readonly UsuarioDatos UsuarioDatos = new UsuarioDatos();

        public List<UsuarioEntidades> DataUsuario() {

            return UsuarioDatos.DataUsuario();

        }

    }
}
