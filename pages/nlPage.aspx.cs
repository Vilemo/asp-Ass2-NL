using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class pages_nlPage : System.Web.UI.Page
{
    //protected override void OnPreRender(EventArgs e)
    //{
    //    //((Panel)Master.FindControl("AccountUserInfo")).Visible = true;
    //    if (Master.WhoIsLogged == "Admin")
    //    {
    //        Master.btnNLVisibility = true;
    //        Master.btnNL2Visibility = true;
    //        Master.btnAdminVisibility = true;
    //    }
    //    else if (Master.WhoIsLogged == "User")
    //    {
    //        Master.btnNLVisibility = true;
    //        Master.btnNL2Visibility = false;
    //        Master.btnAdminVisibility = false;
    //    }
    //    else
    //    {
    //        Master.btnNLVisibility = false;
    //        Master.btnNL2Visibility = false;
    //        Master.btnAdminVisibility = false;
    //    }
    //    base.OnPreRender(e);
    //}
    protected void Page_Load(object sender, EventArgs e)
    {
        Master.btnHomeVisibility = true;
        Master.btnNLVisibility = true;
        Master.btnNL2Visibility = false;
        Master.btnAdminVisibility = false;
        Master.btnLogoutVisibility = true;

        string userName = Request.QueryString["userName"];
        //((TextBox)Master.FindControl("TextBox1")).Text = userName;
        lblH1.Text = "<h1>Hallo " + userName + "!</h1>";

        int userID = getUserID(userName);
        //((TextBox)Master.FindControl("TextBox1")).Text = userID.ToString();
        string connStr = "Data Source=.; Initial Catalog=newsletter2; Trusted_Connection=true;";
        string query = "SELECT * FROM UserInfo WHERE ID="+userID;
        SqlConnection conn = new SqlConnection(connStr);
        SqlCommand com = new SqlCommand();
        SqlDataReader dataReader;

        try
        {
            conn.Open();
            com.Connection = conn;
            com.CommandText = query;
            dataReader = com.ExecuteReader();
            while (dataReader.Read())
            {
                tbxName.Text = dataReader.GetValue(1).ToString();
                tbxLName.Text = dataReader.GetValue(2).ToString();
                tbxPhone.Text = dataReader.GetValue(3).ToString();
                tbxEmail.Text = dataReader.GetValue(4).ToString();
                tbxSuite.Text = dataReader.GetValue(5).ToString();
                tbxStreet.Text = dataReader.GetValue(6).ToString();
                tbxCity.Text = dataReader.GetValue(7).ToString();
                tbxCountry.Text = dataReader.GetValue(8).ToString();
            }
        }
        catch (SqlException ex)
        {
            Response.Write("<script>alert(" + ex.Message + ");</script>");
        }
        finally
        {
            conn.Close();
        }
    }

    public int getUserID(string uName)
    {
        int id = 1;
        string connStr = "Data Source=.; Initial Catalog=newsletter2; Trusted_Connection=true;";
        string query = "SELECT keyID FROM UserLogin WHERE uName='" + uName + "';";
        SqlConnection conn = new SqlConnection(connStr);
        SqlCommand com = new SqlCommand();
        SqlDataReader dataReader;
        try
        {
            conn.Open();
            com.Connection = conn;
            com.CommandText = query;
            dataReader = com.ExecuteReader();
            while (dataReader.Read())
            {
                id = Convert.ToInt32(dataReader.GetValue(0));
            }
        }
        catch (SqlException ex)
        {
            Response.Write("<script>alert(" + ex.Message + ");</script>");
        }
        finally
        {
            conn.Close();
        }
        return id;
    }


}