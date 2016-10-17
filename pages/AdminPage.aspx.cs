using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class pages_AdminPage : System.Web.UI.Page
{
    public static int uID; //to make the variable global-like
    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None; //required to make the validation work (as I don't have jQuery implemented)
        if (!Page.IsPostBack)
        {
            display(); //displays in listBoxes
        }
        Master.btnHomeVisibility = true;
        Master.btnNL2Visibility = true;
        Master.btnAdminVisibility = true;
        Master.btnLogoutVisibility = true;
//        ((TextBox)Master.FindControl("TextBox1")).Text = userID;
    }
    public void display()
    {
        string connStr = "Data Source=.; Initial Catalog=newsletter2; Trusted_Connection=true;";
        string query = "SELECT * FROM UserInfo";
        string query2 = "SELECT * FROM UserLogin";

        SqlConnection conn = new SqlConnection(connStr);
        SqlCommand com = new SqlCommand();
        SqlDataReader dataReader;

        lbxUserInfo.Items.Clear();
        lbxUserLogin.Items.Clear();

        try //display UserInfo table in listBox
        {
            conn.Open();
            com.Connection = conn;
            com.CommandText = query;
            dataReader = com.ExecuteReader();
            while (dataReader.Read())
            {
                string value = "ID: " + dataReader.GetValue(0) + ". Name: " + dataReader.GetValue(1) + " " + dataReader.GetValue(2) + ", Phone: " + dataReader.GetValue(3) +
                    ", Email: " + dataReader.GetValue(4) + ", Suite: " + dataReader.GetValue(5) + ", Street: " + dataReader.GetValue(6) + ", City: " + dataReader.GetValue(7) +
                     ", Country: " + dataReader.GetValue(8);
                lbxUserInfo.Items.Add(value);
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

        try //display UserLogin table in listBox
        {
            conn.Open();
            com.Connection = conn;
            com.CommandText = query2;
            dataReader = com.ExecuteReader();
            while (dataReader.Read())
            {
                string value = "ID: " + dataReader.GetValue(0) + ". User name: " + dataReader.GetValue(1) + ", Pass: " + dataReader.GetValue(2) + ", user ID: " + dataReader.GetValue(3);
                lbxUserLogin.Items.Add(value);
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
    public void displayInTable1(int userID)
    {
        string connStr = "Data Source=.; Initial Catalog=newsletter2; Trusted_Connection=true;";
        string query = "SELECT * FROM UserInfo WHERE ID=" + userID;
        string query2 = "SELECT * FROM UserLogin WHERE keyID=" + userID;

        SqlConnection conn = new SqlConnection(connStr);
        SqlCommand com = new SqlCommand();
        SqlDataReader dataReader;

        try //display record from UserInfo table
        {
            conn.Open();
            com.Connection = conn;
            com.CommandText = query;
            dataReader = com.ExecuteReader();
            while (dataReader.Read())
            {
                tbxUid.Text = dataReader.GetValue(0).ToString();
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
        try //display record from UserLogin table
        {
            conn.Open();
            com.Connection = conn;
            com.CommandText = query2;
            dataReader = com.ExecuteReader();
            while (dataReader.Read())
            {
                tbxUName.Text = dataReader.GetValue(1).ToString();
                tbxPass.Text = dataReader.GetValue(2).ToString();
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
    protected void lbxUserInfo_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        string record = lbxUserInfo.SelectedValue.ToString(); //or string record = lbxUserInfo.SelectedItem.Value;
        string id = record.Substring(4, 4); //get only the id number from the whole line (from position, length)
        uID = Convert.ToInt32(id);
        UserInfoTable.Visible = true;
        displayInTable1(uID);
    }
    protected void lbxUserLogin_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        string record = lbxUserLogin.SelectedValue.ToString(); //or string record = lbxUserInfo.SelectedItem.Value;
        //string id = record.Substring(4, 4); //get only the id number from the whole line (from position, length)
        string id = record.Substring(record.LastIndexOf(' ') + 1); //get the last word from the line
        uID = Convert.ToInt32(id);
        if (uID != 1110) //only if it isn't admin
        {
            UserInfoTable.Visible = true;
            displayInTable1(uID);
        }
    }
    protected void btnUpdate1_Click(object sender, EventArgs e)
    {
        if (uID == 0)
        {
            Response.Write("<script>alert('Select record');</script>");
        }
        else
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

            try
            {
                string query = "UPDATE UserInfo SET Name='" + tbxName.Text + "', lName='" + tbxLName.Text + "', Phone='" + phone + "', Email='" +
                        tbxEmail.Text + "', Suite='" + suite + "', Street='" + tbxStreet.Text + "', City='" + tbxCity.Text + "', Coutry='" +
                        tbxCountry.Text + "' WHERE ID=" + uID + ";";
                executeCommand(query);
                query = "UPDATE UserLogin SET uName='" + tbxUName.Text + "', uPass='" + tbxPass.Text + "' WHERE keyID=" + uID + ";";
                executeCommand(query);
            }
            catch (FormatException fEx)
            {
                Response.Write("<script>alert('Something wrong ;p');</script>");
            }
            display();
        }
    }
    protected void btnDelete1_Click(object sender, EventArgs e)
    {
        if (uID == 0)
        {
            Response.Write("<script>alert('Select record');</script>");
        }
        else
        {
            try
            {
                string query = "DELETE FROM UserInfo WHERE ID=" + uID + ";";
                executeCommand(query);
                query = "DELETE FROM UserLogin WHERE keyID=" + uID + ";";
                executeCommand(query);

            }
            catch (FormatException fEx)
            {
                Response.Write("<script>alert('Something wrong ;p');</script>");
            }
            display();
            UserInfoTable.Visible = false;
        }
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {
        string findOption = ddlFind.SelectedValue;
        string findStr = tbxFind.Text;
        if (findStr == String.Empty)
        {
            Response.Write("<script>alert('Insert search value')</script>");
        }
        else
        {
            SearchResults.Visible = true;
            string query;
            switch (findOption)
            {
                case "Name":
                    query = "SELECT * FROM UserInfo WHERE Name='" + findStr + "';";
                    displayResults(query);
                    break;
                case "Last name":
                    query = "SELECT * FROM UserInfo WHERE lName='" + findStr + "';";
                    displayResults(query);
                    break;
                case "Phone":
                    query = "SELECT * FROM UserInfo WHERE Phone='" + findStr + "';";
                    displayResults(query);
                    break;
                case "Email":
                    query = "SELECT * FROM UserInfo WHERE Email='" + findStr + "';";
                    displayResults(query);
                    break;
                case "City":
                    query = "SELECT * FROM UserInfo WHERE City='" + findStr + "';";
                    displayResults(query);
                    break;
                case "Country":
                    query = "SELECT * FROM UserInfo WHERE Coutry='" + findStr + "';";
                    displayResults(query);
                    break;
            }
        }
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
    public void displayResults(string q) {
        string connStr = "Data Source=.; Initial Catalog=newsletter2; Trusted_Connection=true;";

        SqlConnection conn = new SqlConnection(connStr);
        SqlCommand com = new SqlCommand();
        SqlDataReader dataReader;

        lbxResults.Items.Clear();
        bool exist = false;

        try
        {
            conn.Open();
            com.Connection = conn;
            com.CommandText = q;
            dataReader = com.ExecuteReader();
            while (dataReader.Read())
            {
                string value = "ID: " + dataReader.GetValue(0) + ". Name: " + dataReader.GetValue(1) + " " + dataReader.GetValue(2) + ", Phone: " + dataReader.GetValue(3) +
                    ", Email: " + dataReader.GetValue(4) + ", Suite: " + dataReader.GetValue(5) + ", Street: " + dataReader.GetValue(6) + ", City: " + dataReader.GetValue(7) +
                     ", Country: " + dataReader.GetValue(8);
                lbxResults.Items.Add(value);
                exist = true;
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
        if (!exist) lbxResults.Items.Add("No records found *___*");
    }
    protected void hideResults_Click(object sender, EventArgs e)
    {
        SearchResults.Visible = false;
    }
    protected void btnHideUserInfo_Click(object sender, EventArgs e)
    {
        UserInfoTable.Visible = false;
    }
}