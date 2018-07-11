using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NKCH
{
    public partial class mauGiaHan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbNgayThang.Text = " ngày " + DateTime.Now.Day + " tháng " + DateTime.Now.Month.ToString("00") + " năm " + DateTime.Now.Year;
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connstring"].ToString()))
            {
                // Goi cau lenh procedure
                using (SqlCommand cmd = new SqlCommand("GIAHANDETAI_SELECT_CHITIET", conn))
                {
                    //Gan keu truy van la Procedure
                    cmd.CommandType = CommandType.StoredProcedure;
                    //Truyen bien vao cau lenh
                    cmd.Parameters.AddWithValue("@TMDT_ID", Session["mauGiaHan"].ToString());
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        lbCanBo.Text = (reader.IsDBNull(46) ? "" : reader.GetString(46));
                        lbCBID.Text = (reader.IsDBNull(45) ? "" : reader.GetString(45));
                        lbDonVi.Text = (reader.IsDBNull(57) ? "" : reader.GetString(57).ToUpper());
                        lbTenDeTai.Text = (reader.IsDBNull(8) ? "" : reader.GetString(8));
                        lbTGTH.Text = (reader.IsDBNull(11) ? "" : reader.GetString(11));
                        lbTGGH.Text = (reader.IsDBNull(2) ? "" : reader.GetString(2));
                        lbNoiDung.Text = (reader.IsDBNull(3) ? "" : reader.GetString(3));
                        lbLyDo.Text = (reader.IsDBNull(4) ? "" : reader.GetString(4));
                        lbKinhPhi.Text = (reader.IsDBNull(5) ? "" : reader.GetString(5));
                        lbCB.Text = (reader.IsDBNull(46) ? "" : reader.GetString(46));
                    }

                    conn.Close();
                }
            }
        }
    }
}