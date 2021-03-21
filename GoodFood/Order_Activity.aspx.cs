using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GoodFood
{
    public partial class Order_Activity : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //default load data
            if (!this.IsPostBack)
            {
                this.BindGrid();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindGrid();
        }

        private void BindGrid()
        {
                    
                string name = ddlOrderActivity.SelectedValue.ToString();
                string constr = ConfigurationManager.ConnectionStrings["admin"].ConnectionString;
                OracleCommand cmd = new OracleCommand();
                OracleConnection con = new OracleConnection(constr);
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = @"SELECT SUM(DO.ORDER_UNIT) OrderUnit, R.AVAILABLE_RESTAURANT
            FROM CUSTOMER C
            JOIN ORDER_REGISTER O
            ON O.CUSTOMER_CODE = C.CUSTOMER_CODE
            JOIN DISH_ORDER DO
            ON DO.ORDER_NO = O.ORDER_NO
            JOIN ORDER_DETAILS OD
            ON OD.ORDER_NO = O.ORDER_NO
            JOIN DISH D
            ON D.DISH_CODE = DO.DISH_CODE
            JOIN DISH_RESTAURANT DR
            ON DR.DISH_CODE = D.DISH_CODE
            JOIN RESTAURANT R
            ON R.RESTAURANT_CODE = DR.RESTAURANT_CODE
            WHERE C.CUSTOMER_CODE = '" + name + "' AND (O.ORDER_DATE) > SYSDATE - 30 GROUP BY R.AVAILABLE_RESTAURANT ORDER BY SUM(DO.ORDER_UNIT) DESC";
                cmd.CommandType = CommandType.Text;

                DataTable dt = new DataTable();
                using (OracleDataReader sdr = cmd.ExecuteReader())
                {
                    if (sdr.HasRows)
                    {
                        dt.Load(sdr);
                        errMsg.Text = " ";
                    }
                    else
                    {
                        errMsg.Text = "Currently no data available";
                    }
                }
                con.Close();

                GridView1.DataSource = dt;
                GridView1.DataBind();
            
        }
    }
}