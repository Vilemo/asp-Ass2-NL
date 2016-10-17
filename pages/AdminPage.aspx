<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminPage.aspx.cs" Inherits="pages_AdminPage" %>
<%@ MasterType  virtualPath="~/MasterPage.master"%> <%--to access properties from master file--%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Admin page</h1>

    <h2>Users informations:</h2>
    <asp:ListBox ID="lbxUserInfo" runat="server" Width="977px" Height="150px" AutoPostBack="True" OnSelectedIndexChanged="lbxUserInfo_SelectedIndexChanged"></asp:ListBox>
    <h2>Users Login informations:</h2>
    <asp:ListBox ID="lbxUserLogin" runat="server" Width="900px" Height="150px" AutoPostBack="True" OnSelectedIndexChanged="lbxUserLogin_SelectedIndexChanged"></asp:ListBox><br /><br />

    <%--    <asp:Button ID="btnAdd1" runat="server" Text="Add" CssClass="login_buttons" OnClick="btnAdd1_Click"/>--%>
    <asp:Button ID="btnUpdate1" runat="server" Text="Update" CssClass="login_buttons" OnClick="btnUpdate1_Click"/>
    <asp:Button ID="btnDelete1" runat="server" Text="Delete" CssClass="login_buttons" OnClick="btnDelete1_Click" /> <%--OnClientClick="return confirm('Are you sure?');"--%>
    <asp:DropDownList ID="ddlFind" runat="server" Width="130px">
        <asp:ListItem>Name</asp:ListItem>
        <asp:ListItem>Last name</asp:ListItem>
        <asp:ListItem>Phone</asp:ListItem>
        <asp:ListItem>Email</asp:ListItem>
        <asp:ListItem>City</asp:ListItem>
        <asp:ListItem>Country</asp:ListItem>
    </asp:DropDownList>
    <asp:TextBox ID="tbxFind" runat="server"></asp:TextBox>
    <asp:Button ID="btnFind" runat="server" Text="Find" CssClass="login_buttons" OnClick="btnFind_Click"/>

    <asp:Panel ID="UserInfoTable" runat="server" visible="false"> <%--hide table until button click--%>
        <table>
            <tr><td style="height:20px" colspan="8"></tr> <%--empty row for space--%>
            <tr><td><asp:Label ID="Label2" runat="server" Text="User ID:" CssClass="userLabels"></asp:Label></td>
                <td><asp:TextBox ID="tbxUid" runat="server" Enabled="False"></asp:TextBox></td>
                <td colspan="5"></td>
                <td><asp:Button ID="btnHideUserInfo" runat="server" Text="(Hide)" CssClass="nav_buttons2" OnClick="btnHideUserInfo_Click" /></td>
            </tr>
            <tr><td style="height:20px" colspan="8"></tr> <%--empty row for space--%>
            <tr><td><asp:Label ID="Label29" runat="server" Text="User name:" CssClass="userLabels"></asp:Label></td>
                <td><asp:TextBox ID="tbxUName" runat="server" CausesValidation="true" autocomplete="off"></asp:TextBox></td>
                <td><asp:Label ID="Label30" runat="server" Text="*" style="color:red;"></asp:Label></td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator11" ValidationGroup="CheckV" runat="server" ErrorMessage="That field is required!" Display="Dynamic" ControlToValidate="tbxUName" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="tbxUName" Display="Dynamic" Enabled="True" ErrorMessage="User name not allowed" ForeColor="Red" ValidationExpression="^(?!.*\badmin|Admin|administrator|Administrator\b)\w+\b" ValidationGroup="CheckV"></asp:RegularExpressionValidator></td>
                <td><asp:Label ID="Label31" runat="server" Text="Password:" CssClass="userLabels"></asp:Label></td>
                <td><asp:TextBox ID="tbxPass" runat="server" CausesValidation="true" autocomplete="off"></asp:TextBox></td>
                <td><asp:Label ID="Label32" runat="server" Text="*" style="color:red;"></asp:Label></td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator12" ValidationGroup="CheckV" runat="server" ErrorMessage="That field is required!" Display="Dynamic" ControlToValidate="tbxPass" ForeColor="Red"></asp:RequiredFieldValidator></td>
            </tr>
            <tr><td style="height:20px" colspan="8"></tr> <%--empty row for space--%>
            <tr><td><asp:Label ID="Label5" runat="server" Text="Name:" CssClass="userLabels"></asp:Label></td>
                <td><asp:TextBox ID="tbxName" runat="server" CausesValidation="true"></asp:TextBox></td>
                <td><asp:Label ID="Label6" runat="server" Text="*" style="color:red;"></asp:Label></td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="CheckV" runat="server" ErrorMessage="That field is required!" Display="Dynamic" ControlToValidate="tbxName" ForeColor="Red"></asp:RequiredFieldValidator></td>
                <td><asp:Label ID="Label7" runat="server" Text="Last name:" CssClass="userLabels"></asp:Label></td>
                <td><asp:TextBox ID="tbxLName" runat="server" CausesValidation="true"></asp:TextBox></td>
                <td><asp:Label ID="Label8" runat="server" Text="*" style="color:red;"></asp:Label></td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="CheckV" runat="server" ErrorMessage="That field is required!" Display="Dynamic" ControlToValidate="tbxLName" ForeColor="Red"></asp:RequiredFieldValidator></td>
            </tr>
            <tr><td><asp:Label ID="Label9" runat="server" Text="Phone:" CssClass="userLabels"></asp:Label></td>
                <td><asp:TextBox ID="tbxPhone" runat="server"></asp:TextBox></td>
                <td></td>
                <td><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbxPhone" Display="Dynamic" Enabled="True" ErrorMessage="Wrong phone format (only numbers)" ForeColor="Red" ValidationExpression="[0-9]{6,10}" ValidationGroup="CheckV"></asp:RegularExpressionValidator></td>
                <td><asp:Label ID="Label11" runat="server" Text="Email:" CssClass="userLabels"></asp:Label></td>
                <td><asp:TextBox ID="tbxEmail" runat="server" CausesValidation="true"></asp:TextBox></td>
                <td><asp:Label ID="Label12" runat="server" Text="*" style="color:red;"></asp:Label></td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="CheckV" runat="server" ErrorMessage="That field is required!" Display="Dynamic" ControlToValidate="tbxEmail" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationGroup="CheckV" runat="server" ControlToValidate="tbxEmail" Display="Dynamic" Enabled="True" ErrorMessage="Wrong email format" ForeColor="Red" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$"></asp:RegularExpressionValidator></td>
            </tr>
            <tr><td><asp:Label ID="Label13" runat="server" Text="Suite:" CssClass="userLabels"></asp:Label></td>
                <td><asp:TextBox ID="tbxSuite" runat="server"></asp:TextBox></td>
                <td></td>
                <td><asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="tbxSuite" Display="Dynamic" Enabled="True" ErrorMessage="Wrong format / only numbers" ForeColor="Red" ValidationExpression="[0-9]{0,5}" ValidationGroup="CheckV"></asp:RegularExpressionValidator></td>
                <td><asp:Label ID="Label15" runat="server" Text="Street address:" CssClass="userLabels"></asp:Label></td>
                <td><asp:TextBox ID="tbxStreet" runat="server"></asp:TextBox></td>
                <td></td>
                <td></td>
            </tr>
            <tr><td><asp:Label ID="Label14" runat="server" Text="City:" CssClass="userLabels"></asp:Label></td>
                <td><asp:TextBox ID="tbxCity" runat="server" CausesValidation="true"></asp:TextBox></td>
                <td><asp:Label ID="Label16" runat="server" Text="*" style="color:red;"></asp:Label></td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="CheckV" runat="server" ErrorMessage="That field is required!" Display="Dynamic" ControlToValidate="tbxCity" ForeColor="Red"></asp:RequiredFieldValidator></td>
                <td><asp:Label ID="Label17" runat="server" Text="Country:" CssClass="userLabels"></asp:Label></td>
                <td><asp:TextBox ID="tbxCountry" runat="server" CausesValidation="true"></asp:TextBox></td>
                <td><asp:Label ID="Label18" runat="server" Text="*" style="color:red;"></asp:Label></td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator8" ValidationGroup="CheckV" runat="server" ErrorMessage="That field is required!" Display="Dynamic" ControlToValidate="tbxCountry" ForeColor="Red"></asp:RequiredFieldValidator></td>
            </tr>
            <tr><td style="height:20px" colspan="8"></tr> <%--empty row for space--%>
        </table>
    </asp:Panel>
    <asp:Panel ID="SearchResults" runat="server" visible="false"> <%--hide table until button click--%>
        <h4>Search results: <asp:Button ID="hideResults" runat="server" Text="(Hide)" CssClass="nav_buttons2" OnClick="hideResults_Click" /></h4>
        <asp:ListBox ID="lbxResults" runat="server" Width="977px" Height="150px"></asp:ListBox>
    </asp:Panel>
</asp:Content>

