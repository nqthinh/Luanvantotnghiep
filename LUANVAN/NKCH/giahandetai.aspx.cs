using NKCH.myclass;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace NKCH
{
    public partial class giahandetai : System.Web.UI.Page
    {
        taoma tm = new taoma();
        protected void Page_Load(object sender, EventArgs e)
        {
            txtid.Text = tm.taomangaunhien("GH");

            if (!IsPostBack)
            {
                //load noi dung de xuat de tai
                txtmathuyetminh.Text = Session["GiaHan"].ToString();
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connstring"].ToString()))
                {
                    // Goi cau lenh procedure
                    using (SqlCommand cmd = new SqlCommand("THUYETMINHDETAI_SELECT_ROW", conn))
                    {
                        //Gan keu truy van la Procedure
                        cmd.CommandType = CommandType.StoredProcedure;
                        //Truyen bien vao cau lenh
                        cmd.Parameters.AddWithValue("@TMDT_ID", txtmathuyetminh.Text);

                        conn.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        while (reader.Read())
                        {
                            txttendetai.Text = reader.GetString(2);
                        }
                        conn.Close();
                    }
                }
            }
        }

        protected void btnluu_Click(object sender, EventArgs e)
        {
            //Tao ket noi CSDL
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connstring"].ToString()))
            {
                // Goi cau lenh procedure
                using (SqlCommand cmd = new SqlCommand("GIAHANDETAI_INSERT", conn))
                {
                    //Gan keu truy van la Procedure
                    cmd.CommandType = CommandType.StoredProcedure;
                    //Truyen bien vao cau lenh
                    cmd.Parameters.AddWithValue("@GHDT_ID", txtid.Text);
                    cmd.Parameters.AddWithValue("@TMDT_ID", txtmathuyetminh.Text);
                    cmd.Parameters.AddWithValue("@GHDT_THOIGIANGIAHAN", txttggh.Text);
                    cmd.Parameters.AddWithValue("@GHDT_NOIDUNG", txtnoidung.Text);
                    cmd.Parameters.AddWithValue("@GHDT_LIDO", txtlido.Text);
                    cmd.Parameters.AddWithValue("@GHDT_KINHPHIGIAHAN", txtkinhphi.Text);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }

            //Session["mauGiaHan"] = txtmathuyetminh.Text;
            //Response.Redirect("mauGiaHan.aspx");
        }

        protected void btndanhsach_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/danhsachthuyetminhdetai.aspx");
        }
    }
}