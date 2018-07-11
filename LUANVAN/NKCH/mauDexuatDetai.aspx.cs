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
	public partial class mauDexuatDetai : System.Web.UI.Page
	{
		string chuoiLV = "";
		protected void Page_Load(object sender, EventArgs e)
		{

			lbNgayThang.Text = " ngày " + DateTime.Now.Day + " tháng " + DateTime.Now.Month.ToString("00") + " năm " + DateTime.Now.Year;

			using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connstring"].ToString()))
			{
				// Goi cau lenh procedure
				using (SqlCommand cmd = new SqlCommand("DANGKYDETAI_SELECT_ROW_BIEUMAU", conn))
				{
					//Gan keu truy van la Procedure
					cmd.CommandType = CommandType.StoredProcedure;
					//Truyen bien vao cau lenh
					cmd.Parameters.AddWithValue("@DKDT_ID", Session["madetai"].ToString());
					conn.Open();
					SqlDataReader reader = cmd.ExecuteReader();

					while (reader.Read())
					{
						lbTenDetai.Text = reader.GetString(1).ToUpper();
						chuoiLV = reader.GetString(2);
						lbTinhCapThiet.Text = reader.GetString(3);
						lbMucTieu.Text = reader.GetString(4);
						lbNoiDung.Text = reader.GetString(5);
						lbHieuQua.Text = reader.GetString(6);
						lbSanPham.Text = reader.GetString(7);
						lbNhuCauKinhPhi.Text = reader.GetString(8);
						lbDeTaiKinhPhi.Text = reader.GetString(9);
						lbNganSachTruong.Text = reader.GetString(10);
						lbCacNguonKPKhac.Text = reader.GetString(11);
						lbThoiGianNghienCuuDuKien.Text = (reader.IsDBNull(14) ? "" : reader.GetString(14));
						lbTenChuNhiemDetai.Text = reader.GetString(18);
					}

					conn.Close();
				}
			}
		}

		protected void CheckBoxList1_DataBound(object sender, EventArgs e)
		{
			for (int i = 0; i < 6; i++)
			{
				if (chuoiLV.Contains(CheckBoxList1.Items[i].Value.ToString()))
				{
					CheckBoxList1.Items[i].Selected = true;
				}
			}
		}
	}
}