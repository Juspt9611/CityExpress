using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SupportCenter.Datos;
using System.Data;
using SupportCenter.Entidades;


namespace SupportCenter.Negocio
{
    public class NGCategorias {
        public int NG_RegistrarCategoria(string nombreCategoria)
        {
            DTCategorias Objeto = new DTCategorias();
            return Objeto.DT_RegistrarCategoria(nombreCategoria);
        }

        public int NG_RegistrarSubCategoria(int idPadre, string nombreSubcategoria)
        {
            DTCategorias Objeto = new DTCategorias();
            return Objeto.DT_RegistrarSubCategoria(idPadre, nombreSubcategoria);
        }

        public int NG_EditarCategorias(int idCat, string nombreCategoria)
        {
            DTCategorias Objeto = new DTCategorias();
            return Objeto.DT_EditarCategorias(idCat, nombreCategoria);
        }
        public List<CategoriasxSubcategorias> NG_EliminarCategorias(int idCat)
        {
            DTCategorias Objeto = new DTCategorias();
            return Objeto.DT_EliminarCategorias(idCat);
        }

        public List<CategoriasxSubcategorias> NG_ConsultarCategorias()
        {
            DTCategorias Objeto = new DTCategorias();
            return Objeto.DT_ConsultarCategorias();
        }

        public List<CategoriasxSubcategorias> NG_ConsultarSubcategorias(int idCat)
        {
            DTCategorias Objeto = new DTCategorias();
            return Objeto.DT_ConsultarSubcategorias(idCat);
        }
    }
}
