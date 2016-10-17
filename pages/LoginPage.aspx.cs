using System;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Text;
using System.Text.RegularExpressions;

public partial class pages_LoginPage : System.Web.UI.Page
{
    public string loginUser
    {
        get { return tbxUNameLogin.Text; }
        set { tbxUNameLogin.Text = value; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None; //required to make the validation work (as I don't have jQuery implemented)
        Master.btnHomeVisibility = false;
        Master.btnNLVisibility = false;
        Master.btnNL2Visibility = false;
        Master.btnAdminVisibility = false;
        Master.btnLogoutVisibility = false;

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string un = tbxUNameLogin.Text;
        string up = tbxPassLogin.Text;
        bool ok = false;
        string connStr = "Data Source=.; Initial Catalog=newsletter2; Trusted_Connection=true;";
        string query = "SELECT * FROM UserLogin WHERE uName='"+un+"';";

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
                if (up == dataReader.GetValue(2).ToString()) ok = true; //the pass is ok with the user
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

        if (ok) //if pass is correct
        {
            if (un == "Admin")
            {
                Master.btnNLVisibility = true;
                Master.btnNL2Visibility = true;
                Master.btnAdminVisibility = true;
                Response.Redirect("AdminPage.aspx");
                //((TextBox)Master.FindControl("TextBox1")).Text = userID.ToString();
                //Master.WhoIsLogged = "Admin";
            }
            else
            {
                Master.btnNLVisibility = true;
                Response.Redirect("nlPage.aspx?userName=" + un); //go to nlPage
                //Master.WhoIsLogged = "User";
            }
        }
        else
            Response.Write("<script>alert('Wrong login info');</script>");


    }

}