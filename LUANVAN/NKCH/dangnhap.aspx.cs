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
    public partial class dangnhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connstring"].ToString());
        protected void btndangnhap_Click(object sender, EventArgs e)
        {
            dangnhapnguoidung dnnd = new dangnhapnguoidung();
            Boolean flag = false;

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connstring"].ToString()))
            {
                // Goi cau lenh procedure
                using (SqlCommand cmd = new SqlCommand("DANGNHAP_SELECT_ROW_TKMK", conn))
                {
                    //Gan keu truy van la Procedure
                    cmd.CommandType = CommandType.StoredProcedure;
                    //Truyen bien vao cau lenh
                    cmd.Parameters.AddWithValue("@DN_ID", txttk.Text);
                    cmd.Parameters.AddWithValue("@DN_MATKHAU", txtmk.Text);
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        flag = true;
                        //txtTenDeTai.Text = reader.GetString(1);
                        dnnd.taikhoan = reader.GetString(0);
                        dnnd.cb_id = reader.GetString(1);
                        dnnd.cb_hoten = reader.GetString(4);
                        dnnd.cb_sdt = reader.GetString(5);
                        dnnd.cb_email = reader.GetString(6);
                        dnnd.vaitro = reader.GetString(9);
                    }

                    conn.Close();
                }

                if(flag)
                {
                    Session["dangnhap"] = dnnd;
					Session["MACB"] = dnnd.cb_id;
                    Response.Redirect("index.aspx");
                }

            }
            conn.Close();
        }
    }

}