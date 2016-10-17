<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="nlPage.aspx.cs" Inherits="pages_nlPage" %>
<%@ MasterType  virtualPath="~/MasterPage.master"%> <%--to access properties from master file--%>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lblH1" runat="server"></asp:Label>
    <p>Your details:</p>
    <table>
        <tr><td><asp:Label ID="Label5" runat="server" Text="Name:" CssClass="userLabels"></asp:Label></td>
            <td><asp:TextBox ID="tbxName" runat="server" Enabled="False"></asp:TextBox></td>
            <td><asp:Label ID="Label7" runat="server" Text="Last name:" CssClass="userLabels"></asp:Label></td>
            <td><asp:TextBox ID="tbxLName" runat="server" Enabled="False"></asp:TextBox></td>
        </tr>
        <tr><td><asp:Label ID="Label9" runat="server" Text="Phone:" CssClass="userLabels"></asp:Label></td>
            <td><asp:TextBox ID="tbxPhone" runat="server" Enabled="False"></asp:TextBox></td>
            <td><asp:Label ID="Label11" runat="server" Text="Email:" CssClass="userLabels"></asp:Label></td>
            <td><asp:TextBox ID="tbxEmail" runat="server" Enabled="False"></asp:TextBox></td>
        </tr>
        <tr><td><asp:Label ID="Label13" runat="server" Text="Suite:" CssClass="userLabels"></asp:Label></td>
            <td><asp:TextBox ID="tbxSuite" runat="server" Enabled="False"></asp:TextBox></td>
            <td><asp:Label ID="Label15" runat="server" Text="Street address:" CssClass="userLabels"></asp:Label></td>
            <td><asp:TextBox ID="tbxStreet" runat="server" Enabled="False"></asp:TextBox></td>
        </tr>
        <tr><td><asp:Label ID="Label14" runat="server" Text="City:" CssClass="userLabels"></asp:Label></td>
            <td><asp:TextBox ID="tbxCity" runat="server" Enabled="False"></asp:TextBox></td>
            <td><asp:Label ID="Label17" runat="server" Text="Country:" CssClass="userLabels"></asp:Label></td>
            <td><asp:TextBox ID="tbxCountry" runat="server" Enabled="False"></asp:TextBox></td>
        </tr>
    </table>
    <p>Cheers.</p>

</asp:Content>

