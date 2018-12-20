using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SupportCenter.Entidades {
    public class Articulos {

        public int idarticulo { get; set; }
        public string nombreArticulo { get; set; }
        public string autor { get; set; }
        public String contenido { get; set; }
        public int idEstatusArticulo { get; set; }
        public string version { get; set; }
        public string fechaCreacion { get; set; }
        
    }
}
