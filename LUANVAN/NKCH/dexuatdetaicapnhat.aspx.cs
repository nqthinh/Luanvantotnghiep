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
	public partial class dexuatdetaicapnhat : System.Web.UI.Page
	{
		List<thanhvien> thanhviens;
		string chuoiLV = "";
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
                txtMaDeTai.Text = Session["CapNhatDeTai"].ToString();

                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connstring"].ToString()))
				{
					// Goi cau lenh procedure
					using (SqlCommand cmd = new SqlCommand("DANGKYDETAI_SELECT_ROW", conn))
					{
						//Gan keu truy van la Procedure
						cmd.CommandType = CommandType.StoredProcedure;
						//Truyen bien vao cau lenh
						cmd.Parameters.AddWithValue("@DKDT_ID", txtMaDeTai.Text);
						conn.Open();
						SqlDataReader reader = cmd.ExecuteReader();

						while (reader.Read())
						{
							txtTenDeTai.Text = reader.GetString(1);
							chuoiLV = reader.GetString(2);
							ckeTinhCapThiet.Text = reader.GetString(3);
                            ckeMucTieu.Text = reader.GetString(4);
                            ckeNoiDung.Text = reader.GetString(5);
                            ckeHieuQua.Text = reader.GetString(6);
                            ckeSanPham.Text = reader.GetString(7);
                            txtGioNCKH.Text = reader.GetString(8);
							txtKinhPhi.Text = reader.GetString(9);
							txtNganSachTruong.Text = reader.GetString(10);
							txtCacNguonKPKhac.Text = reader.GetString(11);
							txtThoiGianThucHien.Text = reader.GetString(14);
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
							tv.Email = reader.GetString(5);

							thanhviens.Add(tv);
						}

						conn.Close();
						GridView1.DataSource = thanhviens;
						GridView1.DataBind();
						ViewState["stateThanhVien"] = thanhviens;
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

			//Tao ket noi CSDL
			using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connstring"].ToString()))
			{
				// Goi cau lenh procedure
				using (SqlCommand cmd = new SqlCommand("DANGKYDETAI_INSERT", conn))
				{
					//Gan keu truy van la Procedure
					cmd.CommandType = CommandType.StoredProcedure;
					//Truyen bien vao cau lenh
					cmd.Parameters.AddWithValue("@DKDT_ID", txtMaDeTai.Text);
					cmd.Parameters.AddWithValue("@DKDT_TENDETAI", txtTenDeTai.Text);
					cmd.Parameters.AddWithValue("@DKDT_LVNC", chuoiLVNC);
					cmd.Parameters.AddWithValue("@DKDT_TINHCAPTHIET", ckeTinhCapThiet.Text);
					cmd.Parameters.AddWithValue("@DKDT_MUCTIEU", ckeMucTieu.Text);
					cmd.Parameters.AddWithValue("@DKDT_NOIDUNG", ckeNoiDung.Text);
					cmd.Parameters.AddWithValue("@DKDT_HIEUQUA", ckeHieuQua.Text);
					cmd.Parameters.AddWithValue("@DKDT_SANPHAM", ckeSanPham.Text);
					cmd.Parameters.AddWithValue("@DKDT_GIONCKH", txtGioNCKH.Text);
					cmd.Parameters.AddWithValue("@DKDT_KINHPHI", txtKinhPhi.Text);
					cmd.Parameters.AddWithValue("@DKDT_NGANSACHTRUONG", txtNganSachTruong.Text);
					cmd.Parameters.AddWithValue("@DKDT_CACNGUON_KPKHAC", txtCacNguonKPKhac.Text);
					cmd.Parameters.AddWithValue("@DKDT_THOIGIANTH", txtThoiGianThucHien.Text);
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
			Response.Redirect("~/danhsachdetai.aspx");
		}

		protected void btnthem_Click(object sender, EventArgs e)
		{
			//thanhvien tv = new thanhvien();
			//tv.MaNV = txtMaCB.Text;
			//tv.Hoten = txtHoTen.Text;
			//tv.Vitri = ddlVitri.Text;
			//tv.Email = txtemail.Text;

			//thanhviens.Add(tv);
			//ViewState["stateThanhVien"] = thanhviens;

			//GridView1.DataSource = thanhviens;
			//GridView1.DataBind();

			//txtMaCB.Text = "";
			//txtHoTen.Text = "";
			//ddlVitri.Text = "";
			//txtemail.Text = "";
		}

		protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
		{
			thanhviens.RemoveAt(e.RowIndex);

			ViewState["stateThanhVien"] = thanhviens;

			GridView1.DataSource = thanhviens;
			GridView1.DataBind();

		}

		protected void chkLVNC_DataBinding(object sender, EventArgs e)
		{

		}

		protected void chkLVNC_DataBound(object sender, EventArgs e)
		{
			for (int i = 0; i < 6; i++)
			{
				if (chuoiLV.Contains(chkLVNC.Items[i].Value.ToString()))
				{
					chkLVNC.Items[i].Selected = true;
				}
			}
		}
	}
}