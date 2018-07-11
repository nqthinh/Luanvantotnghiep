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
	public partial class danhsachdetaithuyetminh_quanly : System.Web.UI.Page
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
			txtiddx.Text = rowSelected.ItemArray[1].ToString();
			txtTenDetai.Text = rowSelected.ItemArray[2].ToString();
            if(rowSelected.ItemArray[28].ToString().Equals("Đã duyệt"))
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

		protected void btnXoa_Click(object sender, EventArgs e)
		{
			//Tao ket noi CSDL
			using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connstring"].ToString()))
			{
				// Goi cau lenh procedure
				using (SqlCommand cmd = new SqlCommand("DANGKYDETAI_DELETEALLDT", conn))
				{
					//Gan keu truy van la Procedure
					cmd.CommandType = CommandType.StoredProcedure;
					conn.Open();
					//Truyen bien vao cau lenh
					cmd.Parameters.AddWithValue("@DKDT_ID", txtid.Text);
					cmd.ExecuteNonQuery();
					conn.Close();
				}
			}
			GridView1.DataBind();
			txtid.Text = "";
			txtTenDetai.Text = "";
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
				using (SqlCommand cmd = new SqlCommand("DANGKYDETAITHUYETMINH_NOP", conn))
				{
					//Gan keu truy van la Procedure
					cmd.CommandType = CommandType.StoredProcedure;
					conn.Open();
					//Truyen bien vao cau lenh
					cmd.Parameters.AddWithValue("@TMDT_ID", txtid.Text);
					cmd.Parameters.AddWithValue("@CHUCNANG", '1');
					cmd.ExecuteNonQuery();
					conn.Close();
				}
			}
			GridView1.DataBind();
			txtid.Text = "";
			txtTenDetai.Text = "";
			txtiddx.Text = "";
            btnChiTiet.Visible = false;
            btnDuyet.Visible = false;
            btnHuyNop.Visible = false;
        }

		protected void btnCapNhat_Click(object sender, EventArgs e)
		{
			Session["CapNhatDeTai"] = txtid.Text;
			Response.Redirect("dexuatdetaicapnhat.aspx");
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
				using (SqlCommand cmd = new SqlCommand("DANGKYDETAITHUYETMINH_DUYET", conn))
				{
					//Gan keu truy van la Procedure
					cmd.CommandType = CommandType.StoredProcedure;
					conn.Open();
					//Truyen bien vao cau lenh
					cmd.Parameters.AddWithValue("@TMDT_ID", txtid.Text);
					//cmd.Parameters.AddWithValue("@CHUCNANG", '1');
					cmd.ExecuteNonQuery();
					conn.Close();
				}
			}
			GridView1.DataBind();
			txtid.Text = "";
			txtiddx.Text = "";
			txtTenDetai.Text = "";
            btnChiTiet.Visible = false;
            btnDuyet.Visible = false;
            btnHuyNop.Visible = false;
        }

        protected void btnChiTiet_Click(object sender, EventArgs e)
        {
            Session["mathuyetminh"] = txtid.Text;
            Response.Redirect("mauThuyetMinh.aspx");
        }
    }
}