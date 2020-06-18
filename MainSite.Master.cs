using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace wjglxt
{
    public partial class MainSite : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session[SessionData.登录用户名称].AsString()))
            {
                //Response.Redirect("Login.aspx");
            }
        }
    }
}