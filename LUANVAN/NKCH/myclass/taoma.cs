using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NKCH.myclass
{
    public class taoma
    {
        public string taomangaunhien(string chu)
        {
            string chuoi = "";
            chuoi = chu + "" + DateTime.Now.ToString("yyMMddHHmmssff");
            return chuoi;
        }
    }
}