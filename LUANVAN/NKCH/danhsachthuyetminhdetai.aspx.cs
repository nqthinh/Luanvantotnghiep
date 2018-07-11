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
	public partial class danhsachthuyetminhdetai : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			btnChiTiet.Visible = false;
            btnCapNhat.Visible = false;
            btnNop.Visible = false;
            btngiahan.Visible = false;
            btndungthuchien.Visible = false;
		}

		protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
		{
			//Lua chon dong du lieu tai vi tri tren gridview
			DataRow rowSelected = ((SqlDataSource1.Select(DataSourceSelectArguments.Empty) as DataView).ToTable()).Rows[GridView1.SelectedIndex];
			//Gan noi dung den tung text box
			txtid.Text = rowSelected.ItemArray[0].ToString();
			txtiddx.Text = rowSelected.ItemArray[1].ToString();
			txtTenDetai.Text = rowSelected.ItemArray[2].ToString();
			if (rowSelected.ItemArray[27].ToString().Equals("Đã nộp"))
			{
                btnChiTiet.Visible = true;
				btnCapNhat.Visible = false;
				btnNop.Visible = false;
                btngiahan.Visible = false;
                btndungthuchien.Visible = false;
			}
			else
			{
				btnChiTiet.Visible = true;
				btnCapNhat.Visible = true;
				btnNop.Visible = true;
			}
			if (rowSelected.ItemArray[28].ToString().Equals("Đã duyệt"))
			{
                btnChiTiet.Visible = true;
                btngiahan.Visible = true;
				btndungthuchien.Visible = true;
			}
			else
			{
				//btngiahan.Visible = false;
				//btndungthuchien.Visible = false;
			}
		}

		protected void btnNop_Click(object sender, EventArgs e)
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
            btnCapNhat.Visible = false;
            btnNop.Visible = false;
            btngiahan.Visible = false;
            btndungthuchien.Visible = false;
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
            btnCapNhat.Visible = false;
            btnNop.Visible = false;
            btngiahan.Visible = false;
            btndungthuchien.Visible = false;
        }

		protected void btnCapNhat_Click(object sender, EventArgs e)
		{
			Session["CapNhatthuyetminh"] = txtid.Text;
			Response.Redirect("thuyetminhdetai.aspx");
		}

		protected void btngiahan_Click(object sender, EventArgs e)
		{
			Session["GiaHan"] = txtid.Text;
			Response.Redirect("giahandetai.aspx");
		}

		protected void btndungthuchien_Click(object sender, EventArgs e)
		{
			Session["DungThucHien"] = txtid.Text;
			Response.Redirect("dungthuchiendetai.aspx");
		}

		protected void btnChiTiet_Click(object sender, EventArgs e)
		{
			Session["mathuyetminh"] = txtid.Text;
			Response.Redirect("mauThuyetMinh.aspx");
		}
	}
}