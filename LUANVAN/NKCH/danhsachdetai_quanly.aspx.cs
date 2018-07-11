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
	public partial class danhsachdetai_quanly : System.Web.UI.Page
	{
		int vitri;
		protected void Page_Load(object sender, EventArgs e)
		{
            btnChiTiet.Visible = false;
            btnDuyet.Visible = false;
            btnHuyNop.Visible = false;
        }

		protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
		{
			//Lua chon dong du lieu tai vi tri tren gridview
			DataRow rowSelected = ((SqlDataSource1.Select(DataSourceSelectArguments.Empty) as DataView).ToTable()).Rows[GridView1.SelectedIndex];
			vitri = GridView1.SelectedIndex;
			//Gan noi dung den tung text box
			txtid.Text = rowSelected.ItemArray[0].ToString();
			txtTenDetai.Text = rowSelected.ItemArray[1].ToString();
            if(rowSelected.ItemArray[13].ToString().Equals("Đã duyệt"))
            {
                btnChiTiet.Visible = true;
            }
            else
            {
                btnChiTiet.Visible = true;
                btnDuyet.Visible = true;
                btnHuyNop.Visible = true;
            }
		}

		protected void btnNop_Click(object sender, EventArgs e)
		{
			//Tao ket noi CSDL
			using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connstring"].ToString()))
			{
				// Goi cau lenh procedure
				using (SqlCommand cmd = new SqlCommand("DANGKYDETAI_NOP", conn))
				{
					//Gan keu truy van la Procedure
					cmd.CommandType = CommandType.StoredProcedure;
					conn.Open();
					//Truyen bien vao cau lenh
					cmd.Parameters.AddWithValue("@DKDT_ID", txtid.Text);
					cmd.Parameters.AddWithValue("@CHUCNANG", '1');
					cmd.ExecuteNonQuery();
					conn.Close();
				}
			}
			GridView1.DataBind();
			txtid.Text = "";
			txtTenDetai.Text = "";
            btnChiTiet.Visible = false;
            btnDuyet.Visible = false;
            btnHuyNop.Visible = false;
        }

		protected void btnHuyNop_Click(object sender, EventArgs e)
		{
			//Tao ket noi CSDL
			using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connstring"].ToString()))
			{
				// Goi cau lenh procedure
				using (SqlCommand cmd = new SqlCommand("DANGKYDETAI_NOP", conn))
				{
					//Gan keu truy van la Procedure
					cmd.CommandType = CommandType.StoredProcedure;
					conn.Open();
					//Truyen bien vao cau lenh
					cmd.Parameters.AddWithValue("@DKDT_ID", txtid.Text);
					cmd.Parameters.AddWithValue("@CHUCNANG", '0');
					cmd.ExecuteNonQuery();
					conn.Close();
				}
			}
			GridView1.DataBind();
			txtid.Text = "";
			txtTenDetai.Text = "";
            btnChiTiet.Visible = false;
            btnDuyet.Visible = false;
            btnHuyNop.Visible = false;
        }

		protected void btnDuyet_Click(object sender, EventArgs e)
		{
			// tao du lieu thuyet minh de tai

			DataRow rowSelected = ((SqlDataSource1.Select(DataSourceSelectArguments.Empty) as DataView).ToTable()).Rows[vitri];
			//Gan noi dung den tung text box
			txtid.Text = rowSelected.ItemArray[0].ToString();
			txtTenDetai.Text = rowSelected.ItemArray[1].ToString();

			//Tao ket noi CSDL
			using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connstring"].ToString()))
			{

				// Goi cau lenh procedure
				using (SqlCommand cmd = new SqlCommand("THUYETMINHDETAI_INSERT_FROM_TMDT", conn))
				{
					//Gan keu truy van la Procedure
					cmd.CommandType = CommandType.StoredProcedure;
					//Truyen bien vao cau lenh
					taoma tm = new taoma();

					cmd.Parameters.AddWithValue("@TMDT_ID", tm.taomangaunhien("TM"));
					cmd.Parameters.AddWithValue("@DKDT_ID", txtid.Text);
					cmd.Parameters.AddWithValue("@TMDT_TENDETAI", txtTenDetai.Text);
					cmd.Parameters.AddWithValue("@TMDT_LVNC", rowSelected.ItemArray[2].ToString());
					cmd.Parameters.AddWithValue("@TMDT_TINHCAPTHIET", rowSelected.ItemArray[3].ToString());
					cmd.Parameters.AddWithValue("@TMDT_MUCTIEU", rowSelected.ItemArray[4].ToString());
					cmd.Parameters.AddWithValue("@TMDT_NOIDUNG", rowSelected.ItemArray[5].ToString());
					cmd.Parameters.AddWithValue("@TMDT_HIEUQUA", rowSelected.ItemArray[6].ToString()); 
					cmd.Parameters.AddWithValue("@TMDT_GIONCKH", rowSelected.ItemArray[8].ToString());
					cmd.Parameters.AddWithValue("@TMDT_KINHPHI", rowSelected.ItemArray[9].ToString());
					cmd.Parameters.AddWithValue("@TMDT_NGANSACHTRUONG", rowSelected.ItemArray[10].ToString());
					cmd.Parameters.AddWithValue("@TMDT_CACNGUON_KPKHAC", rowSelected.ItemArray[11].ToString());
					cmd.Parameters.AddWithValue("@TMDT_TGTH", rowSelected.ItemArray[14].ToString());
					conn.Open();
					cmd.ExecuteNonQuery();
					conn.Close();
				}
			}

			//Tao ket noi CSDL
			using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connstring"].ToString()))
			{
				// Goi cau lenh procedure
				using (SqlCommand cmd = new SqlCommand("DANGKYDETAI_DUYET", conn))
				{
					//Gan keu truy van la Procedure
					cmd.CommandType = CommandType.StoredProcedure;
					conn.Open();
					//Truyen bien vao cau lenh
					cmd.Parameters.AddWithValue("@DKDT_ID", txtid.Text);
					//cmd.Parameters.AddWithValue("@CHUCNANG", '1');
					cmd.ExecuteNonQuery();
					conn.Close();
				}
			}
			GridView1.DataBind();
			txtid.Text = "";
			txtTenDetai.Text = "";
            btnChiTiet.Visible = false;
            btnDuyet.Visible = false;
            btnHuyNop.Visible = false;
        }

		protected void btnChiTiet_Click(object sender, EventArgs e)
		{
			Session["madetai"] = txtid.Text;
			Response.Redirect("mauDexuatDetai.aspx");
		}
	}
}