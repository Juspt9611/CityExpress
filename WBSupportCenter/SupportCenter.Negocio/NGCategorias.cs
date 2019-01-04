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
        public List<CategoriasxSubcategorias> NG_consultarCategorias() {
            DTCategorias Objeto = new DTCategorias();
            return Objeto.DT_consultarCategorias();
        }
        public List<CategoriasxSubcategorias> NG_getSinHijos() {
            DTCategorias Objeto = new DTCategorias();
            return Objeto.DT_getSinHijos();
        }

        public List<CategoriasxSubcategorias> NG_getSinPadres(int idPadre) {
            DTCategorias Objeto = new DTCategorias();
            return Objeto.DT_getSinPadres(idPadre);
        }

        public List<CategoriasxSubcategorias> NG_getSize(int idCategoria) {
            DTCategorias Objeto = new DTCategorias();
            return Objeto.DT_getSize(idCategoria);
        }
        public List<CategoriasxSubcategorias> NG_getList(int idCategoria) {
            DTCategorias Objeto = new DTCategorias();
            return Objeto.DT_getList(idCategoria);
        }


        public String NG_guardarRelacion(String nombreCategoria, int idCategoria) {
            DTCategorias Objeto = new DTCategorias();
            return Objeto.DT_guardarRelacion(nombreCategoria, idCategoria);
        }

        public String NG_guardarCategorias(String nombreCategoria, String descripcion) {
            DTCategorias Objeto = new DTCategorias();
            return Objeto.DT_guardarCategorias(nombreCategoria, descripcion);
        }

        public String NG_guardarCategoriasEdit(String nombreCategoria, String descripcion, int idCategoria) {
            DTCategorias Objeto = new DTCategorias();
            return Objeto.DT_guardarCategoriasEdit(nombreCategoria, descripcion, idCategoria);
        }

        public String NG_eliminarCategorias(int idCategoria) {
            DTCategorias Objeto = new DTCategorias();
            return Objeto.DT_eliminarCategorias(idCategoria);
        }

    }
}
