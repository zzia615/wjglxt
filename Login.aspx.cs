using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace wjglxt
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                //获取界面数据
                string s_name = name.Value;
                string s_pwd = pwd.Value;


                DataTable table = new SqlServerHelper().QuerySqlDataTable("select * from Admin where name='" + s_name + "' and pwd='" + s_pwd + "'");

                //查询到数据
                if (table != null && table.Rows.Count > 0)
                {
                    Session[SessionData.登录用户] = s_name;
                    Session[SessionData.登录用户名称] = s_name;

                    Response.Write("<script>alert('登录成功');window.location.href='FileInfo.aspx';</script>");

                }
                else
                {
                    Response.Write("<script>alert('登录失败，用户名密码错误');</script>");
                }
            }
        }
    }
}