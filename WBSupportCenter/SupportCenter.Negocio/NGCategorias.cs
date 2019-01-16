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
        public int NG_RegistrarCategoria(string nombreCategoria, string descripcionCategoria)
        {
            DTCategorias Objeto = new DTCategorias();
            return Objeto.DT_RegistrarCategoria(nombreCategoria, descripcionCategoria);
        }

        public int NG_RegistrarSubCategoria(int idPadre, string nombreSubcategoria, string descripcionSubcategoria)
        {
            DTCategorias Objeto = new DTCategorias();
            return Objeto.DT_RegistrarSubCategoria(idPadre, nombreSubcategoria, descripcionSubcategoria);
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
