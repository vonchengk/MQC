using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MQC.send
{
    public partial class Add
    {
        private string maktx, mold, customer, standard, serialNo,type,tool,content;
        private int num;
        private double no,l_Limit2,u_Limit2;
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
        public string Customer
        {
            get { return customer; }
            set { customer = value; }
        }
        public string Standard
        {
            get { return standard; }
            set { standard = value; }
        }
        public int Num
        {
            get { return num; }
            set { num = value; }
        }
        public string SerialNo
        {
            get { return serialNo; }
            set { serialNo = value; }
        }
        public string Type
        {
            get { return type; }
            set { type = value; }
        }
        public string Tool
        {
            get { return tool; }
            set { tool = value; }
        }
        public string Content
        {
            get { return content; }
            set { content = value; }
        }
        public double No
        {
            get { return no; }
            set { no = value; }
        }
        public double L_Limit2
        {
            get { return l_Limit2; }
            set { l_Limit2 = value; }
        }
        public double U_Limit2
        {
            get { return u_Limit2; }
            set { u_Limit2 = value; }
        }

    }
}