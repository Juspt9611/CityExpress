﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SupportCenter.Datos;
using System.Data;
using SupportCenter.Entidades;

namespace SupportCenter.Negocio
{
    public class NGArticulos
    {
        DTArticulo Objeto = new DTArticulo();

        public int NG_RegistrarArt(string nombreArticulo, string contenido, string categorias, string tags, string grupos, int idUsuario)
        {
            return Objeto.DT_RegistrarArticulo(nombreArticulo, contenido, categorias, tags, grupos, idUsuario);
        }

        public DataSet NG_ConsultarArtxCategoria(int idCategoria)
        {
            return Objeto.DT_ConsultarArtxCategoria(idCategoria);
        }

        public int NG_EditarArt(int idArticulo, string nombreArticulo, string contenido, string categorias, string tags, string grupos, int idUsuario)
        {
            return Objeto.DT_EditarArticulo(idArticulo, nombreArticulo, contenido, categorias, tags, grupos, idUsuario);
        }

        public DataSet NG_ConsultarArtxValidar(int idUsuario)
        {
            return Objeto.DT_ConsultarArxtxValidar(idUsuario);
        }

        public DataSet NG_ConsultarArtEdicion(int idArt)
        {
            return Objeto.DT_ConsultarArtEdicion(idArt);
        }

        public DataSet NG_ConsultarCategorias(int idPadreCat)
        {
            return Objeto.DT_ConsultarCategorias(idPadreCat);
        }

        public DataSet NG_ConsultarArtPorValidar(int idUsuario)
        {
            DTArticulo Objeto = new DTArticulo();
            return Objeto.DT_ConsultarArtPorValidar(idUsuario);
        }

        public String NG_guardarEstatusArticuloAprobar(int idArticulo, int estatus, String comentario)
        {
            DTArticulo Objeto = new DTArticulo();
            Console.WriteLine(comentario);
            return Objeto.DT_guardarEstatusArticuloAprobar(idArticulo, estatus, comentario);
        }

        public DataSet NG_ConsultarGruposxUsuario(int idUsuario)
        {
            DTArticulo Objeto = new DTArticulo();
            return Objeto.DT_ConsultarGruposxUsuario(idUsuario);
        }

        public List<Articulos> NG_ConsultarArtAprobados(int idUsuario)
        {
            return Objeto.DT_ConsultarArtAprobados(idUsuario);
        }

        public int NG_EliminarArticulo(int idArticulo)
        {
            return Objeto.DT_EliminarArticulo(idArticulo);
        }
    }
}

