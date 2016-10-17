using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
    protected void btnContact_Click(object sender, EventArgs e)
    {
        Response.Redirect("Contact.aspx");
    }
    protected void btnNL_Click(object sender, EventArgs e)
    {
        Response.Redirect("nlPage.aspx");
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("LoginPage.aspx");
    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        Response.Redirect("RegisterPage.aspx");
    }
    protected void btnAdmin_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminPage.aspx");
    }
    protected void btnNL2_Click(object sender, EventArgs e)
    {
        Response.Redirect("nlPage2.aspx");
    }

    public bool btnHomeVisibility
    {
        get { return btnHome.Visible; }
        set { btnHome.Visible = value; }
    }
    public bool btnNLVisibility
    {
        get { return btnNL.Visible; }
        set { btnNL.Visible = value; }
    }
    public bool btnNL2Visibility
    {
        get { return btnNL2.Visible; }
        set { btnNL2.Visible = value; }
    }
    public bool btnAdminVisibility
    {
        get { return btnAdmin.Visible; }
        set { btnAdmin.Visible = value; }
    }
    public bool btnLogoutVisibility
    {
        get { return btnLogout.Visible; }
        set { btnLogout.Visible = value; }
    }

    protected static string _whoIsLogged;// = "user";
    public string WhoIsLogged
    {
        get { return _whoIsLogged; }
        set { _whoIsLogged = value; }
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Response.Redirect("LoginPage.aspx");
    }
}
