<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ProviderEdit.aspx.cs" Inherits="AOBriefcase.ProviderEdit" MaintainScrollPositionOnPostBack = "true" %>


<asp:Content ID="stuff_1" ContentPlaceHolderID="head" runat="server">
    <title>Provider Configuration</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <link rel="stylesheet" href="ProviderEdit.css" type="text/css"/>
</asp:Content>


<asp:Content ID="submenuview" ContentPlaceHolderID="submenu" runat="server">

    <div id="subNavigationBar">

        <br />
        <h3 id="PC"><span style="color:#D4B47C">P</span>rovider <br /> <span style="color:#D4B47C">C</span>onfiguration</h3>
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
                <asp:MenuItem Text="Configure Providers" Selected="true"/>
                <asp:MenuItem Text="Configure Billing Users" Selectable="false" Tooltip="Feature is not yet implemented"/>
                <asp:MenuItem Text="Configure Attachments" />
            </Items>

        </asp:Menu>

    </div>

</asp:Content>


<asp:Content ID="stuff_2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div id="editSpace">
    
        <div id="editHeaders" runat="server" class="editHeaders">
            <h2>You have entered the Provider Configuration module. Please be very careful here.</h2>
            <h4>Add or edit AO Providers in this screen.</h4>
            <h4>If a Provider is no longer with AO, please uncheck the checkbox in "Provider_Status"</h4>
            <h4>Always leave the ProviderListID column blank when entering a new provider.</h4>
        </div>

        <div id="editGrid">

            <asp:GridView 
            ID="GridView1" 
            runat="server" 
            AutoGenerateColumns="False" 
            DataKeyNames="ProviderListID" 
            DataSourceID="ProviderDB" 
            Gridlines="None"
            CssClass="viewer" 
            HeaderStyle-CssClass="detailheader" 
            FieldHeaderStyle-CssClass="detailfieldheader" 
            AlternatingRowStyle-CssClass="alternatingRow"
             
            >
            <Columns>
                <asp:CommandField ShowDeleteButton="false" ShowEditButton="True" ShowInsertButton="true" ButtonType="Button" />
                <asp:BoundField DataField="ProviderListID" HeaderText="ProviderListID" InsertVisible="False" ReadOnly="True" SortExpression="ProviderListID" />
                <asp:BoundField DataField="Provider_FullName" HeaderText="Provider_FullName" SortExpression="Provider_FullName" />
                <asp:BoundField DataField="Provider_PLUS" HeaderText="Provider_PLUS" SortExpression="Provider_PLUS" />
                <asp:BoundField DataField="Provider_Facilities" HeaderText="Provider_Facilities" SortExpression="Provider_Facilities" />
                <asp:BoundField DataField="Provider_Specialty" HeaderText="Provider_Specialty" SortExpression="Provider_Specialty" />
                <asp:CheckBoxField DataField="Provider_Status" HeaderText="Provider_Status" SortExpression="Provider_Status" />
            </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="ProviderDB" runat="server" ConnectionString="<%$ ConnectionStrings:DemographicsConnectionString %>" DeleteCommand="DELETE FROM [ProviderList] WHERE [ProviderListID] = @ProviderListID" InsertCommand="INSERT INTO [ProviderList] ([Provider_FullName], [Provider_PLUS], [Provider_Facilities], [Provider_Specialty], [Provider_Status]) VALUES (@Provider_FullName, @Provider_PLUS, @Provider_Facilities, @Provider_Specialty, @Provider_Status)" SelectCommand="SELECT * FROM [ProviderList]" UpdateCommand="UPDATE [ProviderList] SET [Provider_FullName] = @Provider_FullName, [Provider_PLUS] = @Provider_PLUS, [Provider_Facilities] = @Provider_Facilities, [Provider_Specialty] = @Provider_Specialty, [Provider_Status] = @Provider_Status WHERE [ProviderListID] = @ProviderListID">
                <DeleteParameters>
                    <asp:Parameter Name="ProviderListID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Provider_FullName" Type="String" />
                    <asp:Parameter Name="Provider_PLUS" Type="String" />
                    <asp:Parameter Name="Provider_Facilities" Type="String" />
                    <asp:Parameter Name="Provider_Specialty" Type="String" />
                    <asp:Parameter Name="Provider_Status" Type="Boolean" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Provider_FullName" Type="String" />
                    <asp:Parameter Name="Provider_PLUS" Type="String" />
                    <asp:Parameter Name="Provider_Facilities" Type="String" />
                    <asp:Parameter Name="Provider_Specialty" Type="String" />
                    <asp:Parameter Name="Provider_Status" Type="Boolean" />
                    <asp:Parameter Name="ProviderListID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>