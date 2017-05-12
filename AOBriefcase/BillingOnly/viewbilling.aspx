<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewbilling.aspx.cs" Inherits="AOBriefcase.viewbilling" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contract Detail Viewer</title>
    <link rel="shortcut icon" type="image/x-icon" href="~/Images/favicon.ico" runat="server"/>
    <link rel="icon" type="image/ico" href="~/Images/favicon.ico" runat="server"/>
<%--<style type="text/css" media="screen">
    @import "viewbilling.css";
</style>--%>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Image ID="AOLogo" runat="server" ImageURL="~/Images/AOlogo.png"/>        
        <h2>Contract Billing/Collections Details</h2>
        <a href="~/WebForm1.aspx">Back to search page</a>
        <br />

        <asp:LoginView ID="LoginView1" runat="server">
            <AnonymousTemplate>
                Your session has not yet been authenticated. Please login to access the contract editors.
            </AnonymousTemplate>
            <LoggedInTemplate>
                Administration account authenticated. Access to contract editors enabled.
            </LoggedInTemplate>
        </asp:LoginView>

        <br />
        <div id="subMenu">
            <asp:Button ID="btnSub1" runat="server" class="btnSubMenu" Text="Details View" color="#fff" OnClick="btnSub1_Click"/>
            <asp:Button ID="btnSub2" runat="server" class="btnSubMenu" Text="Provider Credentialing View" color="#fff" OnClick="btnSub2_Click"/>
            <asp:Button ID="btnSub3" runat="server" class="btnSubMenu" Text="Authorization Requirements View" color="#fff" OnClick="btnSub3_Click"/>
            <asp:Button ID="btnSub4" runat="server" class="btnSubMenu" Text="Business Office Details View" color="#fff" OnClick="btnSub4_Click"/>
        </div>               
        <br />
        <br />
        <br />
    </form>
</body>
</html>
