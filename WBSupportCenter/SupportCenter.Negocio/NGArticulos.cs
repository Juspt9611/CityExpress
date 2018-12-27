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
        public int NG_RegistrarArt(string nombreArticulo, string contenido, int[] categorias)
        {
            DTArticulo Objeto = new DTArticulo();
            return Objeto.DT_RegistrarArticulo(nombreArticulo, contenido, categorias);
        }

        public DataSet NG_ConsultarArtxValidar()
        {
            DTArticulo Objeto = new DTArticulo();
            return Objeto.DT_ConsultarArxtxValidar();
        }

        public DataSet NG_ConsultarArtEdicion(int idArt)
        {
            DTArticulo Objeto = new DTArticulo();
            return Objeto.DT_ConsultarArtEdicion(idArt);
        }
        public DataSet NG_OptenerCat(int idArt) {
            DTArticulo Objeto = new DTArticulo();
            return Objeto.DT_ConsultarArtEdicion(idArt);
        }
    }
}
