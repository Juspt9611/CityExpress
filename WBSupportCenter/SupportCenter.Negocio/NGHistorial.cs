using SupportCenter.Datos;
using SupportCenter.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SupportCenter.Negocio
{
    public class NGHistorial
    {
        DTHistorial Objeto = new DTHistorial();

        public List<Historial> NG_ConsultarHistorialArticulo(int idArt)
        {
            return Objeto.DT_ConsultarHistorialArticulo(idArt);
        }
    }
}
