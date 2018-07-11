using NKCH.myclass;
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
    public partial class thuyetminhdetai : System.Web.UI.Page
    {
		List<thanhvien> thanhviens;
		string chuoiLV = "";
		string chuoiLH = "";
		string chuoispkh = "";
		string chuoispdt = "";
		string chuoispud = "";

		protected void Page_Load(object sender, EventArgs e)
        {
			if (ViewState["stateThanhVien"] != null)
			{
				thanhviens = (List<thanhvien>)ViewState["stateThanhVien"];
			}
			else
			{
				thanhviens = new List<thanhvien>();
			}

			GridView1.DataSource = thanhviens;
			GridView1.DataBind();

			if (!IsPostBack)
			{
				thanhviens = new List<thanhvien>();

				//load noi dung de xuat de tai
				txtMaThuyetMinh.Text = Session["CapNhatThuyetMinh"].ToString();

				using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connstring"].ToString()))
				{
					// Goi cau lenh procedure
					using (SqlCommand cmd = new SqlCommand("THUYETMINHDETAI_SELECT_ROW", conn))
					{
						//Gan keu truy van la Procedure
						cmd.CommandType = CommandType.StoredProcedure;
						//Truyen bien vao cau lenh
						cmd.Parameters.AddWithValue("@TMDT_ID", txtMaThuyetMinh.Text);
						conn.Open();
						SqlDataReader reader = cmd.ExecuteReader();

						while (reader.Read())
						{
							txtMaDeTai.Text = reader.GetString(1);
							txtTenDeTai.Text = reader.GetString(2);
							chuoiLV = reader.GetString(3);
							chuoiLH = (reader.IsDBNull(4)? "" : reader.GetString(4));
							txtTGThucHien.Text = (reader.IsDBNull(5) ? "" : reader.GetString(5));
							txtCQCTDT.Text = (reader.IsDBNull(6) ? "" : reader.GetString(6));
							txtSDTCQCTDT.Text = (reader.IsDBNull(7) ? "" : reader.GetString(7));
							txtDCCQCTDT.Text = (reader.IsDBNull(8) ? "" : reader.GetString(8));
							txtDVTH.Text = (reader.IsDBNull(9) ? "" : reader.GetString(9));
							txtSDTDVTH.Text = (reader.IsDBNull(10) ? "" : reader.GetString(10));
							txtDCTDVTH.Text = (reader.IsDBNull(11) ? "" : reader.GetString(11));
							ckeTrongNuoc.Text = (reader.IsDBNull(12) ? "" : reader.GetString(12));
							ckeNgoaiNuoc.Text = (reader.IsDBNull(13) ? "" : reader.GetString(13));


							ckeDoiTuongNghienCuu.Text = (reader.IsDBNull(13) ? "" : reader.GetString(29));
							ckephamvinghiencuu.Text = (reader.IsDBNull(13) ? "" : reader.GetString(30));
							ckecachtiepcan.Text = (reader.IsDBNull(13) ? "" : reader.GetString(31));
							ckephuongphapnghiencuu.Text = (reader.IsDBNull(13) ? "" : reader.GetString(32));


							ckeTinhCapThiet.Text = reader.GetString(14);
							ckeMucTieu.Text = reader.GetString(15);
							ckeNoiDung.Text = reader.GetString(16);

							chuoispkh = (reader.IsDBNull(17) ? "" : reader.GetString(17));
							chuoispdt = (reader.IsDBNull(18) ? "" : reader.GetString(18));
							chuoispud = (reader.IsDBNull(19) ? "" : reader.GetString(19));

							txtSanPhamKhac.Text = (reader.IsDBNull(20) ? "" : reader.GetString(20));
							ckeHieuQua.Text = reader.GetString(21);
							ckePTChuyenGiao.Text = (reader.IsDBNull(22) ? "" : reader.GetString(22));

							txtGioNCKH.Text = reader.GetString(23);
							txtKinhPhi.Text = reader.GetString(24);
							txtNganSachTruong.Text = reader.GetString(25);
							txtCacNguonKPKhac.Text = reader.GetString(26);
						}

						conn.Close();
					}
				}

				using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connstring"].ToString()))
				{
					// Goi cau lenh procedure
					using (SqlCommand cmd = new SqlCommand("DKDT_THANHVIEN_SELECTDETAI", conn))
					{
						//Gan keu truy van la Procedure
						cmd.CommandType = CommandType.StoredProcedure;
						//Truyen bien vao cau lenh
						cmd.Parameters.AddWithValue("@DKDT_ID", txtMaDeTai.Text);
						conn.Open();
						SqlDataReader reader = cmd.ExecuteReader();

						while (reader.Read())
						{

							thanhvien tv = new thanhvien();
							tv.MaNV = reader.GetString(2);
							tv.Hoten = reader.GetString(3);
							tv.Vitri = reader.GetString(4);
							tv.Email = (reader.IsDBNull(5) ? "" : reader.GetString(5));

							thanhviens.Add(tv);
						}

						conn.Close();
						GridView1.DataSource = thanhviens;
						GridView1.DataBind();
						ViewState["stateThanhVien"] = thanhviens;
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

		}


		protected void btnluu_Click(object sender, EventArgs e)
		{
			//Chuan bi du lieu insert
			string chuoiLVNC = "";
			foreach (ListItem item in chkLVNC.Items)
			{
				if (item.Selected)
				{
					if (chuoiLVNC.Length > 0)
					{
						// co dau ; trong cac chuoi
						chuoiLVNC = chuoiLVNC + ";" + item.Value.ToString();
					}
					else
					{
						// khong co dau ; o dau cau
						chuoiLVNC = chuoiLVNC + item.Value.ToString();
					}

				}
			}

			//Chuan bi du lieu insert
			string chuoiLHNC = "";
			foreach (ListItem item in chkLHNC.Items)
			{
				if (item.Selected)
				{
					if (chuoiLHNC.Length > 0)
					{
						// co dau ; trong cac chuoi
						chuoiLHNC = chuoiLHNC + ";" + item.Value.ToString();
					}
					else
					{
						// khong co dau ; o dau cau
						chuoiLHNC = chuoiLHNC + item.Value.ToString();
					}

				}
			}

			//Chuan bi du lieu insert
			string chuoispkh = "";
			foreach (ListItem item in chkspkh.Items)
			{
				if (item.Selected)
				{
					if (chuoispkh.Length > 0)
					{
						// co dau ; trong cac chuoi
						chuoispkh = chuoispkh + ";" + item.Value.ToString();
					}
					else
					{
						// khong co dau ; o dau cau
						chuoispkh = chuoispkh + item.Value.ToString();
					}

				}
			}

			//Chuan bi du lieu insert
			string chuoispdt = "";
			foreach (ListItem item in chkspdt.Items)
			{
				if (item.Selected)
				{
					if (chuoispdt.Length > 0)
					{
						// co dau ; trong cac chuoi
						chuoispdt = chuoispdt + ";" + item.Value.ToString();
					}
					else
					{
						// khong co dau ; o dau cau
						chuoispdt = chuoispdt + item.Value.ToString();
					}

				}
			}

			//Chuan bi du lieu insert
			string chuoispud = "";
			foreach (ListItem item in chkspud.Items)
			{
				if (item.Selected)
				{
					if (chuoispud.Length > 0)
					{
						// co dau ; trong cac chuoi
						chuoispud = chuoispud + ";" + item.Value.ToString();
					}
					else
					{
						// khong co dau ; o dau cau
						chuoispud = chuoispud + item.Value.ToString();
					}

				}
			}

			//Tao ket noi CSDL
			using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connstring"].ToString()))
			{
				// Goi cau lenh procedure
				using (SqlCommand cmd = new SqlCommand("THUYETMINHDETAI_INSERT_FROM_TMDT", conn))
				{
					//Gan keu truy van la Procedure
					cmd.CommandType = CommandType.StoredProcedure;
					//Truyen bien vao cau lenh
					cmd.Parameters.AddWithValue("@TMDT_ID", txtMaThuyetMinh.Text);
					cmd.Parameters.AddWithValue("@DKDT_ID", txtMaDeTai.Text);
					cmd.Parameters.AddWithValue("@TMDT_TENDETAI", txtTenDeTai.Text);
					cmd.Parameters.AddWithValue("@TMDT_LVNC", chuoiLVNC);
					cmd.Parameters.AddWithValue("@TMDT_LHNC", chuoiLHNC);

					cmd.Parameters.AddWithValue("@TMDT_TGTH", txtTGThucHien.Text);
					cmd.Parameters.AddWithValue("@TMDT_CQCT", txtCQCTDT.Text);
					cmd.Parameters.AddWithValue("@TMDT_CQCT_SDT", txtSDTCQCTDT.Text);
					cmd.Parameters.AddWithValue("@TMDT_CQCT_DC", txtDCCQCTDT.Text);
					cmd.Parameters.AddWithValue("@TMDT_DVTH", txtDVTH.Text);
					cmd.Parameters.AddWithValue("@TMDT_DVTH_SDT", txtSDTDVTH.Text);
					cmd.Parameters.AddWithValue("@TMDT_DVTH_DC", txtDCTDVTH.Text);
					cmd.Parameters.AddWithValue("@TMDT_NCTRONGNUOC", ckeTrongNuoc.Text);
					cmd.Parameters.AddWithValue("@TMDT_NCNGOAINUOC", ckeNgoaiNuoc.Text);
					cmd.Parameters.AddWithValue("@TMDT_TINHCAPTHIET", ckeTinhCapThiet.Text);
					cmd.Parameters.AddWithValue("@TMDT_MUCTIEU", ckeMucTieu.Text);
					cmd.Parameters.AddWithValue("@TMDT_NOIDUNG", ckeNoiDung.Text);

					cmd.Parameters.AddWithValue("@TMDT_SANPHAMKH", chuoispkh);
					cmd.Parameters.AddWithValue("@TMDT_SANPHAMDT", chuoispdt);
					cmd.Parameters.AddWithValue("@TMDT_SANPHAMUD", chuoispud);
					cmd.Parameters.AddWithValue("@TMDT_SANPHAMKHAC", txtSanPhamKhac.Text);

					cmd.Parameters.AddWithValue("@TMDT_HIEUQUA", ckeHieuQua.Text);
					cmd.Parameters.AddWithValue("@TMDT_DOITUONGNGHIENCUU", ckeDoiTuongNghienCuu.Text);
					cmd.Parameters.AddWithValue("@TMDT_PHAMVINGHIENCUU", ckephamvinghiencuu.Text);
					cmd.Parameters.AddWithValue("@TMDT_PHUONGTHUC_CHUYENGIAO", ckePTChuyenGiao.Text);
					cmd.Parameters.AddWithValue("@TMDT_CACHTIEPCAN", ckecachtiepcan.Text);
					cmd.Parameters.AddWithValue("@TMDT_PHUONGPHAPNGHIENCUU", ckephuongphapnghiencuu.Text);

					cmd.Parameters.AddWithValue("@TMDT_GIONCKH", txtGioNCKH.Text);
					cmd.Parameters.AddWithValue("@TMDT_KINHPHI", txtKinhPhi.Text);
					cmd.Parameters.AddWithValue("@TMDT_NGANSACHTRUONG", txtNganSachTruong.Text);
					cmd.Parameters.AddWithValue("@TMDT_CACNGUON_KPKHAC", txtCacNguonKPKhac.Text);

					conn.Open();
					cmd.ExecuteNonQuery();
					conn.Close();
				}
			}

			//Tao ket noi CSDL
			using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connstring"].ToString()))
			{
				// Goi cau lenh procedure
				using (SqlCommand cmd = new SqlCommand("DANGKYDETAI_DELETE_TV", conn))
				{
					//Gan keu truy van la Procedure
					cmd.CommandType = CommandType.StoredProcedure;
					conn.Open();
					//Truyen bien vao cau lenh
					cmd.Parameters.AddWithValue("@DKDT_ID", txtMaDeTai.Text);
					cmd.ExecuteNonQuery();
					conn.Close();
				}
			}

			//Tao ket noi CSDL
			using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connstring"].ToString()))
			{
				// Goi cau lenh procedure
				using (SqlCommand cmd = new SqlCommand("DANGKYDETAI_INSERT_TV", conn))
				{
					//Gan keu truy van la Procedure
					cmd.CommandType = CommandType.StoredProcedure;
					conn.Open();
					//Truyen bien vao cau lenh

					foreach (thanhvien tv in thanhviens)
					{
						taoma tm = new taoma();

						cmd.Parameters.Clear();
						cmd.Parameters.AddWithValue("@DKDTTV_ID", tm.taomangaunhien("TV"));
						cmd.Parameters.AddWithValue("@DKDT_ID", txtMaDeTai.Text);
						cmd.Parameters.AddWithValue("@DKDTTV_MANV", tv.MaNV);
						cmd.Parameters.AddWithValue("@DKDTTV_HOTEN", tv.Hoten);
						cmd.Parameters.AddWithValue("@DKDTTV_VITRI", tv.Vitri);
						cmd.Parameters.AddWithValue("@DKDTTV_EMAIL", tv.Email);
						cmd.ExecuteNonQuery();
					}
					conn.Close();
				}
			}

		}

		protected void btndanhsach_Click(object sender, EventArgs e)
		{
			Response.Redirect("~/danhsachthuyetminhdetai.aspx");
		}

		protected void btnthem_Click(object sender, EventArgs e)
		{
			thanhvien tv = new thanhvien();
			tv.MaNV = txtMaCB.Text;
			tv.Hoten = txtHoTen.Text;
			tv.Vitri = ddlVitri.Text;
			tv.Email = txtemail.Text;

			thanhviens.Add(tv);
			ViewState["stateThanhVien"] = thanhviens;

			GridView1.DataSource = thanhviens;
			GridView1.DataBind();

			txtMaCB.Text = "";
			txtHoTen.Text = "";
			ddlVitri.Text = "";
			txtemail.Text = "";
		}

		protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
		{

		}

		protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
		{
			thanhviens.RemoveAt(e.RowIndex);

			ViewState["stateThanhVien"] = thanhviens;

			GridView1.DataSource = thanhviens;
			GridView1.DataBind();
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

		protected void chkspud_DataBound(object sender, EventArgs e)
		{
			for (int i = 0; i < chkspud.Items.Count; i++)
			{
				if (chuoispud.Contains(chkspud.Items[i].Value.ToString()))
				{
					chkspud.Items[i].Selected = true;
				}
			}
		}

		protected void chkspdt_DataBound(object sender, EventArgs e)
		{
			for (int i = 0; i < chkspdt.Items.Count; i++)
			{
				if (chuoispdt.Contains(chkspdt.Items[i].Value.ToString()))
				{
					chkspdt.Items[i].Selected = true;
				}
			}
		}

		protected void chkspkh_DataBound(object sender, EventArgs e)
		{
			for (int i = 0; i < chkspkh.Items.Count; i++)
			{
				if (chuoispkh.Contains(chkspkh.Items[i].Value.ToString()))
				{
					chkspkh.Items[i].Selected = true;
				}
			}
		}
	}
}