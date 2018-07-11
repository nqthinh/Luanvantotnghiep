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
	public partial class mauThuyetMinh : System.Web.UI.Page
	{
		string chuoiLV = "";
		string chuoiLH = "";
		string chuoispkh = "";
		string chuoispdt = "";
		string chuoispud = "";
		protected void Page_Load(object sender, EventArgs e)
		{
			//lbNgayThang.Text = " ngày " + DateTime.Now.Day + " tháng " + DateTime.Now.Month.ToString("00") + " năm " + DateTime.Now.Year;

			using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connstring"].ToString()))
			{
				// Goi cau lenh procedure
				using (SqlCommand cmd = new SqlCommand("THUYETMINHDETAI_SELECT_CHITIET", conn))
				{
					//Gan keu truy van la Procedure
					cmd.CommandType = CommandType.StoredProcedure;
					//Truyen bien vao cau lenh
					cmd.Parameters.AddWithValue("@TMDT_ID", Session["mathuyetminh"].ToString());
					conn.Open();
					SqlDataReader reader = cmd.ExecuteReader();

					while (reader.Read())
					{
						lbTenDeTai.Text = (reader.IsDBNull(2) ? "" : reader.GetString(2));
						chuoiLV = reader.GetString(3);
						chuoiLH = reader.GetString(4);
						lbTGTH.Text = (reader.IsDBNull(5) ? "" : reader.GetString(5));

						//Dienvao
						lbCQCT.Text = (reader.IsDBNull(6) ? "" : reader.GetString(6));
						lbDTCQCT.Text = (reader.IsDBNull(7) ? "" : reader.GetString(7));
						lbDCCQCT.Text = (reader.IsDBNull(8) ? "" : reader.GetString(8));
						lbTenCNDT.Text = (reader.IsDBNull(36) ? "" : reader.GetString(36));
						lbHocVi.Text = (reader.IsDBNull(53) ? "" : reader.GetString(53));
						lbChucDanh.Text = (reader.IsDBNull(55) ? "" : reader.GetString(55));
						lbDVCT.Text = (reader.IsDBNull(51) ? "" : reader.GetString(51));
                        lbSDT.Text = (reader.IsDBNull(41) ? "" : reader.GetString(41));
                        lbEmail.Text = (reader.IsDBNull(42) ? "" : reader.GetString(42));
                        lbNgoaiNuoc.Text = (reader.IsDBNull(13) ? "" : reader.GetString(13));
                        lbTrongNuoc.Text = (reader.IsDBNull(12) ? "" : reader.GetString(12));
                        lbTinhCapThiet.Text = (reader.IsDBNull(14) ? "" : reader.GetString(14));
                        lbMucTieu.Text = (reader.IsDBNull(15) ? "" : reader.GetString(15));
                        lbDTNC.Text = (reader.IsDBNull(29) ? "" : reader.GetString(29));
                        lbPVNC.Text = (reader.IsDBNull(30) ? "" : reader.GetString(30));
                        lbCachTC.Text = (reader.IsDBNull(31) ? "" : reader.GetString(31));
                        lbPPNC.Text = (reader.IsDBNull(32) ? "" : reader.GetString(32));
                        lbNoiDung.Text = (reader.IsDBNull(16) ? "" : reader.GetString(16));
                        lbHieuQua.Text = (reader.IsDBNull(21) ? "" : reader.GetString(21));
                        lbChuyenGiao.Text = (reader.IsDBNull(22) ? "" : reader.GetString(22));
                        lbKInhPhi.Text = (reader.IsDBNull(24) ? "" : reader.GetString(24));
                        lbNSNN.Text = (reader.IsDBNull(25) ? "" : reader.GetString(25));
                        lbKPKKHAC.Text = (reader.IsDBNull(26) ? "" : reader.GetString(26));
                        lbTenCN.Text = (reader.IsDBNull(36) ? "" : reader.GetString(36));

                        //da xong
                        chuoispkh = (reader.IsDBNull(17) ? "" : reader.GetString(17));
						chuoispdt = (reader.IsDBNull(18) ? "" : reader.GetString(18));
						chuoispud = (reader.IsDBNull(19) ? "" : reader.GetString(19));
						lbDonVi.Text = (reader.IsDBNull(51) ? "" : reader.GetString(51).ToUpper());

					}

					conn.Close();
				}
			}

			for (int i = 0; i < chkspud.Items.Count; i++)
			{
				if (chuoispud.Contains(chkspud.Items[i].Value.ToString()))
				{
					chkspud.Items[i].Selected = true;
				}
			}

			for (int i = 0; i < chkspdt.Items.Count; i++)
			{
				if (chuoispdt.Contains(chkspdt.Items[i].Value.ToString()))
				{
					chkspdt.Items[i].Selected = true;
				}
			}
			for (int i = 0; i < chkspkh.Items.Count; i++)
			{
				if (chuoispkh.Contains(chkspkh.Items[i].Value.ToString()))
				{
					chkspkh.Items[i].Selected = true;
				}
			}

		}

		protected void chkLVNC_DataBound(object sender, EventArgs e)
		{
			for (int i = 0; i < chkLVNC.Items.Count; i++)
			{
				if (chuoiLV.Contains(chkLVNC.Items[i].Value.ToString()))
				{
					chkLVNC.Items[i].Selected = true;
				}
			}
		}

		protected void chkLHNC_DataBound(object sender, EventArgs e)
		{
			for (int i = 0; i < chkLHNC.Items.Count; i++)
			{
				if (chuoiLH.Contains(chkLHNC.Items[i].Value.ToString()))
				{
					chkLHNC.Items[i].Selected = true;
				}
			}
		}
	}
}