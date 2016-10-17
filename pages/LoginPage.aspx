<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LoginPage.aspx.cs" Inherits="pages_LoginPage" %>
<%@ MasterType  virtualPath="~/MasterPage.master"%> <%--to access properties from master file--%>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <h1>Login</h1>
    <table>
        <tr><td><asp:Label ID="Label1" runat="server" Text="User name:" CssClass="userLabels"></asp:Label></td>
            <td><asp:TextBox ID="tbxUNameLogin" runat="server" Width="170px" autocomplete="off"></asp:TextBox></td>
            <td><asp:Label ID="Label2" runat="server" Text="*" style="color:red;"></asp:Label></td>
            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="CheckV" ErrorMessage="That field is required!" Display="Dynamic" ControlToValidate="tbxUNameLogin"></asp:RequiredFieldValidator></td>
        </tr>
        <tr><td><asp:Label ID="Label3" runat="server" Text="Password:" CssClass="userLabels"></asp:Label></td>
            <td><asp:TextBox ID="tbxPassLogin" runat="server" Width="170px" autocomplete="off"></asp:TextBox></td>
            <td><asp:Label ID="Label4" runat="server" Text="*" style="color:red;"></asp:Label></td>
            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="CheckV" ErrorMessage="That field is required!" Display="Dynamic" ControlToValidate="tbxPassLogin"></asp:RequiredFieldValidator></td>
        </tr>
        <tr><td style="height:20px"></td><td></td><td></td><td></td></tr> <%--empty row for space--%>
        <tr><td></td><td> <asp:Button ID="btnLogin" runat="server" ValidationGroup="CheckV" Text="Login" CssClass="login_buttons" OnClick="btnLogin_Click"/></td><td></td><td></td></tr> <%--empty row for space--%>

    </table>

<%--    <a href="http://stackoverflow.com/questions/3121915/can-i-hide-a-user-control-in-a-master-page-from-a-content-page" target="_blank">can-i-hide-a-user-control-in-a-master-page-from-a-content-page</a><br />
    <a href="http://stackoverflow.com/questions/16417871/how-to-change-visible-of-an-asp-net-control-of-master-page-in-content-page" target="_blank">how-to-change-visible-of-an-asp-net-control-of-master-page-in-content-page</a><br />
    <a href="http://stackoverflow.com/questions/15431733/set-property-of-master-page-from-content-page-and-get-that-property-value-from-a" target="_blank">set property of master page from content page and get that property value from another content page in asp.net</a><br />
    <a href="http://stackoverflow.com/questions/1071920/set-property-value-on-master-page-from-content-page" target="_blank">set-property-value-on-master-page-from-content-page</a><br />--%>

<p>&nbsp;</p>
</asp:Content>

