using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_Contact : System.Web.UI.Page
{
    protected override void OnPreRender(EventArgs e)
    {
        //((Panel)Master.FindControl("AccountUserInfo")).Visible = true;
        if (Master.WhoIsLogged == "Admin")
        {
            Master.btnNLVisibility = true;
            Master.btnNL2Visibility = true;
            Master.btnAdminVisibility = true;
        }
        else if (Master.WhoIsLogged == "User")
        {
            Master.btnNLVisibility = true;
            Master.btnNL2Visibility = false;
            Master.btnAdminVisibility = false;
        }
        else
        {
            Master.btnNLVisibility = false;
            Master.btnNL2Visibility = false;
            Master.btnAdminVisibility = false;
        }
        base.OnPreRender(e);
    }
    protected void Page_Load(object sender, EventArgs e)
    {
    }
}