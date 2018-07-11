using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using NKCH.myclass;

namespace NKCH
{
    public partial class doimatkhau : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connstring"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            txttk.Text = ((dangnhapnguoidung)Session["dangnhap"]).cb_email;
        }

        protected void btnluu_Click(object sender, EventArgs e)
        {
            DataTable dtResult = new DataTable();
            SqlParameter user = new SqlParameter("@CB_ID", txttk.Text);
            SqlParameter pass = new SqlParameter("@DN_MATKHAU", txtmkht.Text);
            SqlCommand cmd = new SqlCommand("DANGNHAP_SELECT_ROW", conn);
            cmd.Parameters.Add(user);
            cmd.Parameters.Add(pass);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter sqlda = new SqlDataAdapter(cmd);
            sqlda.Fill(dtResult);

            if (dtResult.Rows.Count.ToString() == "1")
            {
                if (txtmkm.Text != txtmkht.Text)
                {
                    if (txtmkm.Text == txtnhaplaimk.Text)
                    {
                        conn.Open();
                        SqlDataSource1.Update();
                        Label1.Text = "Đổi mật khẩu thành công";
                        conn.Close();
                    }
                    else
                        Label3.Text = "Không trùng khớp";
                }
                else
                    Label2.Text = "Mật khẩu mới không được trùng với mật khẩu hiện tại";
            }
            else
                Label1.Text = "Sai mật khẩu";
        }

        protected void btnhuy_Click(object sender, EventArgs e)
        {
            txtmkht.Text = "";
            txtmkm.Text = "";
            txtnhaplaimk.Text = "";
            Label1.Text = "";
            Label2.Text = "";
            Label3.Text = "";
        }
    }
}