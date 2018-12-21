using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SupportCenter.Entidades {
    public class CategoriasxSubcategorias {

        public int idCategorias { get; set; }
        public int idPadre { get; set; }
        public int idHijo { get; set; }        
        public string nombreCategoria { get; set; }
        public string descripcionCategoria { get; set; }
        public int estatus { get; set; }
    }
}
