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
    public partial class giangvien : System.Web.UI.Page
    {
        taoma tm = new taoma();
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void gvDSGiangVien_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Lua chon dong du lieu tai vi tri tren gridview
            DataRow rowSelected = ((sqldsDSGiangVien.Select(DataSourceSelectArguments.Empty) as DataView).ToTable()).Rows[gvDSGiangVien.SelectedIndex];
            //Gan noi dung den tung text box
            txtid.Text = rowSelected.ItemArray[0].ToString();
            txthovaten.Text = rowSelected.ItemArray[1].ToString();
            txtcmnd.Text = rowSelected.ItemArray[2].ToString();
            txtngaycap.Text = rowSelected.ItemArray[3].ToString();
            txtnoicap.Text = rowSelected.ItemArray[4].ToString();
            txtsdt.Text = rowSelected.ItemArray[5].ToString();
            txtemail.Text = rowSelected.ItemArray[6].ToString();
            ddlkhoa.SelectedValue = rowSelected.ItemArray[8].ToString();
            ddlhocvi.SelectedValue = rowSelected.ItemArray[10].ToString();
            ddlvaitro.SelectedValue = rowSelected.ItemArray[11].ToString();
            ddlchucvu.SelectedValue = rowSelected.ItemArray[13].ToString();
            ChonAnButton();
        }

        private void ChonAnButton()
        {
            btnluu.Visible = true;
            btnhuy.Visible = true;
            btnxoa.Visible = true;
            btnthem.Visible = false;
            txtid.ReadOnly = true;
            txthovaten.ReadOnly = false;
            txtcmnd.ReadOnly = false;
            txtngaycap.ReadOnly = false;
            txtnoicap.ReadOnly = false;
            txtemail.ReadOnly = false;
            txtsdt.ReadOnly = false;
        }

        protected void btnthem_Click(object sender, EventArgs e)
        {
            ThemMoiAnButton();
            ResetNoiDung();
            txtid.Text = tm.taomangaunhien("ND");
        }

        private void ThemMoiAnButton()
        {          
            btnluu.Visible = true;
            btnhuy.Visible = true;
            btnxoa.Visible = false;
            btnthem.Visible = false;
            txtid.ReadOnly = true;
            txthovaten.ReadOnly = false;
            txtcmnd.ReadOnly = false;
            txtngaycap.ReadOnly = false;
            txtnoicap.ReadOnly = false;
            txtemail.ReadOnly = false;
            txtsdt.ReadOnly = false;
        }

        private void ResetNoiDung()
        {
            txtid.Text = "";
            txthovaten.Text = "";
            txtcmnd.Text = "";
            txtngaycap.Text = "";
            txtnoicap.Text = "";
            txtemail.Text = "";
            txtsdt.Text = "";
        }

        protected void btnluu_Click(object sender, EventArgs e)
        {
            if(btnthem.Visible == false && btnxoa.Visible == false)
            {
                sqldsDSGiangVien.Insert();
            }
            else
            {
                sqldsDSGiangVien.Update();
            }
            ResetNoiDung();
            XoaAnButton();
        }

        private void XoaAnButton()
        {
            btnluu.Visible = false;
            btnhuy.Visible = false;
            btnxoa.Visible = false;
            btnthem.Visible = true;
            txtid.ReadOnly = true;
            txthovaten.ReadOnly = true;
            txtcmnd.ReadOnly = true;
            txtngaycap.ReadOnly = true;
            txtnoicap.ReadOnly = true;
            txtemail.ReadOnly = true;
            txtsdt.ReadOnly = true;
        }

        protected void btnhuy_Click(object sender, EventArgs e)
        {
            ResetNoiDung();
            HuyAnButton();
        }

        private void HuyAnButton()
        {
            btnluu.Visible = false;
            btnhuy.Visible = false;
            btnxoa.Visible = false;
            btnthem.Visible = true;
            txtid.ReadOnly = true;
            txthovaten.ReadOnly = true;
            txtcmnd.ReadOnly = true;
            txtngaycap.ReadOnly = true;
            txtnoicap.ReadOnly = true;
            txtemail.ReadOnly = true;
            txtsdt.ReadOnly = true;
        }

        protected void btnxoa_Click(object sender, EventArgs e)
        {
            sqldsDSGiangVien.Delete();
            ResetNoiDung();
            XoaAnButton();
        }
    }
}