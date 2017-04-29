<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="viewcredentialing.aspx.cs" Inherits="AOBriefcase.viewcredentialing" %>


<asp:Content ID="stuff_1" ContentPlaceHolderID="head" runat="server">
    <title>Provider Credentialing Viewer</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <link rel="stylesheet" href="viewcredentialing.css" type="text/css" />
</asp:Content>

<asp:Content ID="submenuview" ContentPlaceHolderID="submenu" runat="server">
    <div id="subNavigationBar">
        <br />
        <h3 id="PCV"><span style="color:#D4B47C">P</span>rovider <br /> <span style="color:#D4B47C">C</span>redentialing <br /> <span style="color:#D4B47C">V</span>iewer</h3>
        <asp:Menu
            ID="subNavi" 
            runat="server" 
            EnabledViewState="false" 
            Orientation="Vertical" 
            OnMenuItemClick="subNavi_MenuItemClick"
            IncludeStyleBlock="true" 
            ItemWrap="false"
	    CssClass="subMenuNavi"
	    StaticSelectedStyle-CssClass="subMenuNavi_Selected"
            >

            <Items>
                <asp:MenuItem Text="Contract Details" />
                <asp:MenuItem Text="Provider Credentialing" Selected="true"/>
                <asp:MenuItem Text="Authorization Requirements" />
                <asp:MenuItem Text="Business Office Details" />
            </Items>
        </asp:Menu>

    </div>
</asp:Content>


<asp:Content ID="stuff_2" ContentPlaceHolderID="MainContent" runat="server">
	<div ID="infoSpace">
	<div ID="debugMsgs">
	    <asp:Label ID="viewGUID" runat="server" Visible="false"></asp:Label>
	    <asp:Label ID="viewGUID2" runat="server" Visible="false"></asp:Label>
	</div>

        <div ID="infoTable">
	        <asp:GridView 
	            ID="GridView1" 
	            runat="server" 
	            Width="100%"
	            AutoGenerateColumns="False" 
	            DataSourceID="SqlDataSource2"
	            Gridlines="None"
	            HeaderText="Credentialing Details"
	            CssClass="viewer"
	            HeaderStyle-CssClass="detailheader"
	            FieldHeaderStyle-CssClass="detailfieldheader"
	            AlternatingRowStyle-CssClass="alternatingRow"
	            >
	            <Columns>
	                <%--<asp:BoundField DataField="ProviderID" HeaderText="ProviderID" SortExpression="ProviderID" />--%>
	                <asp:BoundField DataField="Provider_FullName" HeaderText="Provider" SortExpression="Provider_FullName" ItemStyle-Width="20%"/>
	                <asp:BoundField DataField="Credentialing_Status" HeaderText="Status" SortExpression="Credentialing_Status" ItemStyle-Width="15%"/>
	                <asp:BoundField DataField="Credentialing_EffectiveDate" HeaderText="Effective Date" SortExpression="Credentialing_EffectiveDate" ItemStyle-Width="15%" />
	                <asp:BoundField DataField="Credentialing_Comment" HeaderText="Comments" SortExpression="Credentialing_Comment" ItemStyle-Width="70%"/>
	                <%--<asp:BoundField DataField="GUID" HeaderText="GUID" SortExpression="GUID" />--%>
	            </Columns>
	        </asp:GridView>
	</div>
	</div>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ProviderID], [Provider_FullName], [Credentialing_Status], [Credentialing_EffectiveDate], [Credentialing_Comment], [GUID] FROM [Contract_Demographics] AS Base JOIN [ProviderContract_junction] AS Beta ON Base.[ContractID] = Beta.[ContractID] JOIN [ProviderList] AS Alpha ON [ProviderListID] = [ProviderID] WHERE [GUID] = @guid AND [Provider_Status] = 1">
            <SelectParameters>
                <asp:QueryStringParameter Name="guid" QueryStringField="guid" />
            </SelectParameters>
        </asp:SqlDataSource>    

</asp:Content>