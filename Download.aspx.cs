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

                string sql = "update fileinfo set xzcs=xzcs+1 where name='" + s_name + "'";
                new SqlServerHelper().ExecuteSql(sql);


                System.IO.FileInfo fi = new System.IO.FileInfo(s_path);
                Response.Clear();
                Response.ClearHeaders();
                Response.Buffer = false;
                Response.AppendHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode(Path.GetFileName(s_path), System.Text.Encoding.UTF8));
                Response.AppendHeader("Content-Length", fi.Length.ToString());
                Response.ContentType = "application/octet-stream";
                Response.WriteFile(s_path);
                Response.Flush();
                Response.End();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}