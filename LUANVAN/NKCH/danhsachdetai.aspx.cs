using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace NKCH
{
    public partial class danhsachdetai : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Lua chon dong du lieu tai vi tri tren gridview
            DataRow rowSelected = ((SqlDataSource1.Select(DataSourceSelectArguments.Empty) as DataView).ToTable()).Rows[GridView1.SelectedIndex];
            //Gan noi dung den tung text box
            txtid.Text = rowSelected.ItemArray[0].ToString();
            txtTenDetai.Text = rowSelected.ItemArray[1].ToString();

			btnChiTiet.Visible = true;

            if (rowSelected.ItemArray[12].ToString().Equals("Đã nộp"))
            {
                btnCapNhat.Visible = false;
                btnXoa.Visible = false;
				btnNop.Visible = false;
            }
            else
            {
				btnNop.Visible = true;
                btnCapNhat.Visible = true;
                btnXoa.Visible = true;
            }
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
			btnChiTiet.Visible = false;
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
        }

        protected void btnCapNhat_Click(object sender, EventArgs e)
        {
            Session["CapNhatDeTai"] = txtid.Text;
            Response.Redirect("~/dexuatdetaicapnhat.aspx");
        }

		protected void btnChiTiet_Click(object sender, EventArgs e)
		{
			Session["madetai"] = txtid.Text;
			Response.Redirect("mauDexuatDetai.aspx");
		}
	}
}