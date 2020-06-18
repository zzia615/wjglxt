using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Text;

    public class SqlServerHelper
    {
        private readonly string conStr;
        public SqlServerHelper()
        {
            conStr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
        }
        public SqlServerHelper(string conStr)
        {
            this.conStr = conStr;
        }

        public System.Data.SqlClient.SqlConnection CreateCon()
        {
            return new System.Data.SqlClient.SqlConnection(conStr);
        }

        public int ExecuteSql(string sql)
        {
            using (var con = CreateCon())
            {
                con.Open();
                var trans = con.BeginTransaction();
                try
                {
                    int ret = con.ExecuteSql(sql, trans);
                    trans.Commit();
                    return ret;
                }
                catch (Exception ex)
                {
                    trans.Rollback();
                    throw ex;
                }
            }
        }

        public DataTable QuerySqlDataTable(string sql)
        {
            using (var con = CreateCon())
            {
                DataTable table = new DataTable();
                System.Data.SqlClient.SqlDataAdapter dapt = new System.Data.SqlClient.SqlDataAdapter(sql, con);
                dapt.Fill(table);
                return table;
            }
        }

        public DataSet QuerySqlDataSet(string sql)
        {
            using (var con = CreateCon())
            {
                DataSet ds = new DataSet();
                System.Data.SqlClient.SqlDataAdapter dapt = new System.Data.SqlClient.SqlDataAdapter(sql, con);
                dapt.Fill(ds);
                return ds;
            }
        }
    }

public static class SqlServerHelperExt
{
    public static int ExecuteSql(this System.Data.SqlClient.SqlConnection con, string sql, System.Data.SqlClient.SqlTransaction trans)
    {
        var cmd = con.CreateCommand();
        cmd.CommandText = sql;
        cmd.CommandType = System.Data.CommandType.Text;
        cmd.Transaction = trans;
        return cmd.ExecuteNonQuery();
    }
}