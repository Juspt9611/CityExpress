using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SupportCenter.Datos;
using System.Data;

namespace SupportCenter.Negocio
{
    public class NGArticulos
    {
        DTArticulo Objeto = new DTArticulo();

        public int NG_RegistrarArt(string nombreArticulo, string contenido, string categorias, string tags)
        {
            return Objeto.DT_RegistrarArticulo(nombreArticulo, contenido, categorias, tags);
        }

        public DataSet NG_ConsultarArtxValidar()
        {
            return Objeto.DT_ConsultarArxtxValidar();
        }

        public DataSet NG_ConsultarArtEdicion(int idArt)
        {
            return Objeto.DT_ConsultarArtEdicion(idArt);
        }

        public DataSet NG_ConsultarCategorias(int idPadreCat)
        {
            return Objeto.DT_ConsultarCategorias(idPadreCat);
        }
    }
}
