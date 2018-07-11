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
    public partial class thoigiandangky : System.Web.UI.Page
    {
        taoma tm = new taoma();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void ChonAnButton()
        {
            btnluu.Visible = true;
            btnhuy.Visible = true;
            btnxoa.Visible = true;
            btnthem.Visible = false;
            txtid.ReadOnly = true;
            txtngaybatdau.ReadOnly = true;
            txtngayketthuc.ReadOnly = true;
        }

        private void ThemMoiAnButton()
        {
            btnluu.Visible = true;
            btnhuy.Visible = true;
            btnxoa.Visible = false;
            btnthem.Visible = false;
            txtid.ReadOnly = true;
            txtngaybatdau.ReadOnly = true;
            txtngayketthuc.ReadOnly = true;
        }

        private void XoaAnButton()
        {
            btnluu.Visible = false;
            btnhuy.Visible = false;
            btnxoa.Visible = false;
            btnthem.Visible = true;
            txtid.ReadOnly = true;
            txtngaybatdau.ReadOnly = true;
            txtngayketthuc.ReadOnly = true;
        }

        private void HuyAnButton()
        {
            btnluu.Visible = false;
            btnhuy.Visible = false;
            btnxoa.Visible = false;
            btnthem.Visible = true;
            txtid.ReadOnly = true;
            txtngaybatdau.ReadOnly = true;
            txtngayketthuc.ReadOnly = true;
        }

        private void ResetNoiDung()
        {
            txtid.Text = "";
            txtngaybatdau.Text = "";
            txtngayketthuc.Text = "";
        }

        protected void btnthem_Click(object sender, EventArgs e)
        {
            ThemMoiAnButton();
            ResetNoiDung();
            txtid.Text = tm.taomangaunhien("TD");
        }

        protected void gvDSGiangVien_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataRow rowSelected = ((sqlthoigiandangky.Select(DataSourceSelectArguments.Empty) as DataView).ToTable()).Rows[GVthoigiandangky.SelectedIndex];
            //Gan noi dung den tung text box
            txtid.Text = rowSelected.ItemArray[0].ToString();
            txtngaybatdau.Text = rowSelected.ItemArray[1].ToString();
            txtngayketthuc.Text = rowSelected.ItemArray[2].ToString();
            ChonAnButton();
        }

        protected void btnluu_Click(object sender, EventArgs e)
        {
            if (btnthem.Visible == false && btnxoa.Visible == false)
            {
                sqlthoigiandangky.Insert();
            }
            else
            {
                sqlthoigiandangky.Update();
            }
            ResetNoiDung();
            XoaAnButton();
        }

        protected void btnxoa_Click(object sender, EventArgs e)
        {
            sqlthoigiandangky.Delete();
            ResetNoiDung();
            XoaAnButton();
        }

        protected void btnhuy_Click(object sender, EventArgs e)
        {
            ResetNoiDung();
            HuyAnButton();
        }
    }
}