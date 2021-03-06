using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Globalization;

namespace MQC.record
{
    public partial class Search
    {
        private string batch;

        public string Batch
        {
            get { return batch; }
            set { batch = value; }
        }
    }
    public partial class Add :IEqualityComparer<Add>
    {
        private static string[] strs;
        private string stamp,result;
        public string Batch
        {
            get { return Convert.ToString(Request.QueryString["Batch"]);}
        }
        public string Mold
        {
            get 
            {
                strs = Batch.Split('_');
                return strs[0];
            }
        }
        public string Maktx
        {
            get
            {
                strs = Batch.Split('_');
                return strs[1];
            }
        }
        public DateTime Date
        {
            get
            {
                strs = Batch.Split('_');
                return DateTime.ParseExact(strs[2], "yyyyMMdd", CultureInfo.InvariantCulture);
            }
        }

        public string Customer
        {
            get;
            set;
        }
        public string Standard
        {
            get;
            set;
        }

        public string CavityNo
        {
            get;
            set;
        }

        public string Ps
        {
            get;
            set;
        }

        public string Stamp
        {
            get { return stamp; }
            set { stamp = value; }
        }
        public string Result
        {
            get { return result; }
            set { result = value; }
        }


        public bool Equals(Add x, Add y)
        {
            return x.CavityNo == y.CavityNo;
        }
        public int GetHashCode(Add obj)
        {
            return 0;
        }
    }

    public partial class Add2
    {
        private double no, l_Limit, u_Limit;
        private string type, content, tool, result;
        public int RCId
        {
            get;
            set;
        }
        public string Batch
        {
            get;
            set;
        }
        public string CavityNo
        {
            get;
            set;
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
        public double L_Limit
        {
            get { return l_Limit; }
            set { l_Limit = value; }
        }
        public double U_Limit
        {
            get { return u_Limit; }
            set { u_Limit = value; }
        }
        public string Result
        {
            get { return result; }
            set { result = value; }
        }
    }

    public partial class Detail
    {
        private string batch,maktx,customer;
        private int rid;
        public int Rid
        {
            get { return rid; }
            set { rid = value; }
        }
        public string Batch
        {
            get { return batch; }
            set { batch = value; }
        }
        public string Maktx
        {
            get { return maktx; }
            set { maktx = value; }
        }
        public string Customer
        {
            get { return customer; }
            set { customer = value; }
        }
        public int Status
        {
            get;
            set;

        }
    }
}