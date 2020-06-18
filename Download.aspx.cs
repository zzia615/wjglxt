using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace wjglxt
{
    public partial class Download : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string s_name = Request.QueryString["name"];
                string s_url = Request.QueryString["url"];
                string s_path = MapPath(s_url);
                byte[] buffer = File.ReadAllBytes(s_path);

                string sql = "update fileinfo set xzcs=xzcs+1 where name='" + s_name + "'";
                new SqlServerHelper().ExecuteSql(sql);

                Response.BinaryWrite(buffer);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}