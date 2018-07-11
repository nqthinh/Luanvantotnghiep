using NKCH.myclass;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NKCH
{
    public partial class khoa1 : System.Web.UI.Page
    {
        taoma tm = new taoma();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnthem_Click(object sender, EventArgs e)
        {
            TaoMoiAnButton();
            ResetNoiDung();
            txtMaKhoa.Text = tm.taomangaunhien("Kh");
        }
        private void TaoMoiAnButton()
        {
            btncapnhat.Visible = true;
            btnhuy.Visible = true;
            btnxoa.Visible = false;
            btnthem.Visible = false;
            txtMaKhoa.ReadOnly = true;
            txtTenKhoa.ReadOnly = false;
        }
        protected void btncapnhat_Click(object sender, EventArgs e)
        {
            if (btnthem.Visible == false && btnxoa.Visible == false)
            {
                SqldsKhoa.Insert();
            }
            else
            {
                SqldsKhoa.Update();
            }
            XoaAnButton();
            ResetNoiDung();
        }

        protected void btnhuy_Click(object sender, EventArgs e)
        {
            ResetNoiDung();
            HuyAnButton();
        }
        private void HuyAnButton()
        {
            btncapnhat.Visible = false;
            btnhuy.Visible = false;
            btnxoa.Visible = false;
            btnthem.Visible = true;
            txtMaKhoa.ReadOnly = true;
            txtTenKhoa.ReadOnly = true;
        }

        private void ResetNoiDung()
        {
            txtMaKhoa.Text = "";
            txtTenKhoa.Text = "";
        }

        protected void btnxoa_Click(object sender, EventArgs e)
        {
            SqldsKhoa.Delete();
            ResetNoiDung();
            XoaAnButton();
        }
        private void XoaAnButton()
        {
            btncapnhat.Visible = false;
            btnhuy.Visible = false;
            btnxoa.Visible = false;
            btnthem.Visible = true;
            txtMaKhoa.ReadOnly = true;
            txtTenKhoa.ReadOnly = true;
        }

        protected void GVDSKhoa_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataRow rowSelected = ((SqldsKhoa.Select(DataSourceSelectArguments.Empty) as DataView).ToTable()).Rows[GVDSKhoa.SelectedIndex];
            //Gan noi dung den tung text box
            txtMaKhoa.Text = rowSelected.ItemArray[0].ToString();
            txtTenKhoa.Text = rowSelected.ItemArray[1].ToString();
            ChonAnButton();
        }
        private void ChonAnButton()
        {
            btncapnhat.Visible = true;
            btnhuy.Visible = true;
            btnxoa.Visible = true;
            btnthem.Visible = false;
            txtMaKhoa.ReadOnly = true;
            txtTenKhoa.ReadOnly = false;
        }
    }
}