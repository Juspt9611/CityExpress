﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código fue generado por una herramienta.
//     Versión de runtime:4.0.30319.42000
//
//     Los cambios en este archivo podrían causar un comportamiento incorrecto y se perderán si
//     se vuelve a generar el código.
// </auto-generated>
//------------------------------------------------------------------------------

// 
// Microsoft.VSDesigner generó automáticamente este código fuente, versión=4.0.30319.42000.
// 
#pragma warning disable 1591

namespace WBSupportCenter.WSsupport1 {
    using System;
    using System.Web.Services;
    using System.Diagnostics;
    using System.Web.Services.Protocols;
    using System.Xml.Serialization;
    using System.ComponentModel;
    using System.Data;
    
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.7.3056.0")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Web.Services.WebServiceBindingAttribute(Name="WSsupportCenterClassSoap", Namespace="http://tempuri.org/")]
    public partial class WSsupportCenterClass : System.Web.Services.Protocols.SoapHttpClientProtocol {
        
        private System.Threading.SendOrPostCallback WSOptenerArtOperationCompleted;
        
        private System.Threading.SendOrPostCallback WSOptenerCatgOperationCompleted;
        
        private System.Threading.SendOrPostCallback WSBusquedaTituloOperationCompleted;
        
        private System.Threading.SendOrPostCallback WSOpregistrarArtOperationCompleted;
        
        private System.Threading.SendOrPostCallback HelloWorldDataSetOperationCompleted;
        
        private bool useDefaultCredentialsSetExplicitly;
        
        /// <remarks/>
        public WSsupportCenterClass() {
            this.Url = global::WBSupportCenter.Properties.Settings.Default.WBSupportCenter_WSsupport1_WSsupportCenterClass;
            if ((this.IsLocalFileSystemWebService(this.Url) == true)) {
                this.UseDefaultCredentials = true;
                this.useDefaultCredentialsSetExplicitly = false;
            }
            else {
                this.useDefaultCredentialsSetExplicitly = true;
            }
        }
        
        public new string Url {
            get {
                return base.Url;
            }
            set {
                if ((((this.IsLocalFileSystemWebService(base.Url) == true) 
                            && (this.useDefaultCredentialsSetExplicitly == false)) 
                            && (this.IsLocalFileSystemWebService(value) == false))) {
                    base.UseDefaultCredentials = false;
                }
                base.Url = value;
            }
        }
        
        public new bool UseDefaultCredentials {
            get {
                return base.UseDefaultCredentials;
            }
            set {
                base.UseDefaultCredentials = value;
                this.useDefaultCredentialsSetExplicitly = true;
            }
        }
        
        /// <remarks/>
        public event WSOptenerArtCompletedEventHandler WSOptenerArtCompleted;
        
        /// <remarks/>
        public event WSOptenerCatgCompletedEventHandler WSOptenerCatgCompleted;
        
        /// <remarks/>
        public event WSBusquedaTituloCompletedEventHandler WSBusquedaTituloCompleted;
        
        /// <remarks/>
        public event WSOpregistrarArtCompletedEventHandler WSOpregistrarArtCompleted;
        
        /// <remarks/>
        public event HelloWorldDataSetCompletedEventHandler HelloWorldDataSetCompleted;
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/WSOptenerArt", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public Articulos[] WSOptenerArt() {
            object[] results = this.Invoke("WSOptenerArt", new object[0]);
            return ((Articulos[])(results[0]));
        }
        
        /// <remarks/>
        public void WSOptenerArtAsync() {
            this.WSOptenerArtAsync(null);
        }
        
        /// <remarks/>
        public void WSOptenerArtAsync(object userState) {
            if ((this.WSOptenerArtOperationCompleted == null)) {
                this.WSOptenerArtOperationCompleted = new System.Threading.SendOrPostCallback(this.OnWSOptenerArtOperationCompleted);
            }
            this.InvokeAsync("WSOptenerArt", new object[0], this.WSOptenerArtOperationCompleted, userState);
        }
        
        private void OnWSOptenerArtOperationCompleted(object arg) {
            if ((this.WSOptenerArtCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.WSOptenerArtCompleted(this, new WSOptenerArtCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/WSOptenerCatg", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public CategoriasxSubcategorias[] WSOptenerCatg() {
            object[] results = this.Invoke("WSOptenerCatg", new object[0]);
            return ((CategoriasxSubcategorias[])(results[0]));
        }
        
        /// <remarks/>
        public void WSOptenerCatgAsync() {
            this.WSOptenerCatgAsync(null);
        }
        
        /// <remarks/>
        public void WSOptenerCatgAsync(object userState) {
            if ((this.WSOptenerCatgOperationCompleted == null)) {
                this.WSOptenerCatgOperationCompleted = new System.Threading.SendOrPostCallback(this.OnWSOptenerCatgOperationCompleted);
            }
            this.InvokeAsync("WSOptenerCatg", new object[0], this.WSOptenerCatgOperationCompleted, userState);
        }
        
        private void OnWSOptenerCatgOperationCompleted(object arg) {
            if ((this.WSOptenerCatgCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.WSOptenerCatgCompleted(this, new WSOptenerCatgCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/WSBusquedaTitulo", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public BusquedaTitulo[] WSBusquedaTitulo(string palabra) {
            object[] results = this.Invoke("WSBusquedaTitulo", new object[] {
                        palabra});
            return ((BusquedaTitulo[])(results[0]));
        }
        
        /// <remarks/>
        public void WSBusquedaTituloAsync(string palabra) {
            this.WSBusquedaTituloAsync(palabra, null);
        }
        
        /// <remarks/>
        public void WSBusquedaTituloAsync(string palabra, object userState) {
            if ((this.WSBusquedaTituloOperationCompleted == null)) {
                this.WSBusquedaTituloOperationCompleted = new System.Threading.SendOrPostCallback(this.OnWSBusquedaTituloOperationCompleted);
            }
            this.InvokeAsync("WSBusquedaTitulo", new object[] {
                        palabra}, this.WSBusquedaTituloOperationCompleted, userState);
        }
        
        private void OnWSBusquedaTituloOperationCompleted(object arg) {
            if ((this.WSBusquedaTituloCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.WSBusquedaTituloCompleted(this, new WSBusquedaTituloCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/WSOpregistrarArt", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public int WSOpregistrarArt(string nombreArticulo, string contenido, int[] categorias) {
            object[] results = this.Invoke("WSOpregistrarArt", new object[] {
                        nombreArticulo,
                        contenido,
                        categorias});
            return ((int)(results[0]));
        }
        
        /// <remarks/>
        public void WSOpregistrarArtAsync(string nombreArticulo, string contenido, int[] categorias) {
            this.WSOpregistrarArtAsync(nombreArticulo, contenido, categorias, null);
        }
        
        /// <remarks/>
        public void WSOpregistrarArtAsync(string nombreArticulo, string contenido, int[] categorias, object userState) {
            if ((this.WSOpregistrarArtOperationCompleted == null)) {
                this.WSOpregistrarArtOperationCompleted = new System.Threading.SendOrPostCallback(this.OnWSOpregistrarArtOperationCompleted);
            }
            this.InvokeAsync("WSOpregistrarArt", new object[] {
                        nombreArticulo,
                        contenido,
                        categorias}, this.WSOpregistrarArtOperationCompleted, userState);
        }
        
        private void OnWSOpregistrarArtOperationCompleted(object arg) {
            if ((this.WSOpregistrarArtCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.WSOpregistrarArtCompleted(this, new WSOpregistrarArtCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/HelloWorldDataSet", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public System.Data.DataTable HelloWorldDataSet() {
            object[] results = this.Invoke("HelloWorldDataSet", new object[0]);
            return ((System.Data.DataTable)(results[0]));
        }
        
        /// <remarks/>
        public void HelloWorldDataSetAsync() {
            this.HelloWorldDataSetAsync(null);
        }
        
        /// <remarks/>
        public void HelloWorldDataSetAsync(object userState) {
            if ((this.HelloWorldDataSetOperationCompleted == null)) {
                this.HelloWorldDataSetOperationCompleted = new System.Threading.SendOrPostCallback(this.OnHelloWorldDataSetOperationCompleted);
            }
            this.InvokeAsync("HelloWorldDataSet", new object[0], this.HelloWorldDataSetOperationCompleted, userState);
        }
        
        private void OnHelloWorldDataSetOperationCompleted(object arg) {
            if ((this.HelloWorldDataSetCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.HelloWorldDataSetCompleted(this, new HelloWorldDataSetCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        public new void CancelAsync(object userState) {
            base.CancelAsync(userState);
        }
        
        private bool IsLocalFileSystemWebService(string url) {
            if (((url == null) 
                        || (url == string.Empty))) {
                return false;
            }
            System.Uri wsUri = new System.Uri(url);
            if (((wsUri.Port >= 1024) 
                        && (string.Compare(wsUri.Host, "localHost", System.StringComparison.OrdinalIgnoreCase) == 0))) {
                return true;
            }
            return false;
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Xml", "4.7.3056.0")]
    [System.SerializableAttribute()]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(Namespace="http://tempuri.org/")]
    public partial class Articulos {
        
        private int idarticuloField;
        
        private string nombreArticuloField;
        
        private string autorField;
        
        private string contenidoField;
        
        private int idEstatusArticuloField;
        
        private string versionField;
        
        private string fechaCreacionField;
        
        /// <remarks/>
        public int idarticulo {
            get {
                return this.idarticuloField;
            }
            set {
                this.idarticuloField = value;
            }
        }
        
        /// <remarks/>
        public string nombreArticulo {
            get {
                return this.nombreArticuloField;
            }
            set {
                this.nombreArticuloField = value;
            }
        }
        
        /// <remarks/>
        public string autor {
            get {
                return this.autorField;
            }
            set {
                this.autorField = value;
            }
        }
        
        /// <remarks/>
        public string contenido {
            get {
                return this.contenidoField;
            }
            set {
                this.contenidoField = value;
            }
        }
        
        /// <remarks/>
        public int idEstatusArticulo {
            get {
                return this.idEstatusArticuloField;
            }
            set {
                this.idEstatusArticuloField = value;
            }
        }
        
        /// <remarks/>
        public string version {
            get {
                return this.versionField;
            }
            set {
                this.versionField = value;
            }
        }
        
        /// <remarks/>
        public string fechaCreacion {
            get {
                return this.fechaCreacionField;
            }
            set {
                this.fechaCreacionField = value;
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Xml", "4.7.3056.0")]
    [System.SerializableAttribute()]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(Namespace="http://tempuri.org/")]
    public partial class BusquedaTitulo {
        
        private int idarticuloField;
        
        private string nombreArticuloField;
        
        /// <remarks/>
        public int idarticulo {
            get {
                return this.idarticuloField;
            }
            set {
                this.idarticuloField = value;
            }
        }
        
        /// <remarks/>
        public string nombreArticulo {
            get {
                return this.nombreArticuloField;
            }
            set {
                this.nombreArticuloField = value;
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Xml", "4.7.3056.0")]
    [System.SerializableAttribute()]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(Namespace="http://tempuri.org/")]
    public partial class CategoriasxSubcategorias {
        
        private int idCategoriasField;
        
        private int idPadreField;
        
        private int idHijoField;
        
        private string nombreCategoriaField;
        
        private string descripcionCategoriaField;
        
        private int estatusField;
        
        /// <remarks/>
        public int idCategorias {
            get {
                return this.idCategoriasField;
            }
            set {
                this.idCategoriasField = value;
            }
        }
        
        /// <remarks/>
        public int idPadre {
            get {
                return this.idPadreField;
            }
            set {
                this.idPadreField = value;
            }
        }
        
        /// <remarks/>
        public int idHijo {
            get {
                return this.idHijoField;
            }
            set {
                this.idHijoField = value;
            }
        }
        
        /// <remarks/>
        public string nombreCategoria {
            get {
                return this.nombreCategoriaField;
            }
            set {
                this.nombreCategoriaField = value;
            }
        }
        
        /// <remarks/>
        public string descripcionCategoria {
            get {
                return this.descripcionCategoriaField;
            }
            set {
                this.descripcionCategoriaField = value;
            }
        }
        
        /// <remarks/>
        public int estatus {
            get {
                return this.estatusField;
            }
            set {
                this.estatusField = value;
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.7.3056.0")]
    public delegate void WSOptenerArtCompletedEventHandler(object sender, WSOptenerArtCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.7.3056.0")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class WSOptenerArtCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal WSOptenerArtCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public Articulos[] Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((Articulos[])(this.results[0]));
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.7.3056.0")]
    public delegate void WSOptenerCatgCompletedEventHandler(object sender, WSOptenerCatgCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.7.3056.0")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class WSOptenerCatgCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal WSOptenerCatgCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public CategoriasxSubcategorias[] Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((CategoriasxSubcategorias[])(this.results[0]));
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.7.3056.0")]
    public delegate void WSBusquedaTituloCompletedEventHandler(object sender, WSBusquedaTituloCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.7.3056.0")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class WSBusquedaTituloCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal WSBusquedaTituloCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public BusquedaTitulo[] Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((BusquedaTitulo[])(this.results[0]));
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.7.3056.0")]
    public delegate void WSOpregistrarArtCompletedEventHandler(object sender, WSOpregistrarArtCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.7.3056.0")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class WSOpregistrarArtCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal WSOpregistrarArtCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public int Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((int)(this.results[0]));
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.7.3056.0")]
    public delegate void HelloWorldDataSetCompletedEventHandler(object sender, HelloWorldDataSetCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.7.3056.0")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class HelloWorldDataSetCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal HelloWorldDataSetCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public System.Data.DataTable Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((System.Data.DataTable)(this.results[0]));
            }
        }
    }
}

#pragma warning restore 1591