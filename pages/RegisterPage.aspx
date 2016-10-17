<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RegisterPage.aspx.cs" Inherits="pages_RegisterPage" %>
<%@ MasterType  virtualPath="~/MasterPage.master"%> <%--to access properties from master file--%>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Register</h1>
    <table>
        <tr><td><asp:Label ID="Label1" runat="server" Text="User name:" CssClass="userLabels"></asp:Label></td>
            <td><asp:TextBox ID="tbxUName" runat="server" CausesValidation="true" autocomplete="off"></asp:TextBox></td>
            <td><asp:Label ID="Label2" runat="server" Text="*" style="color:red;"></asp:Label></td>
            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="CheckV" runat="server" ErrorMessage="That field is required!" Display="Dynamic" ControlToValidate="tbxUName" ForeColor="Red"></asp:RequiredFieldValidator>
<%--                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="tbxUName" Display="Dynamic" Enabled="True" ErrorMessage="User name not allowed" ForeColor="Red" ValidationExpression="^(.(?!admin|Admin|administrator|Administrator)*([a-z0-9]+))$ " ValidationGroup="CheckV"></asp:RegularExpressionValidator>--%>
<%--                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="tbxUName" Display="Dynamic" Enabled="True" ErrorMessage="User name not allowed" ForeColor="Red" ValidationExpression="^/(?!admin|Admin|administrator|Administrator)([a-z0-9]+)$" ValidationGroup="CheckV"></asp:RegularExpressionValidator>--%>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="tbxUName" Display="Dynamic" Enabled="True" ErrorMessage="User name not allowed" ForeColor="Red" ValidationExpression="^(?!.*\badmin|Admin|administrator|Administrator\b)\w+\b" ValidationGroup="CheckV"></asp:RegularExpressionValidator>
<%--                <asp:CompareValidator ID="CompareValidator1" ValidationGroup="CheckV" runat="server" ControlToValidate="tbxUName" Display="Dynamic" ErrorMessage="User name not allowed!" ForeColor="Red" ValueToCompare="admin" Operator="NotEqual"></asp:CompareValidator>--%>
            </td>
        </tr>
        <tr><td><asp:Label ID="Label3" runat="server" Text="Password:" CssClass="userLabels"></asp:Label></td>
            <td><asp:TextBox ID="tbxPass" runat="server" CausesValidation="true" autocomplete="off"></asp:TextBox></td>
            <td><asp:Label ID="Label4" runat="server" Text="*" style="color:red;"></asp:Label></td>
            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="CheckV" runat="server" ErrorMessage="That field is required!" Display="Dynamic" ControlToValidate="tbxPass" ForeColor="Red"></asp:RequiredFieldValidator></td>
        </tr>
        <tr><td style="height:20px"></td><td></td><td></td><td></td></tr> <%--empty row for space--%>
        <tr><td><asp:Label ID="Label5" runat="server" Text="Name:" CssClass="userLabels"></asp:Label></td>
            <td><asp:TextBox ID="tbxName" runat="server" CausesValidation="true"></asp:TextBox></td>
            <td><asp:Label ID="Label6" runat="server" Text="*" style="color:red;"></asp:Label></td>
            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="CheckV" runat="server" ErrorMessage="That field is required!" Display="Dynamic" ControlToValidate="tbxName" ForeColor="Red"></asp:RequiredFieldValidator></td>
        </tr>
        <tr><td><asp:Label ID="Label7" runat="server" Text="Last name:" CssClass="userLabels"></asp:Label></td>
            <td><asp:TextBox ID="tbxLName" runat="server" CausesValidation="true"></asp:TextBox></td>
            <td><asp:Label ID="Label8" runat="server" Text="*" style="color:red;"></asp:Label></td>
            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="CheckV" runat="server" ErrorMessage="That field is required!" Display="Dynamic" ControlToValidate="tbxLName" ForeColor="Red"></asp:RequiredFieldValidator></td>
        </tr>
        <tr><td><asp:Label ID="Label9" runat="server" Text="Phone:" CssClass="userLabels"></asp:Label></td>
            <td><asp:TextBox ID="tbxPhone" runat="server"></asp:TextBox></td>
            <td></td>
            <td><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbxPhone" Display="Dynamic" Enabled="True" ErrorMessage="Wrong phone format (only numbers)" ForeColor="Red" ValidationExpression="[0-9]{6,10}" ValidationGroup="CheckV"></asp:RegularExpressionValidator></td>
        </tr>
        <tr><td><asp:Label ID="Label11" runat="server" Text="Email:" CssClass="userLabels"></asp:Label></td>
            <td><asp:TextBox ID="tbxEmail" runat="server" CausesValidation="true"></asp:TextBox></td>
            <td><asp:Label ID="Label12" runat="server" Text="*" style="color:red;"></asp:Label></td>
            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="CheckV" runat="server" ErrorMessage="That field is required!" Display="Dynamic" ControlToValidate="tbxEmail" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationGroup="CheckV" runat="server" ControlToValidate="tbxEmail" Display="Dynamic" Enabled="True" ErrorMessage="Wrong email format" ForeColor="Red" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$"></asp:RegularExpressionValidator></td>
        </tr>
        <tr><td><asp:Label ID="Label13" runat="server" Text="Suite:" CssClass="userLabels"></asp:Label></td>
            <td><asp:TextBox ID="tbxSuite" runat="server"></asp:TextBox></td>
            <td></td>
            <td><asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="tbxSuite" Display="Dynamic" Enabled="True" ErrorMessage="Wrong format / only numbers" ForeColor="Red" ValidationExpression="[0-9]{0,5}" ValidationGroup="CheckV"></asp:RegularExpressionValidator></td>
        </tr>
        <tr><td><asp:Label ID="Label15" runat="server" Text="Street address:" CssClass="userLabels"></asp:Label></td>
            <td><asp:TextBox ID="tbxStreet" runat="server"></asp:TextBox></td>
            <td></td>
            <td></td>
        </tr>
        <tr><td><asp:Label ID="Label14" runat="server" Text="City:" CssClass="userLabels"></asp:Label></td>
            <td><asp:TextBox ID="tbxCity" runat="server" CausesValidation="true"></asp:TextBox></td>
            <td><asp:Label ID="Label16" runat="server" Text="*" style="color:red;"></asp:Label></td>
            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="CheckV" runat="server" ErrorMessage="That field is required!" Display="Dynamic" ControlToValidate="tbxCity" ForeColor="Red"></asp:RequiredFieldValidator></td>
        </tr>
        <tr><td><asp:Label ID="Label17" runat="server" Text="Country:" CssClass="userLabels"></asp:Label></td>
            <td><asp:TextBox ID="tbxCountry" runat="server" CausesValidation="true"></asp:TextBox></td>
            <td><asp:Label ID="Label18" runat="server" Text="*" style="color:red;"></asp:Label></td>
            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator8" ValidationGroup="CheckV" runat="server" ErrorMessage="That field is required!" Display="Dynamic" ControlToValidate="tbxCountry" ForeColor="Red"></asp:RequiredFieldValidator></td>
        </tr>
        <tr><td style="height:20px"></td><td></td><td></td><td></td></tr> <%--empty row for space--%>
        <tr><td></td><td> <asp:Button ID="btnRegister" runat="server" Text="Submit" ValidationGroup="CheckV" CssClass="login_buttons" OnClick="btnRegister_Click"/></td><td></td><td></td></tr> <%--empty row for space--%>

    </table>
   
</asp:Content>

