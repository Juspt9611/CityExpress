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


        public List<Articulos> NG_ObtenerArt(int idUsuario) {
            
            return Obejeto.DT_ObtenerArt(idUsuario);
        }
        public List<CategoriasxSubcategorias> NG_ObtenerCatg(int idUsuario) {
            return Obejeto.DT_ObtenerCatg(idUsuario);                   
        }
        public List<BusquedaTitulo> NG_BusquedaTitulo(string palabra) {
            return Obejeto.DT_BusquedaTitulo(palabra);
        }

        public DataSet NG_ConsultaArticuloxId(int idArt, int idUsuarioConsulta)
        {
            return Obejeto.DT_ConsultarArticuloxId(idArt, idUsuarioConsulta);
        }

        public DataSet NG_BusquedaArticulosxClick(string palabra, int idUsuario)
        {
            return Obejeto.DT_BusquedaArticulosxClick(palabra, idUsuario);
        }

        public int NG_GuardarPalabraBuscada(string palabra)
        {
            return Obejeto.DT_GuardarPalabraBuscada(palabra);
        }

        public DataSet NG_BuscarArtMasVistos(int top, int idUsuario)
        {
            return Obejeto.DT_BuscarArtMasVistos(top, idUsuario);
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
