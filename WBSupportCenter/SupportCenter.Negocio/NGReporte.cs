using SupportCenter.Datos;
using SupportCenter.Entidades;
using System;
using System.Collections.Generic;
using System.Data;

namespace SupportCenter.Negocio
{
    public class NGReporte
    {
        public DTReporte DTReporte { get; private set; }
        public DTReporte Objeto { get; private set; }

        //public DataTable NG_ConsultaReporte(String fechaInicial, String fechaFinal)
        //{
        //    DTReporte Objeto = new DTReporte();
        //    DataTable varrr = Objeto.DT_ConsultaReporte(fechaInicial, fechaFinal);

        //    return varrr;

        //}

        public DataSet NGConsultaReportes(string fechaInicial, string fechaFinal, string valReporte, string valTop)
        {
            DTReporte Objeto = new DTReporte();

            return Objeto.DT_ConsultaReporte(fechaInicial, fechaFinal, valReporte, valTop) ;

        }
    }
}
