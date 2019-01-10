using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SupportCenter.Entidades
{
    public class Historial
    {
        public int idArticulo { get; set; }
        public string nombreArticulo { get; set; }
        public int version { get; set; }
        public string contenido { get; set; }
        public string fechaCreacion { get; set; }
        public string fechaModificacion { get; set; }
        public string nombre { get; set; }
    }
}
