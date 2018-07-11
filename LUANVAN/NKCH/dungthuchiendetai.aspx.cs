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
    public partial class dungthuchiendetai : System.Web.UI.Page
    {
        taoma tm = new taoma();
        protected void Page_Load(object sender, EventArgs e)
        {
            txtid.Text = tm.taomangaunhien("GH");

            if (!IsPostBack)
            {
                //load noi dung de xuat de tai
                txtmadetai.Text = Session["DungThucHien"].ToString();
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connstring"].ToString()))
                {
                    // Goi cau lenh procedure
                    using (SqlCommand cmd = new SqlCommand("THUYETMINHDETAI_SELECT_ROW", conn))
                    {
                        //Gan keu truy van la Procedure
                        cmd.CommandType = CommandType.StoredProcedure;
                        //Truyen bien vao cau lenh
                        cmd.Parameters.AddWithValue("@TMDT_ID", txtmadetai.Text);

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
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connstring"].ToString()))
            {
                // Goi cau lenh procedure
                using (SqlCommand cmd = new SqlCommand("DUNGTHUCHIENDETAI_INSERT", conn))
                {
                    //Gan keu truy van la Procedure
                    cmd.CommandType = CommandType.StoredProcedure;
                    //Truyen bien vao cau lenh
                    cmd.Parameters.AddWithValue("@DTH_ID", txtid.Text);
                    cmd.Parameters.AddWithValue("@TMDT_ID", txtmadetai.Text);
                    cmd.Parameters.AddWithValue("@DTH_LIDO", txtlido.Text);
                    cmd.Parameters.AddWithValue("@DTH_KINHPHIDANHAN", txtkinhphidanhan.Text);
                    cmd.Parameters.AddWithValue("@DTH_KINHPHIHOANLAI", txtkinhphihoanlai.Text);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }
        }

        protected void btndanhsach_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/danhsacthuyetminhdetai.aspx");
        }
    }
}