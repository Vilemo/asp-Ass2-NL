using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_nlPage2 : System.Web.UI.Page
{
    protected override void OnPreRender(EventArgs e)
    {
        //((Panel)Master.FindControl("AccountUserInfo")).Visible = true;
        Master.btnHomeVisibility = true;
        Master.btnNLVisibility = true;
        Master.btnNL2Visibility = true;
        Master.btnAdminVisibility = true;
        Master.btnLogoutVisibility = true;

        base.OnPreRender(e);
    }
    protected void Page_Load(object sender, EventArgs e)
    {
    }
}