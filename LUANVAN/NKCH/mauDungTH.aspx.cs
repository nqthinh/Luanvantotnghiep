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
    public partial class mauDungTH : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbNgay.Text = string.Format(" ngày {0} tháng {1:00} năm {2}", DateTime.Now.Day, DateTime.Now.Month, DateTime.Now.Year);
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connstring"].ToString()))
            {
                // Goi cau lenh procedure
                using (SqlCommand cmd = new SqlCommand("DUNGTHUCHIEN_SELECT_CHITIET", conn))
                {
                    //Gan keu truy van la Procedure
                    cmd.CommandType = CommandType.StoredProcedure;
                    //Truyen bien vao cau lenh
                    cmd.Parameters.AddWithValue("@TMDT_ID", Session["mauDungTH"].ToString());
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        lbTenCN.Text = (reader.IsDBNull(36) ? "" : reader.GetString(36));
                        lbMacb.Text = (reader.IsDBNull(35) ? "" : reader.GetString(35));
                        lbDonvi.Text = (reader.IsDBNull(43) ? "" : reader.GetString(43));
                        lbTenDT.Text = (reader.IsDBNull(2) ? "" : reader.GetString(2));
                        lbNgayBD.Text = (reader.IsDBNull(5) ? "" : reader.GetString(5));
                        lbKinhphiNhan.Text = (reader.IsDBNull(54) ? "" : reader.GetString(54));
                        lbLydo.Text = (reader.IsDBNull(55) ? "" : reader.GetString(55));
                        lbKinhphiHoan.Text = (reader.IsDBNull(56) ? "" : reader.GetString(56));
                        lbChuNhiem.Text = (reader.IsDBNull(36) ? "" : reader.GetString(36));

                    }

                    conn.Close();
                }
            }
        }

    }
}