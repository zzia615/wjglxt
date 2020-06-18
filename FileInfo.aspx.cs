using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace wjglxt
{
    public partial class FileInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string s_file = tbFileName.Text;
            string sql = "select * from fileinfo where 1=1 ";
            if (!string.IsNullOrEmpty(s_file))
            {
                sql += " and name like N'%" + s_file + "%'";
            }
            SqlDataSource1.SelectCommand = sql;
            GridView1.DataBind();
        }
    }
}