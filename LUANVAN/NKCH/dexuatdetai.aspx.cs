using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using NKCH.myclass;

namespace NKCH
{
    public partial class dexuatdetai : System.Web.UI.Page
    {
        List<thanhvien> thanhviens;
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

                    if (DateTime.Now < ngaybatdau || DateTime.Now > ngayketthuc)
                    {
                        Response.Redirect("baoloithoigiandangky.aspx");
                    }

                    thanhviens = new List<thanhvien>();
                    taoma tm = new taoma();
                    txtMaDeTai.Text = tm.taomangaunhien("DX");

                    thanhvien tv1 = new thanhvien();
                    tv1.MaNV = ((dangnhapnguoidung)Session["dangnhap"]).cb_id;
                    tv1.Hoten = ((dangnhapnguoidung)Session["dangnhap"]).cb_hoten;
                    tv1.Vitri = "Chủ nhiệm đề tài";
                    tv1.Email = ((dangnhapnguoidung)Session["dangnhap"]).cb_email;
                    thanhviens.Add(tv1);
                    ViewState["stateThanhVien"] = thanhviens;
                    GridView1.DataSource = thanhviens;
                    GridView1.DataBind();
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
                    cmd.Parameters.AddWithValue("@DKDT_SANPHAM", ckeSanPham .Text);
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

        protected void btndanhsach_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/danhsachdetai.aspx");
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            thanhviens.RemoveAt(e.RowIndex);

            ViewState["stateThanhVien"] = thanhviens;

            GridView1.DataSource = thanhviens;
            GridView1.DataBind();
        }
	}

	
}