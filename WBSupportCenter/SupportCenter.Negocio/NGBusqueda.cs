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
        DTBusqueda Obejeto = new DTBusqueda();


        public List<Articulos> NG_ObtenerArt() {
            
            return Obejeto.DT_ObtenerArt();
        }
        public List<CategoriasxSubcategorias> NG_ObtenerCatg() {
            return Obejeto.DT_ObtenerCatg();                   
        }
        public List<BusquedaTitulo> NG_BusquedaTitulo(string palabra) {
            return Obejeto.DT_BusquedaTitulo(palabra);
        }

        public List<Articulos> NG_ConsultaArticuloxId(int idArt)
        {
            return Obejeto.DT_ConsultarArticuloxId(idArt);
        }

        public List<Articulos> NG_BusquedaArticulosxClick(string palabra)
        {
            return Obejeto.DT_BusquedaArticulosxClick(palabra);
        }

        public int NG_GuardarPalabraBuscada(string palabra)
        {
            return Obejeto.DT_GuardarPalabraBuscada(palabra);
        }

        public DataSet NG_BuscarArtMasVistos(int top)
        {
            return Obejeto.DT_BuscarArtMasVistos(top);
        }

        public int NG_RegistrarVisita(int idUsuario, int idArticulo)
        {
            return Obejeto.DT_RegistrarVisita(idUsuario, idArticulo);
        }

        public DataSet NG_ConsultarComentariosxArt(int idArticulo)
        {
            return Obejeto.DT_ConsultarComentariosxArt(idArticulo);
        }

        public int NG_RegistraValoracionxArticulo(int estrellas, int idArticulo, string comentario, int idUsuario)
        {
            return Obejeto.DT_RegistraValoracionxArticulo(estrellas, idArticulo, comentario, idUsuario);
        }


    }
}
