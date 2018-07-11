using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NKCH.myclass
{
    [Serializable]
    public class thanhvien
    {
        string manv;
        string hoten;
        string vitri;
        string email;


        public string MaNV { get; set; }

        public string Hoten { get; set; }

        public string Vitri { get; set; }

        public string Email { get; set; }
    }
}