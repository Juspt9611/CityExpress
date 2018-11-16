using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WSModelosTrazabilidad.Models
{
    public class Bitacora
    {
        public int idBitacora { get; set; }
        public int idEtapaxProceso { get; set; }
        public DateTime fechaInicio { get; set; }
        public DateTime fechaFin { get; set; }


    }
}