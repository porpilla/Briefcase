<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AttachmentInterface.aspx.cs" Inherits="AOBriefcase.AttachmentInterface" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Attachment Management Interface</title>
    <link rel="shortcut icon" type="image/x-icon" href="~/Images/favicon.ico" runat="server" />
    <link rel="icon" type="image/ico" href="~/Image/favicon.ico" runat="server" />
<style type="text/css" media="screen">
    @import "viewdetail.css";
</style>
</head>
<body>
    <form id="form1" runat="server">
    <a href="WebForm1.aspx">Back to search page</a>
    <br />
    <br />
        <h2>You have entered the attachment management interface. This is where you can upload PDF attachments for authorizations or billing.</h2>
    <br />
    <br />

        <div id="selectionInfoSpace">
            <asp:Label ID="selectionInfo" Visible="false" runat="server"></asp:Label>
        </div>

        <div id="AuthDoc" visible="false" runat="server">
            <p>Upload authorizations detail file here:</p>
            <asp:FileUpload ID="AuthUpload1" runat="server" />
            <asp:Button ID="btnAuthUpload" runat="server" Text="Upload File" OnClick="btnAuthUpload_Click" />
            <asp:Button ID="btnAuthClear" runat="server" Text="Delete File" OnClick="btnAuthClear_Click" Visible="false" />
        </div>
        <div id="BillDoc" visible="false" runat="server">
            <p>Upload billing/collections detail file here:</p>
            <asp:FileUpload ID="BillUpload1" runat="server" />
            <asp:Button ID="btnBillUpload" runat="server" Text="Upload File" OnClick="btnBillUpload_Click" />
            <asp:Button ID="btnBillClear" runat="server" Text="Delete File" OnClick="btnBillClear_Click" Visible="false" />
        </div>
        <asp:GridView 
            ID="GridView1" 
            runat="server" 
            AutoGenerateColumns="False" 
            DataKeyNames="GUID" 
            DataSourceID="SqlDataSource1"
            OnSelectedIndexChanged="IndexSelected"
            >
            <Columns>
                <asp:CommandField ShowSelectButton="True" ButtonType="Button" />
                <asp:BoundField DataField="AOID" HeaderText="AOID" SortExpression="AOID" />
                <asp:BoundField DataField="Contract_Name" HeaderText="Contract Name" SortExpression="Contract_Name"></asp:BoundField>
                <asp:BoundField DataField="Contract_PDF" HeaderText="Authorizations Detail File" SortExpression="Contract_PDF"></asp:BoundField>
                <asp:BoundField DataField="Billing_PDF" HeaderText="Billing Detail File" SortExpression="Billing_PDF" ></asp:BoundField>                
            </Columns>
        </asp:GridView>

        <asp:Label ID="testFilepath" runat="server">

        </asp:Label>

        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Contract_Demographics] ORDER BY [AOID], [Amend_Count]"></asp:SqlDataSource>
    </form>
</body>
</html>
