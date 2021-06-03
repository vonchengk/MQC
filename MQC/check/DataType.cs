using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MQC.check
{
    public partial class Search
    {
        private string maktx, mold;
        public string Maktx
        {
            get { return maktx; }
            set { maktx = value; }
        }
        public string Mold
        {
            get { return mold; }
            set { mold = value; }
        }
    }
    public partial class Detail
    {
        private string maktx, mold, type, content, tool;
        private double l_Toler, u_Toler, l_Limit1, u_Limit1, l_Limit2, u_Limit2,no;
        private int checkId;

        public int CheckId
        {
            get { return checkId; }
            set { checkId = value; }
        }
        public string Maktx
        {
            get { return maktx; }
            set { maktx = value; }
        }
        public string Mold
        {
            get { return mold; }
            set { mold = value; }
        }
        public double No
        {
            get { return no; }
            set { no = value; }
        }
        public string Type
        {
            get { return type; }
            set { type = value; }
        }
        public string Content
        {
            get { return content; }
            set { content = value; }
        }
        public string Tool
        {
            get { return tool; }
            set { tool = value; }
        }
        public double L_Toler
        {
            get { return l_Toler; }
            set { l_Toler = value; }
        }
        public double U_Toler
        {
            get { return u_Toler; }
            set { u_Toler = value; }
        }
        public double L_Limit1
        {
            get { return l_Limit1; }
            set { l_Limit1 = value; }
        }
        public double L_Limit2
        {
            get { return l_Limit2; }
            set { l_Limit2 = value; }
        }
        public double U_Limit1
        {
            get { return u_Limit1; }
            set { u_Limit1 = value; }
        }
        public double U_Limit2
        {
            get { return u_Limit2; }
            set { u_Limit2 = value; }
        }
    }

    public partial class Add
    {
        private string maktx, mold;
        private double no;

        public string Maktx
        {
            get { return maktx; }
            set { maktx = value; }
        }
        public string Mold
        {
            get { return mold; }
            set { mold = value; }
        }
        public double No
        {
            get { return no; }
            set { no = value; }
        }
    }
}