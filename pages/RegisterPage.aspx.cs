using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class pages_RegisterPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None; //required to make the validation work (as I don't have jQuery implemented)
        Master.btnHomeVisibility = false;
        Master.btnNLVisibility = false;
        Master.btnNL2Visibility = false;
        Master.btnAdminVisibility = false;
        Master.btnLogoutVisibility = false;
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        string phone;
        string suite;
        string street;
        if (tbxPhone.Text == String.Empty) phone = "-";
        else phone = tbxPhone.Text;
        if (tbxSuite.Text == String.Empty) suite = "-";
        else suite = tbxSuite.Text;
        if (tbxStreet.Text == String.Empty) street = "-";
        else street = tbxStreet.Text;

        string query = "INSERT INTO UserInfo (Name, lName, Phone, Email, Suite, Street, City, Coutry) VALUES('" +
            tbxName.Text + "', '" + tbxLName.Text + "', '" + phone + "', '" + tbxEmail.Text + "', '" + suite + "', '" +
            street + "', '" + tbxCity.Text + "', '" + tbxCountry.Text + "');";
        executeCommand(query);

        int userID = getUserID(tbxName.Text, tbxLName.Text, tbxEmail.Text);
        //int userID = 1116;
        query = "INSERT INTO UserLogin (uName, uPass, keyID) VALUES('" + tbxUName.Text + "', '" + tbxPass.Text + "', " + userID + ");";
        executeCommand(query);

        Response.Redirect("LoginPage.aspx"); //go to LoginPage
        //((TextBox)Master.FindControl("TextBox1")).Text = userID.ToString();
    }

    public void executeCommand(string q)
    {
        string connStr = "Data source=.; Initial Catalog=newsletter2; Trusted_Connection=true;";

        SqlConnection con = new SqlConnection(connStr);
        SqlCommand com = new SqlCommand();
        try
        {
            con.Open();
            com.Connection = con;
            com.CommandText = q;
            com.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "');</script>");
        }
        finally
        {
            con.Close();
        }
    }

    public int getUserID(string name, string lName, string email)
    {
        int id=1;
        string connStr = "Data Source=.; Initial Catalog=newsletter2; Trusted_Connection=true;";
        string query = "SELECT ID FROM UserInfo WHERE Name='" + name + "' AND lName='" + lName + "' AND Email='" + email + "';";
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
                id= Convert.ToInt32(dataReader.GetValue(0));
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