<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AttachmentInterface.aspx.cs" Inherits="AOBriefcase.AttachmentInterface" %>


<asp:Content ID="stuff_1" ContentPlaceHolderID="head" runat="server">
    <title>Attachment Management Interface</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <link rel="stylesheet" href="AttachmentInterface.css" type="text/css"/>    
</asp:Content>
    

<asp:Content ID="submenuview" ContentPlaceHolderID="submenu" runat="server">
    
    <div id="subNavigationBar">

        <br />
        <h3 id="DBE"><span style="color:#D4B47C">A</span>ttachment <br /> <span style="color:#D4B47C">C</span>onfiguration</h3>
        <asp:Menu
            ID="subNavi"
            runat="server"
            EnabledViewState="false"
            Orientation="Vertical"
            OnMenuItemClick="subNavi_MenuItem_Click"
            IncludeStyleBlock="true"
            ItemWrap="false"
            CssClass="subMenuNavi"
	        StaticSelectedStyle-CssClass="subMenuNavi_Selected"
            >

            <Items>
                <asp:MenuItem Text="Configure Contracts" />
                <asp:MenuItem Text="Configure Providers" />
                <asp:MenuItem Text="Configure Billing Users" Selectable="false" Tooltip="Feature is not yet implemented"/>
                <asp:MenuItem Text="Configure Attachments" Selected="true"/>
            </Items>

        </asp:Menu>

    </div>

</asp:Content>


<asp:Content ID="stuff_2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="editSpace">
        
        <div id="editHeaders" runat="server" class="editHeaders">
            <h2>You have entered the attachment management interface. This is where you can upload PDF attachments for authorizations or billing to download on their respective viewing pages.</h2>
            <h4>Files must be uploaded one at a time. Bulk upload functionality is not yet supported.</h4>
        </div>

        <div id="editToggles">

            <div id="selectionInfoSpace">
                <asp:Label ID="selectionInfo" Visible="false" runat="server"></asp:Label>
            </div>

            <div id="AuthDoc" visible="false" runat="server" class="authDoc">
                <p>Upload authorizations detail file here:</p>
                <asp:FileUpload ID="AuthUpload1" runat="server" class="uploader" />
                <asp:Button ID="btnAuthUpload" runat="server" Text="Upload File" OnClick="btnAuthUpload_Click" />
                <asp:Button ID="btnAuthClear" runat="server" Text="Delete File" OnClick="btnAuthClear_Click" Visible="false" />
            </div>

            <div id="BillDoc" visible="false" runat="server" class="billDoc">
                <p>Upload billing/collections detail file here:</p>
                <asp:FileUpload ID="BillUpload1" runat="server" class="uploader" />
                <asp:Button ID="btnBillUpload" runat="server" Text="Upload File" OnClick="btnBillUpload_Click" />
                <asp:Button ID="btnBillClear" runat="server" Text="Delete File" OnClick="btnBillClear_Click" Visible="false" />
            </div>

        </div>

        <br />
        <asp:GridView 
            ID="GridView1" 
            runat="server" 
            AutoGenerateColumns="False" 
            DataKeyNames="AOID, Amend_Count, GUID" 
            DataSourceID="SqlDataSource1"
            OnSelectedIndexChanged="IndexSelected"
            HeaderStyle-BackColor="#2b4b83"
            HeaderStyle-ForeColor="white"            
            CssClass="viewer"
            HeaderStyle-CssClass="detailheader"
            FieldHeaderStyle-CssClass="detailfieldheader"
            AlternatingRowStyle-CssClass="alternatingRow"
            RowStyle-Wrap="false"
            >
            <Columns>
                <asp:CommandField ShowSelectButton="True" ButtonType="Button" />
                <asp:BoundField DataField="AOID" HeaderText="AOID" SortExpression="AOID" />
                <asp:BoundField DataField="Amend_Count" HeaderText="Amend #" SortExpression="Amend_Count" />
                <asp:BoundField DataField="Contract_Name" HeaderText="Contract Name" SortExpression="Contract_Name"></asp:BoundField>
                <asp:BoundField DataField="Contract_PDF" HeaderText="Authorizations Detail File" SortExpression="Contract_PDF"></asp:BoundField>
                <asp:BoundField DataField="Billing_PDF" HeaderText="Billing Detail File" SortExpression="Billing_PDF" ></asp:BoundField>                
            </Columns>
        </asp:GridView>

        <asp:Label ID="Label1" runat="server"></asp:Label>

        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Contract_Demographics] ORDER BY [AOID], [Amend_Count]"></asp:SqlDataSource>

    </div>    

</asp:Content>