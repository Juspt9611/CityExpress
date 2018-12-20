using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SupportCenter.Datos;
using System.Data;
using SupportCenter.Entidades;

namespace SupportCenter.Negocio {
    public class NGBusqueda {

        

        public DataTable NG_ObtenerArt() {
            DTBusqueda Obejeto = new DTBusqueda();
            return Obejeto.DT_ObtenerArt();
        }
        public DataTable NG_ObtenerCatg() {
            DTBusqueda NG_Optener = new DTBusqueda();
            return NG_Optener.DT_ObtenerCatg();

                   
        }


    }
}
