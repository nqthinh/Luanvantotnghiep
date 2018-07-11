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
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DateTime ngaybatdau = new DateTime();
                DateTime ngayketthuc = new DateTime(); ;
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connstring"].ToString()))
                {
                    // Goi cau lenh procedure
                    using (SqlCommand cmd = new SqlCommand("THOIGIANDANGKY_GETTIME1", conn))
                    {
                        //Gan keu truy van la Procedure
                        cmd.CommandType = CommandType.StoredProcedure;
                        //Truyen bien vao cau lenh
                        conn.Open();
                        SqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            ngaybatdau = reader.GetDateTime(1);
                            ngayketthuc = reader.GetDateTime(2);
                        }

                        conn.Close();
                    }
                        lbthoigiandangky.Text = "Thời gian đăng ký bắt đầu từ ngày " + ngaybatdau.ToString("dd/MM/yyyy") + " đến ngày " + ngayketthuc.ToString("dd/MM/yyyy");
                } 
            }
        }
    }
}