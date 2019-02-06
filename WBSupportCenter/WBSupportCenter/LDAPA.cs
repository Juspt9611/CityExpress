using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.DirectoryServices;
using System.Linq;
using System.Web;

namespace WBSupportCenter {
    public class LDAPA {
        private string _path;
        private string _filterAttribute;
        public string info;
        private ArrayList listaPropiedades = new ArrayList();
        private ArrayList lstBusqueda = new ArrayList();

        public ArrayList getListaPropiedades() {
            return listaPropiedades;
        }

        public ArrayList getListaBusqueda() {
            return lstBusqueda;
        }

        public bool autenticado(string dominio, string usuario, string pass) {
            bool autenticado = false;
            if (usuario != "" && pass != "") {
                SearchResultCollection sResults = null;

                string acceso = dominio + @"\" + usuario;
                DirectoryEntry entry = new DirectoryEntry(ConfigurationManager.AppSettings["dominio_SupportCenter"].ToString(), usuario, pass);//cityexpress_dev.local
                entry.AuthenticationType = AuthenticationTypes.Secure;

                try {
                    //object obj = entry.NativeObject;
                    DirectorySearcher search = new DirectorySearcher(entry);
                    //search.Filter = "(samaccountname=" + usuario + ")";
                    search.Filter = "(samaccountname="+ usuario + ")";

                    string[] requiredProperties = new string[] { "cn", "givenname", "sn", "samaccountname", "mail" };
                    foreach (String property in requiredProperties)
                        search.PropertiesToLoad.Add(property);

                    SearchResult result = search.FindOne();

                    if (null == result) {
                        autenticado = false;
                    } else {
                        autenticado = true;
                        foreach (String property in requiredProperties)
                            foreach (Object myCollection in result.Properties[property])
                                listaPropiedades.Add(myCollection.ToString());
                    }

                    //Update the new path to the user in the directory.
                    _path = result.Path;
                    _filterAttribute = (string)result.Properties["cn"][0];

                } catch (Exception ex) {
                

                    return autenticado;
                    //throw new Exception("Error de autenticación. " + ex.Message);
                }
            }
            return autenticado;
        }

        public ArrayList GetGroups(string cn) {
            DirectorySearcher search = new DirectorySearcher(_path);
            search.Filter = "(cn=" + cn + ")";
            search.PropertiesToLoad.Add("memberOf");
            ArrayList grupos = new ArrayList();

            try {
                SearchResult result = search.FindOne();
                int propertyCount = result.Properties["memberOf"].Count;
                string dn;
                int equalsIndex, commaIndex;

                for (int propertyCounter = 0; propertyCounter < propertyCount; propertyCounter++) {
                    dn = (string)result.Properties["memberOf"][propertyCounter];
                    equalsIndex = dn.IndexOf("=", 1);
                    commaIndex = dn.IndexOf(",", 1);
                    if (-1 == equalsIndex) {
                        return null;
                    }
                    grupos.Add(dn.Substring((equalsIndex + 1), (commaIndex - equalsIndex) - 1));
                }
            } catch (Exception ex) {
                throw new Exception("Error obtaining group names. " + ex.Message);
            }
            return grupos;
        }


        public ArrayList getTodosUsuarios() {
            ArrayList cnUsuarios = new ArrayList();
            try {
                DirectoryEntry entry = new DirectoryEntry();
                entry.Path = _path;
                DirectorySearcher search = new DirectorySearcher(entry);
                search.PropertiesToLoad.Add("cn");


                SearchResultCollection allUsers = search.FindAll();

                foreach (SearchResult result in allUsers) {
                    if (result.Properties["cn"].Count > 0) {
                        cnUsuarios.Add(String.Format("{0,-20} : {1}", result.Properties["cn"][0].ToString()));
                    }
                }

            } catch (Exception exc) {
                cnUsuarios.Add("Error: " + exc.ToString());
            }

            return cnUsuarios;
        }
        //
        public string modificaPass(string nuevapass, string usuario, string viejapass) {
            string mensaje;
            try {
                DirectoryEntry entry = new DirectoryEntry();
                entry.Path = _path;
                DirectorySearcher search = new DirectorySearcher(entry);
                search.Filter = "(SAMAccountName=" + usuario + ")";
                search.PropertiesToLoad.Add("password");
                SearchResult result = search.FindOne();

                if (result != null) {
                    // create new object from search result  
                    DirectoryEntry entryToUpdate = result.GetDirectoryEntry();
                    entryToUpdate.Invoke("ChangePassword", new object[] { viejapass, nuevapass });
                    entryToUpdate.CommitChanges();
                    mensaje = "Contraseña modificada :)";
                } else mensaje = "No se pudo cambiar contraseña. Usuario no valido :(";
            } catch (Exception e) {
                mensaje = "Error: " + e.ToString();
            }
            return mensaje;
        }

        public bool BuscaUsuario(string dominio, string usuario, string pass,string usuarioB) {
            bool autenticado = false;
            if (usuario != "" && pass != "") {
                SearchResultCollection sResults = null;

                //string acceso = dominio + @"\" + usuario;
                DirectoryEntry entry = new DirectoryEntry(ConfigurationManager.AppSettings["dominio_SupportCenter"].ToString(), usuario, pass);
                entry.AuthenticationType = AuthenticationTypes.Secure;

                try {
                    //object obj = entry.NativeObject;
                    DirectorySearcher search = new DirectorySearcher(entry);
                    search.Filter = "(samaccountname=" + usuarioB + ")";

                    string[] requiredProperties = new string[] { "cn", "givenname", "sn", "samaccountname", "mail" };
                    foreach (String property in requiredProperties)
                        search.PropertiesToLoad.Add(property);

                    SearchResult result = search.FindOne();

                    if (null == result) {
                        lstBusqueda.Add("notuser");
                        autenticado = true;
                    } else {
                        autenticado = true;
                        foreach (String property in requiredProperties)
                            foreach (Object myCollection in result.Properties[property])
                                lstBusqueda.Add(myCollection.ToString());
                    }

                    //Update the new path to the user in the directory.
                    _path = result.Path;
                    _filterAttribute = (string)result.Properties["cn"][0];

                } catch (Exception ex) {
                    return autenticado;
                    //throw new Exception("Error de autenticación. " + ex.Message);
                }
            }
            return autenticado;
        }

    }
}