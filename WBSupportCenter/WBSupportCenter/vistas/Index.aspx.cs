using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WBSupportCenter.WSsupport1;



namespace SupportCenter {
    public partial class Index : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {

            WSsupportCenterClass metodos = new WSsupportCenterClass();

            //metodos.dataMenu(1);

        }

    }
}