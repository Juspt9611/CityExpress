using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WSModelosTrazabilidad.Models
{
    public class LecturasxBitacora
    {
        public int idLecturasxBitacora { get; set; }
        public int idBitacora { get; set; }
        public int idSensor { get; set; }
        public int idModulo { get; set; }
        public double valor { get; set; }

    }
}