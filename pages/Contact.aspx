<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="pages_Contact" %>
<%@ MasterType  virtualPath="~/MasterPage.master"%> <%--to access properties from master file--%>
<%@ PreviousPageType VirtualPath="~/Pages/LoginPage.aspx" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Contact</h1>
    <table>
                <tr><td style="height:20px"></td><td></td><td></td><td></td></tr> <%--empty row for space--%>
            <tr><td><asp:Label ID="Label1" runat="server" Text="User ID:" CssClass="userLabels"></asp:Label></td>
                <td><asp:TextBox ID="tbxUid" runat="server" Enabled="False"></asp:TextBox></td>
                <td></td>
                <td><asp:Button ID="btnSaveMod" runat="server" Text="Save" /></td>
            </tr>
            <tr><td><asp:Label ID="Label5" runat="server" Text="Name:" CssClass="userLabels"></asp:Label></td>
                <td><asp:TextBox ID="tbxName" runat="server"></asp:TextBox></td>
                <td><asp:Label ID="Label7" runat="server" Text="Last name:" CssClass="userLabels"></asp:Label></td>
                <td><asp:TextBox ID="tbxLName" runat="server"></asp:TextBox></td>
            </tr>
            <tr><td><asp:Label ID="Label9" runat="server" Text="Phone:" CssClass="userLabels"></asp:Label></td>
                <td><asp:TextBox ID="tbxPhone" runat="server"></asp:TextBox></td>
                <td><asp:Label ID="Label11" runat="server" Text="Email:" CssClass="userLabels"></asp:Label></td>
                <td><asp:TextBox ID="tbxEmail" runat="server"></asp:TextBox></td>
            </tr>
            <tr><td><asp:Label ID="Label13" runat="server" Text="Suite:" CssClass="userLabels"></asp:Label></td>
                <td><asp:TextBox ID="tbxSuite" runat="server"></asp:TextBox></td>
                <td><asp:Label ID="Label15" runat="server" Text="Street address:" CssClass="userLabels"></asp:Label></td>
                <td><asp:TextBox ID="tbxStreet" runat="server"></asp:TextBox></td>
            </tr>
            <tr><td><asp:Label ID="Label14" runat="server" Text="City:" CssClass="userLabels"></asp:Label></td>
                <td><asp:TextBox ID="tbxCity" runat="server"></asp:TextBox></td>
                <td><asp:Label ID="Label17" runat="server" Text="Country:" CssClass="userLabels"></asp:Label></td>
                <td><asp:TextBox ID="tbxCountry" runat="server"></asp:TextBox></td>
            </tr>
</table>
</asp:Content>

