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
    public partial class Customer_order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //default load data
            if (!this.IsPostBack)
            {
                this.BindGrid();
            }
        }
        private void BindGrid()
        {
            string name = this.ddlCustomerOrder.SelectedValue.ToString();
            string address = this.ddlDeliveryAddress.SelectedValue.ToString();
            string constr = ConfigurationManager.ConnectionStrings["admin"].ConnectionString;
            OracleCommand cmd = new OracleCommand();
            OracleConnection con = new OracleConnection(constr);
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = @"SELECT C.CUSTOMER_NAME,O.ORDER_NO, D.DISH_NAME,DA.DELIVERY_ADDRESS,R.AVAILABLE_RESTAURANT
                                FROM CUSTOMER C
                                INNER JOIN 
                                ORDER_REGISTER O 
                                ON O.CUSTOMER_CODE = C.CUSTOMER_CODE
                                INNER JOIN 
                                DISH_ORDER DO
                                ON O.ORDER_NO = DO.ORDER_NO
                                INNER JOIN ORDER_DETAILS OD
                                ON OD.ORDER_NO = O.ORDER_NO
                                INNER JOIN DISH D
                                ON D.DISH_CODE=DO.DISH_CODE
                                INNER JOIN DELIVERY_ADDRESS DA
                                ON DA.DELIVERY_ADDRESS_ID=OD.DELIVERY_POINT_ID
                                INNER JOIN RESTAURANT R
                                ON R.RESTAURANT_CODE=DO.RES_ID
                                WHERE C.CUSTOMER_CODE='" + name + "' AND DA.DELIVERY_ADDRESS_ID='" + address + "'";
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


        protected void search_Click(object sender, EventArgs e)
        {
            BindGrid();
        }
    }
}