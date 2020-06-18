using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace wjglxt
{
    public partial class FileUpload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string file = FileUpload1.FileName;
            string s_path = Server.MapPath("\\"+file);
            FileUpload1.SaveAs(s_path);

            SqlServerHelper sql = new SqlServerHelper();
            DataTable table = sql.QuerySqlDataTable("select * from fileinfo where name = '" + file + "'");
            if (table.Rows.Count > 0)
            {
                Response.Write("<script>alert('文件已存在');</script>");
                return;
            }
            //插入数据
            sql.ExecuteSql("insert into fileinfo(name,url)values('" + file + "','" + file + "')");
            Response.Redirect("FileInfo.aspx");
        }
    }
}