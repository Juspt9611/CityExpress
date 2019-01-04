namespace SupportCenter.Entidades
{
    public class Reporte
    {
        public int idArticulo { get; set; }
        public string nombreArticulo { get; set; }
        public string categoria { get; set; }
        public int visitas { get; set; }

        public string palabraBuscada { get; set; }
        public int numeroDeBusquedas { get; set; }

        public int promedioCalificacion { get; set; }
        public int calificacionTotal { get; set; }

        public int categoriaMasVista { get; set; }
    }
}