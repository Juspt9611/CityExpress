using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SupportCenter.Entidades
{
    public class Personal {
        public int idPersonal { get; set; }
        public string nombre { get; set; }
        public string apPaterno { get; set; }
        public string apMaterno { get; set; }
        public string fechaCreacion { get; set; }
        public string estatus { get; set; }
        public string idGrupo { get; set; }
        public string nombreUsuario { get; set; }
        public string contrasena { get; set; }
        public string idRol { get; set; }
    }
}
