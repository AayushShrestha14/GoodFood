
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
    public partial class Dish_Search : System.Web.UI.Page
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

            string name = ddlDishSearch.SelectedValue.ToString();
            string constr = ConfigurationManager.ConnectionStrings["admin"].ConnectionString;
            OracleCommand cmd = new OracleCommand();
            OracleConnection con = new OracleConnection(constr);
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = @"select d.dish_name,r.available_restaurant,dr.dish_rate,lp.loyalty_points
                                from dish d
                                inner join dish_restaurant dr
                                on dr.dish_code = d.dish_code
                                inner join loyalty_points lp
                                on lp.points_id=dr.loyalty_points_id
                                inner join restaurant r
                                on r.restaurant_code=dr.restaurant_code
                                where d.dish_code='" + name + "'";
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

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindGrid();
        }
    }
}