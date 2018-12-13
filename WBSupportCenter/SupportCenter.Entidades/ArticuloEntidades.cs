using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SupportCenter.Entidades
{
    public class ArticuloEntidades
    {
        public string nombreArticulo { get; set; }
        public string autor { get; set; }
        public string contenido { get; set; }
        public int idEstatusArticulo { get; set; }
        public float version { get; set; }
        public DateTime fechaCreacion { get; set; }
    }
}
