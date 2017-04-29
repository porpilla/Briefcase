<%@ Page Language="C#" MasterPageFile="~/Site1.Master" UnobtrusiveValidationMode="none" AutoEventWireup="true" CodeBehind="DBEdit.aspx.cs" Inherits="AOBriefcase.DBEdit" MaintainScrollPositionOnPostBack = "false" %>


<asp:Content ID="stuff_1" ContentPlaceHolderID="head" runat="server">
    <title>Admin Page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <link rel="stylesheet" href="DBEdit.css" type="text/css"/>    
</asp:Content>

<asp:Content ID="submenuview" ContentPlaceHolderID="submenu" runat="server">

    <div id="subNavigationBar">
        <br />
        <h3 id="DBE"><span style="color:#D4B47C">D</span>ata<span style="color:#D4B47C">B</span>ase <br /> <span style="color:#D4B47C">E</span>ditor</h3>
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
                <asp:MenuItem Text="Configure Contracts" Selected="true" />
                <asp:MenuItem Text="Configure Providers" />
                <asp:MenuItem Text="Configure Billing Users" Selectable="false" Tooltip="Feature is not yet implemented"/>
                <asp:MenuItem Text="Configure Attachments" />
            </Items>

        </asp:Menu>

    </div>

</asp:Content>

<asp:Content ID="stuff_2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="editSpace">
    <div id="editHeaders" runat="server" class="editHeaders">
        <asp:LoginView ID="LoginView1" runat="server">
            <AnonymousTemplate>
                Your session has not yet been authenticated. Please login to access the contract editors.
            </AnonymousTemplate>
            <LoggedInTemplate>
                Administration account authenticated. Access to contract editors enabled.
            </LoggedInTemplate>
        </asp:LoginView>
        <br />
        Welcome
        <asp:LoginName ID="LoginName2" runat="server" Font-Bold ="true" />                        
        <asp:LoginStatus ID="LoginStatus2" runat="server" />        
        <h2>You have entered the Contract Configuration module. Please be very careful here.</h2>
        <h4>Add or edit AO Contracts in this screen. Deleting contracts is not recommended.</h4>
        </div>
    
    <div id="editToggles" >
        <asp:Label ID="StatusLabel1" ForeColor="Red" runat="server" Visible="false" AutoPostBack="true"/>
        <br />
        <asp:Button ID="btnEditCred" runat="server" class="btnDBSubMenu" Text="Edit this contract's Providers" color="#fff" OnClick="btnEditCred_Click" Visible="false"/>
        <asp:Button ID="btnEditCont" runat="server" class="btnDBSubMenu" Text="Edit this contract's Details" color="#fff" OnClick="btnEditCont_Click" Visible="false" />
        <asp:Button ID="btnEditClose" runat="server" class="btnDBSubMenu" Text="Close Editing Interface" color="#fff" OnClick="btnEditClose_Click" Visible="false" />
    </div>

        <asp:DetailsView 
            ID="DetailsView1" 
            runat="server" 
            AutoGenerateRows="False" 
            DataKeyNames="ContractID" 
            DataSourceID="SqlDataSource1"
            OnRowDataBound="DV1_AttachmentCheck"            
            Height="50px" 
            Width="400px" 
            Visible="False" 
            RowStyle-Wrap="false"
            HeaderText="Edit Interface"
            Gridlines="None"
            CssClass="viewer"
            HeaderStyle-CssClass="detailheader"
            FieldHeaderStyle-CssClass="detailfieldheader"
            AlternatingRowStyle-CssClass="alternatingRow"
            >
<AlternatingRowStyle CssClass="alternatingRow"></AlternatingRowStyle>

<FieldHeaderStyle CssClass="detailfieldheader"></FieldHeaderStyle>
            <Fields>
                <asp:CommandField ShowInsertButton="True" ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button"/>
                <asp:BoundField DataField="ContractID" HeaderText="ContractID" InsertVisible="False" ReadOnly="True" SortExpression="ContractID" />
                <asp:BoundField DataField="AOID" HeaderText="AOID" SortExpression="AOID" />
                <asp:BoundField DataField="Amend_Count" HeaderText="Amend_Count" SortExpression="Amend_Count" />
                <asp:BoundField DataField="Amend_Comment" HeaderText="Amend_Comment" SortExpression="Amend_Comment" />
                <asp:BoundField DataField="Contract_Name" HeaderText="Contract_Name" SortExpression="Contract_Name" />
                <asp:BoundField DataField="Contract_Alias1" HeaderText="Contract_Alias1" SortExpression="Contract_Alias1" />
                <asp:BoundField DataField="Contract_Alias2" HeaderText="Contract_Alias2" SortExpression="Contract_Alias2" />
                <asp:BoundField DataField="Contract_Alias3" HeaderText="Contract_Alias3" SortExpression="Contract_Alias3" />
                <asp:BoundField DataField="Contract_Alias4" HeaderText="Contract_Alias4" SortExpression="Contract_Alias4" />
                <asp:BoundField DataField="Contract_Type" HeaderText="Contract_Type" SortExpression="Contract_Type" />
                <asp:BoundField DataField="Contract_Parent" HeaderText="Contract_Parent" SortExpression="Contract_Parent" />
                <asp:TemplateField HeaderText="Contract_FC" SortExpression="Contract_FC">
                    <EditItemTemplate>
                        <asp:DropDownList 
                            ID="DropDownList1" 
                            runat="server" 
                            DataSourceID="FC_DataSource1" 
                            DataTextField="FinancialClass_Name" 
                            DataValueField="FinancialClass_Name" 
                            SelectedValue='<%# Bind("Contract_FC") %>'
                            >
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList 
                            ID="DropDownList1" 
                            runat="server" 
                            DataSourceID="FC_DataSource1" 
                            DataTextField="FinancialClass_Name" 
                            DataValueField="FinancialClass_Name" 
                            SelectedValue='<%# Bind("Contract_FC") %>'
                            >
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Contract_FC") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Contract_UpdateDate" HeaderText="Contract_UpdateDate" SortExpression="Contract_UpdateDate" />
                <asp:BoundField DataField="Contract_TerminateDate" HeaderText="Contract_TerminateDate" SortExpression="Contract_TerminateDate" />
                <asp:BoundField DataField="Contract_EffectiveDate" HeaderText="Contract_EffectiveDate" SortExpression="Contract_EffectiveDate" />
                <asp:TemplateField HeaderText="Contract_Status" SortExpression="Contract_Status">
                    <EditItemTemplate>
                        <asp:DropDownList 
                            ID="DropDownList2" 
                            runat="server" 
                            DataSourceID="Status_DataSource1" 
                            DataTextField="ContractStatus_Name" 
                            DataValueField="ContractStatus_Name" 
                            SelectedValue='<%# Bind("Contract_Status") %>'
                            >
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList 
                            ID="DropDownList2" 
                            runat="server" 
                            DataSourceID="Status_DataSource1" 
                            DataTextField="ContractStatus_Name" 
                            DataValueField="ContractStatus_Name" 
                            SelectedValue='<%# Bind("Contract_Status") %>'
                            >
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Contract_Status") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Contract_Homepage" HeaderText="Contract_Homepage" SortExpression="Contract_Homepage" />
                <asp:BoundField DataField="Contract_Phone" HeaderText="Contract_Phone" SortExpression="Contract_Phone" />                
                <asp:TemplateField HeaderText="Contract_PDF" SortExpression="Contract_PDF">
                    <EditItemTemplate>
                        <asp:LinkButton ID="lbtnContract_PDF" runat="server" CommandArgument='<%# Bind("Contract_PDF") %>' CommandName="UploadtoContract" Text='<%# Bind("Contract_PDF") %>'/>
                        <asp:FileUpload ID="fileU_Contract_PDF" runat="server" />
                        <asp:Button ID="btnContract_PDFUpload" runat="server" Text="Upload" CommandName="btnContract_PDFUpload_Click" />
                        <%--<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Contract_PDF") %>'></asp:TextBox>--%>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Contract_PDF") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Contract_PDF") %>'></asp:Label>                        
                    </ItemTemplate>
                </asp:TemplateField>
		<asp:BoundField DataField="Billing_PDF" HeaderText="Billing_PDF" SortExpression="Billing_PDF" />
                <asp:BoundField DataField="SVC_Injectibles" HeaderText="SVC_Injectibles" SortExpression="SVC_Injectibles" />
                <asp:CheckBoxField DataField="SVC_Injections" HeaderText="SVC_Injections" SortExpression="SVC_Injections" />                
                <asp:CheckBoxField DataField="SVC_OfficeVisits" HeaderText="SVC_OfficeVisits" SortExpression="SVC_OfficeVisits" />
                <asp:CheckBoxField DataField="SVC_SX" HeaderText="SVC_SX" SortExpression="SVC_SX" />
                <asp:CheckBoxField DataField="SVC_Radiology" HeaderText="SVC_Radiology" SortExpression="SVC_Radiology" />
                <asp:CheckBoxField DataField="SVC_OT" HeaderText="SVC_OT" SortExpression="SVC_OT" />
                <asp:CheckBoxField DataField="SVC_PT" HeaderText="SVC_PT" SortExpression="SVC_PT" />
                <asp:CheckBoxField DataField="SVC_PainMgmt" HeaderText="SVC_PainMgmt" SortExpression="SVC_PainMgmt" />
                <asp:CheckBoxField DataField="SVC_Podiatry" HeaderText="SVC_Podiatry" SortExpression="SVC_Podiatry" />
                <asp:CheckBoxField DataField="SVC_DME" HeaderText="SVC_DME" SortExpression="SVC_DME" />
                <asp:BoundField DataField="Auth_ProviderPortal" HeaderText="Auth_ProviderPortal" SortExpression="Auth_ProviderPortal" />
                <asp:BoundField DataField="Auth_OfficeVisits" HeaderText="Auth_OfficeVisits" SortExpression="Auth_OfficeVisits" />
                <asp:BoundField DataField="Auth_OfficeVisits_Note" HeaderText="Auth_OfficeVisits_Note" SortExpression="Auth_OfficeVisits_Note" />
                <asp:BoundField DataField="Auth_SX" HeaderText="Auth_SX" SortExpression="Auth_SX" />
                <asp:BoundField DataField="Auth_SX_Note" HeaderText="Auth_SX_Note" SortExpression="Auth_SX_Note" />
                <asp:BoundField DataField="Auth_Radiology" HeaderText="Auth_Radiology" SortExpression="Auth_Radiology" />
                <asp:BoundField DataField="Auth_Radiology_Note" HeaderText="Auth_Radiology_Note" SortExpression="Auth_Radiology_Note" />
                <asp:BoundField DataField="Auth_PT" HeaderText="Auth_PT" SortExpression="Auth_PT" />
                <asp:BoundField DataField="Auth_PT_Note" HeaderText="Auth_PT_Note" SortExpression="Auth_PT_Note" />
                <asp:BoundField DataField="Auth_OT" HeaderText="Auth_OT" SortExpression="Auth_OT" />
                <asp:BoundField DataField="Auth_OT_Note" HeaderText="Auth_OT_Note" SortExpression="Auth_OT_Note" />
                <asp:BoundField DataField="Auth_PainMgmt" HeaderText="Auth_PainMgmt" SortExpression="Auth_PainMgmt" />
                <asp:BoundField DataField="Auth_PainMgmt_Note" HeaderText="Auth_PainMgmt_Note" SortExpression="Auth_PainMgmt_Note" />
                <asp:BoundField DataField="Auth_DME" HeaderText="Auth_DME" SortExpression="Auth_DME" />
                <asp:BoundField DataField="Auth_DME_Note" HeaderText="Auth_DME_Note" SortExpression="Auth_DME_Note" />
                <asp:BoundField DataField="Auth_Podiatry" HeaderText="Auth_Podiatry" SortExpression="Auth_Podiatry" />
                <asp:BoundField DataField="Auth_Podiatry_Note" HeaderText="Auth_Podiatry_Note" SortExpression="Auth_Podiatry_Note" />
                <asp:BoundField DataField="Auth_Injections" HeaderText="Auth_Injections" SortExpression="Auth_Injections" />
                <asp:BoundField DataField="Auth_Injections_Note" HeaderText="Auth_Injections_Note" SortExpression="Auth_Injections_Note" />

            </Fields>

<HeaderStyle CssClass="detailheader"></HeaderStyle>

<RowStyle Wrap="False"></RowStyle>
        </asp:DetailsView>

        <asp:GridView 
            ID="GridView2" 
            runat="server" 
            AutoGenerateRows="False" 
            DataSourceID="SqlDataSource2" 
            Height="50px" 
            Width="150px" 
            AutoGenerateColumns="False" 
            DataKeyNames="ProviderID,ContractID"            
            Gridlines="None" 
            HeaderStyle-BackColor="#2b4b83"
            HeaderStyle-ForeColor="white"            
            CssClass="viewer"
            HeaderStyle-CssClass="detailheader"
            FieldHeaderStyle-CssClass="detailfieldheader"
            AlternatingRowStyle-CssClass="alternatingRow"
            RowStyle-Wrap="false" 
            Visible="false"
            >
            <Columns>
                <asp:CommandField ShowEditButton="True" ButtonType="Button" />
                <asp:BoundField DataField="ProviderID" HeaderText="ProviderID" SortExpression="ProviderID" ReadOnly="True" Visible="false"/>
                <asp:BoundField DataField="Provider_FullName" HeaderText="Provider_FullName" SortExpression="Provider_FullName" ReadOnly="true"/>
                <asp:BoundField DataField="ContractID" HeaderText="ContractID" SortExpression="ContractID" ReadOnly="True" Visible="false"/>
                <asp:BoundField DataField="Credentialing_Status" HeaderText="Credentialing_Status" SortExpression="Credentialing_Status" />
                <asp:BoundField DataField="Credentialing_EffectiveDate" HeaderText="Credentialing_EffectiveDate" SortExpression="Credentialing_EffectiveDate" />                
		<asp:BoundField DataField="Credentialing_Comment" HeaderText="Credentialing_Comment" SortExpression="Credentialing_Comment" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource 
            ID="SqlDataSource2" 
            runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT ProviderContract_junction.ProviderID, ProviderContract_junction.ContractID, ProviderContract_junction.Credentialing_Status, ProviderContract_junction.Credentialing_EffectiveDate, ProviderContract_junction.Credentialing_Comment, ProviderList.Provider_FullName FROM ProviderContract_junction INNER JOIN ProviderList ON ProviderContract_junction.ProviderID = ProviderList.ProviderListID WHERE (ProviderContract_junction.ContractID = @ContractID) AND (ProviderList.Provider_Status = 1) ORDER BY ProviderContract_junction.ProviderID DESC"
            UpdateCommand="UPDATE [ProviderContract_junction] SET [Credentialing_Status] = @Credentialing_Status, [Credentialing_EffectiveDate] = @Credentialing_EffectiveDate, [Credentialing_Comment] = @Credentialing_Comment WHERE [ContractID] = @ContractID AND [ProviderID] = @ProviderID"
            >
            <UpdateParameters>
                <asp:Parameter Name="Credentialing_Status" Type="String" />
    	        <asp:Parameter DbType="Date" Name="Credentialing_EffectiveDate" />
		<asp:Parameter Name="Credentialing_Comment" Type="String" />
	            <asp:Parameter Name="ContractID" Type="Int32" />
	            <asp:Parameter Name="ProviderID" Type="Int32" />
            </UpdateParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="ContractID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView 
            ID="GridView1" 
            runat="server" 
            AllowPaging="True" 
            AutoGenerateColumns="False" 
            DataKeyNames="ContractID" 
            DataSourceID="SqlDataSource1" 
            OnSelectedIndexChanged="ChangeSelectedIndex"            
            HeaderStyle-Backcolor="#2b4b83"
            HeaderStyle-Forecolor="White" 
            CssClass="viewer"
	        HeaderStyle-CssClass="detailheader"
	        FieldHeaderStyle-CssClass="detailfieldheader"
	        AlternatingRowStyle-CssClass="alternatingRow" 
            RowStyle-Wrap="false" 
            HeaderStyle-Wrap="false"            
            >
            <Columns>
                <asp:CommandField ShowSelectButton="True" ButtonType="Button"/>
                <asp:BoundField DataField="ContractID" HeaderText="ContractID" SortExpression="ContractID" InsertVisible="False" ReadOnly="True"></asp:BoundField>
                <asp:BoundField DataField="AOID" HeaderText="AOID" SortExpression="AOID" />
                <asp:BoundField DataField="Amend_Count" HeaderText="Amend_Count" SortExpression="Amend_Count" />
                <asp:BoundField DataField="Amend_Comment" HeaderText="Amend_Comment" SortExpression="Amend_Comment" />
                <asp:BoundField DataField="Contract_Name" HeaderText="Contract_Name" SortExpression="Contract_Name" />
                <asp:BoundField DataField="Contract_Type" HeaderText="Contract_Type" SortExpression="Contract_Type" />
                <asp:BoundField DataField="Contract_Parent" HeaderText="Contract_Parent" SortExpression="Contract_Parent" />
                <asp:BoundField DataField="Contract_FC" HeaderText="Contract_FC" SortExpression="Contract_FC" />
                <asp:BoundField DataField="Contract_Alias3" HeaderText="Contract_Alias3" SortExpression="Contract_Alias3" />
                <asp:BoundField DataField="Contract_Alias2" HeaderText="Contract_Alias2" SortExpression="Contract_Alias2" />
                <asp:BoundField DataField="Contract_Alias1" HeaderText="Contract_Alias1" SortExpression="Contract_Alias1" />
                <asp:BoundField DataField="Contract_UpdateDate" HeaderText="Contract_UpdateDate" SortExpression="Contract_UpdateDate" />
                <asp:BoundField DataField="Contract_TerminateDate" HeaderText="Contract_TerminateDate" SortExpression="Contract_TerminateDate" />
                <asp:BoundField DataField="Contract_EffectiveDate" HeaderText="Contract_EffectiveDate" SortExpression="Contract_EffectiveDate" />
                <asp:BoundField DataField="Contract_Status" HeaderText="Contract_Status" SortExpression="Contract_Status" />
                <asp:BoundField DataField="Contract_Homepage" HeaderText="Contract_Homepage" SortExpression="Contract_Homepage" />
                <asp:BoundField DataField="Contract_Phone" HeaderText="Contract_Phone" SortExpression="Contract_Phone" />
                <asp:BoundField DataField="Contract_PDF" HeaderText="Contract_PDF" SortExpression="Contract_PDF" />
		<asp:BoundField DataField="Billing_PDF" HeaderText="Billing_PDF" SortExpression="Billing_PDF" />                
                <asp:BoundField DataField="SVC_Injectibles" HeaderText="SVC_Injectibles" SortExpression="SVC_Injectibles" />
                <asp:CheckBoxField DataField="SVC_Injections" HeaderText="SVC_Injections" SortExpression="SVC_Injections" />
                <asp:BoundField DataField="Contract_Alias4" HeaderText="Contract_Alias4" SortExpression="Contract_Alias4" />
                <asp:CheckBoxField DataField="SVC_OfficeVisits" HeaderText="SVC_OfficeVisits" SortExpression="SVC_OfficeVisits" />
                <asp:CheckBoxField DataField="SVC_SX" HeaderText="SVC_SX" SortExpression="SVC_SX" />
                <asp:CheckBoxField DataField="SVC_Radiology" HeaderText="SVC_Radiology" SortExpression="SVC_Radiology" />
                <asp:CheckBoxField DataField="SVC_OT" HeaderText="SVC_OT" SortExpression="SVC_OT" />
                <asp:CheckBoxField DataField="SVC_PT" HeaderText="SVC_PT" SortExpression="SVC_PT" />
                <asp:CheckBoxField DataField="SVC_PainMgmt" HeaderText="SVC_PainMgmt" SortExpression="SVC_PainMgmt" />
                <asp:CheckBoxField DataField="SVC_Podiatry" HeaderText="SVC_Podiatry" SortExpression="SVC_Podiatry" />
                <asp:CheckBoxField DataField="SVC_DME" HeaderText="SVC_DME" SortExpression="SVC_DME" />
                <asp:BoundField DataField="Auth_ProviderPortal" HeaderText="Auth_ProviderPortal" SortExpression="Auth_ProviderPortal" />
                <asp:BoundField DataField="Auth_OfficeVisits" HeaderText="Auth_OfficeVisits" SortExpression="Auth_OfficeVisits" />
                <asp:BoundField DataField="Auth_OfficeVisits_Note" HeaderText="Auth_OfficeVisits_Note" SortExpression="Auth_OfficeVisits_Note" />
                <asp:BoundField DataField="Auth_SX" HeaderText="Auth_SX" SortExpression="Auth_SX" />
                <asp:BoundField DataField="Auth_SX_Note" HeaderText="Auth_SX_Note" SortExpression="Auth_SX_Note" />
                <asp:BoundField DataField="Auth_Radiology" HeaderText="Auth_Radiology" SortExpression="Auth_Radiology" />
                <asp:BoundField DataField="Auth_Radiology_Note" HeaderText="Auth_Radiology_Note" SortExpression="Auth_Radiology_Note" />
                <asp:BoundField DataField="Auth_PT" HeaderText="Auth_PT" SortExpression="Auth_PT" />
                <asp:BoundField DataField="Auth_PT_Note" HeaderText="Auth_PT_Note" SortExpression="Auth_PT_Note" />
                <asp:BoundField DataField="Auth_OT" HeaderText="Auth_OT" SortExpression="Auth_OT" />
                <asp:BoundField DataField="Auth_OT_Note" HeaderText="Auth_OT_Note" SortExpression="Auth_OT_Note" />
                <asp:BoundField DataField="Auth_PainMgmt" HeaderText="Auth_PainMgmt" SortExpression="Auth_PainMgmt" />
                <asp:BoundField DataField="Auth_PainMgmt_Note" HeaderText="Auth_PainMgmt_Note" SortExpression="Auth_PainMgmt_Note" />
                <asp:BoundField DataField="Auth_DME" HeaderText="Auth_DME" SortExpression="Auth_DME" />
                <asp:BoundField DataField="Auth_DME_Note" HeaderText="Auth_DME_Note" SortExpression="Auth_DME_Note" />
                <asp:BoundField DataField="Auth_Podiatry" HeaderText="Auth_Podiatry" SortExpression="Auth_Podiatry" />
                <asp:BoundField DataField="Auth_Podiatry_Note" HeaderText="Auth_Podiatry_Note" SortExpression="Auth_Podiatry_Note" />
                <asp:BoundField DataField="Auth_Injections" HeaderText="Auth_Injections" SortExpression="Auth_Injections" />
                <asp:BoundField DataField="Auth_Injections_Note" HeaderText="Auth_Injections_Note" SortExpression="Auth_Injections_Note" />                

            </Columns>
        </asp:GridView>
        
</div>
        <asp:SqlDataSource 
            ID="SqlDataSource1" 
            runat="server" 
            ConnectionString="<%$ ConnectionStrings:DemographicsConnectionString %>" 
            DeleteCommand="DELETE FROM [Contract_Demographics] WHERE [ContractID] = @ContractID" 
            InsertCommand="INSERT INTO [Contract_Demographics] ([AOID], [Amend_Count], [Amend_Comment], [Contract_Name], [Contract_Type], [Contract_Parent], [Contract_FC], [Contract_Alias3], [Contract_Alias2], [Contract_Alias1], [Contract_UpdateDate], [Contract_TerminateDate], [Contract_EffectiveDate], [Contract_Status], [Contract_Homepage], [Contract_Phone], [Contract_PDF], [Billing_PDF], [Auth_ProviderPortal], [SVC_Injectibles], [SVC_Injections], [Contract_Alias4], [SVC_OfficeVisits], [SVC_SX], [SVC_Radiology], [SVC_OT], [SVC_PT], [SVC_PainMgmt], [SVC_Podiatry], [SVC_DME], [Auth_OfficeVisits], [Auth_OfficeVisits_Note], [Auth_SX], [Auth_SX_Note], [Auth_Radiology], [Auth_Radiology_Note], [Auth_PT], [Auth_PT_Note], [Auth_OT], [Auth_OT_Note], [Auth_PainMgmt], [Auth_PainMgmt_Note], [Auth_DME], [Auth_DME_Note], [Auth_Podiatry], [Auth_Podiatry_Note], [Auth_Injections], [Auth_Injections_Note]) VALUES (@AOID, @Amend_Count, @Amend_Comment, @Contract_Name, @Contract_Type, @Contract_Parent, @Contract_FC, @Contract_Alias3, @Contract_Alias2, @Contract_Alias1, @Contract_UpdateDate, @Contract_TerminateDate, @Contract_EffectiveDate, @Contract_Status, @Contract_Homepage, @Contract_Phone, @Contract_PDF, @Billing_PDF, @Auth_ProviderPortal, @SVC_Injectibles, @SVC_Injections, @Contract_Alias4, @SVC_OfficeVisits, @SVC_SX, @SVC_Radiology, @SVC_OT, @SVC_PT, @SVC_PainMgmt, @SVC_Podiatry, @SVC_DME, @Auth_OfficeVisits, @Auth_OfficeVisits_Note, @Auth_SX, @Auth_SX_Note, @Auth_Radiology, @Auth_Radiology_Note, @Auth_PT, @Auth_PT_Note, @Auth_OT, @Auth_OT_Note, @Auth_PainMgmt, @Auth_PainMgmt_Note, @Auth_DME, @Auth_DME_Note, @Auth_Podiatry, @Auth_Podiatry_Note, @Auth_Injections, @Auth_Injections_Note)" 
            SelectCommand="SELECT [ContractID], [AOID], [Amend_Count], [Amend_Comment], [Contract_Name], [Contract_Type], [Contract_Parent], [Contract_FC], [Contract_Alias3], [Contract_Alias2], [Contract_Alias1], [Contract_UpdateDate], [Contract_TerminateDate], [Contract_EffectiveDate], [Contract_Status], [Contract_Homepage], [Contract_Phone], [Contract_PDF], [Billing_PDF], [Auth_ProviderPortal], [SVC_Injectibles], [SVC_Injections], [Contract_Alias4], [SVC_OfficeVisits], [SVC_SX], [SVC_Radiology], [SVC_OT], [SVC_PT], [SVC_PainMgmt], [SVC_Podiatry], [SVC_DME], [Auth_OfficeVisits], [Auth_OfficeVisits_Note], [Auth_SX], [Auth_SX_Note], [Auth_Radiology], [Auth_Radiology_Note], [Auth_PT], [Auth_PT_Note], [Auth_OT], [Auth_OT_Note], [Auth_PainMgmt], [Auth_PainMgmt_Note], [Auth_DME], [Auth_DME_Note], [Auth_Podiatry], [Auth_Podiatry_Note], [Auth_Injections], [Auth_Injections_Note] FROM [Contract_Demographics] ORDER BY [AOID], [Amend_Count]" 
            UpdateCommand="UPDATE [Contract_Demographics] SET [AOID] = @AOID, [Amend_Count] = @Amend_Count, [Amend_Comment] = @Amend_Comment, [Contract_Name] = @Contract_Name, [Contract_Type] = @Contract_Type, [Contract_Parent] = @Contract_Parent, [Contract_FC] = @Contract_FC, [Contract_Alias3] = @Contract_Alias3, [Contract_Alias2] = @Contract_Alias2, [Contract_Alias1] = @Contract_Alias1, [Contract_UpdateDate] = @Contract_UpdateDate, [Contract_TerminateDate] = @Contract_TerminateDate, [Contract_EffectiveDate] = @Contract_EffectiveDate, [Contract_Status] = @Contract_Status, [Contract_Homepage] = @Contract_Homepage, [Contract_Phone] = @Contract_Phone, [Contract_PDF] = @Contract_PDF, [Billing_PDF] = @Billing_PDF, [Auth_ProviderPortal] = @Auth_ProviderPortal, [SVC_Injectibles] = @SVC_Injectibles, [SVC_Injections] = @SVC_Injections, [Contract_Alias4] = @Contract_Alias4, [SVC_OfficeVisits] = @SVC_OfficeVisits, [SVC_SX] = @SVC_SX, [SVC_Radiology] = @SVC_Radiology, [SVC_OT] = @SVC_OT, [SVC_PT] = @SVC_PT, [SVC_PainMgmt] = @SVC_PainMgmt, [SVC_Podiatry] = @SVC_Podiatry, [SVC_DME] = @SVC_DME, [Auth_OfficeVisits] = @Auth_OfficeVisits, [Auth_OfficeVisits_Note] = @Auth_OfficeVisits_Note, [Auth_SX] = @Auth_SX, [Auth_SX_Note] = @Auth_SX_Note, [Auth_Radiology] = @Auth_Radiology, [Auth_Radiology_Note] = @Auth_Radiology_Note, [Auth_PT] = @Auth_PT, [Auth_PT_Note] = @Auth_PT_Note, [Auth_OT] = @Auth_OT, [Auth_OT_Note] = @Auth_OT_Note, [Auth_PainMgmt] = @Auth_PainMgmt, [Auth_PainMgmt_Note] = @Auth_PainMgmt_Note, [Auth_DME] = @Auth_DME, [Auth_DME_Note] = @Auth_DME_Note, [Auth_Podiatry] = @Auth_Podiatry, [Auth_Podiatry_Note] = @Auth_Podiatry_Note, [Auth_Injections] = @Auth_Injections, [Auth_Injections_Note] = @Auth_Injections_Note WHERE [ContractID] = @ContractID"
            >
            <DeleteParameters>
                <asp:Parameter Name="ContractID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="AOID" Type="String" />
                <asp:Parameter Name="Amend_Count" Type="Int32" />
                <asp:Parameter Name="Amend_Comment" Type="String" />
                <asp:Parameter Name="Contract_Name" Type="String" />
                <asp:Parameter Name="Contract_Type" Type="String" />
                <asp:Parameter Name="Contract_Parent" Type="String" />
                <asp:Parameter Name="Contract_FC" Type="String" />
                <asp:Parameter Name="Contract_Alias3" Type="String" />
                <asp:Parameter Name="Contract_Alias2" Type="String" />
                <asp:Parameter Name="Contract_Alias1" Type="String" />
                <asp:Parameter DbType="Date" Name="Contract_UpdateDate" />
                <asp:Parameter DbType="Date" Name="Contract_TerminateDate" />
                <asp:Parameter DbType="Date" Name="Contract_EffectiveDate" />
                <asp:Parameter Name="Contract_Status" Type="String" />
                <asp:Parameter Name="Contract_Homepage" Type="String" />
                <asp:Parameter Name="Contract_Phone" Type="String" />
                <asp:Parameter Name="Contract_PDF" Type="Int32" /> 
		<asp:Parameter Name="Billing_PDF" Type="Int32" />               
                <asp:Parameter Name="SVC_Injectibles" Type="String" />
                <asp:Parameter Name="SVC_Injections" Type="Boolean" />
                <asp:Parameter Name="Contract_Alias4" Type="String" />
                <asp:Parameter Name="SVC_OfficeVisits" Type="Boolean" />
                <asp:Parameter Name="SVC_SX" Type="Boolean" />
                <asp:Parameter Name="SVC_Radiology" Type="Boolean" />
                <asp:Parameter Name="SVC_OT" Type="Boolean" />
                <asp:Parameter Name="SVC_PT" Type="Boolean" />
                <asp:Parameter Name="SVC_PainMgmt" Type="Boolean" />
                <asp:Parameter Name="SVC_Podiatry" Type="Boolean" />
                <asp:Parameter Name="SVC_DME" Type="Boolean" />
                <asp:Parameter Name="Auth_ProviderPortal" Type="String" />
                <asp:Parameter Name="Auth_OfficeVisits" Type="String" />
                <asp:Parameter Name="Auth_OfficeVisits_Note" Type="String" />
                <asp:Parameter Name="Auth_SX" Type="String" />
                <asp:Parameter Name="Auth_SX_Note" Type="String" />
                <asp:Parameter Name="Auth_Radiology" Type="String" />
                <asp:Parameter Name="Auth_Radiology_Note" Type="String" />
                <asp:Parameter Name="Auth_PT" Type="String" />
                <asp:Parameter Name="Auth_PT_Note" Type="String" />
                <asp:Parameter Name="Auth_OT" Type="String" />
                <asp:Parameter Name="Auth_OT_Note" Type="String" />
                <asp:Parameter Name="Auth_PainMgmt" Type="String" />
                <asp:Parameter Name="Auth_PainMgmt_Note" Type="String" />
                <asp:Parameter Name="Auth_DME" Type="String" />
                <asp:Parameter Name="Auth_DME_Note" Type="String" />
                <asp:Parameter Name="Auth_Podiatry" Type="String" />
                <asp:Parameter Name="Auth_Podiatry_Note" Type="String" />
                <asp:Parameter Name="Auth_Injections" Type="String" />
                <asp:Parameter Name="Auth_Injections_Note" Type="String" />                

            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="AOID" Type="String" />
                <asp:Parameter Name="Amend_Count" Type="Int32" />
                <asp:Parameter Name="Amend_Comment" Type="String" />
                <asp:Parameter Name="Contract_Name" Type="String" />
                <asp:Parameter Name="Contract_Type" Type="String" />
                <asp:Parameter Name="Contract_Parent" Type="String" />
                <asp:Parameter Name="Contract_FC" Type="String" />
                <asp:Parameter Name="Contract_Alias3" Type="String" />
                <asp:Parameter Name="Contract_Alias2" Type="String" />
                <asp:Parameter Name="Contract_Alias1" Type="String" />
                <asp:Parameter DbType="Date" Name="Contract_UpdateDate" />
                <asp:Parameter DbType="Date" Name="Contract_TerminateDate" />
                <asp:Parameter DbType="Date" Name="Contract_EffectiveDate" />
                <asp:Parameter Name="Contract_Status" Type="String" />
                <asp:Parameter Name="Contract_Homepage" Type="String" />
                <asp:Parameter Name="Contract_Phone" Type="String" />
                <asp:Parameter Name="Contract_PDF" Type="Int32" />
		<asp:Parameter Name="Billing_PDF" Type="Int32" />                
                <asp:Parameter Name="SVC_Injectibles" Type="String" />
                <asp:Parameter Name="SVC_Injections" Type="Boolean" />
                <asp:Parameter Name="Contract_Alias4" Type="String" />
                <asp:Parameter Name="SVC_OfficeVisits" Type="Boolean" />
                <asp:Parameter Name="SVC_SX" Type="Boolean" />
                <asp:Parameter Name="SVC_Radiology" Type="Boolean" />
                <asp:Parameter Name="SVC_OT" Type="Boolean" />
                <asp:Parameter Name="SVC_PT" Type="Boolean" />
                <asp:Parameter Name="SVC_PainMgmt" Type="Boolean" />
                <asp:Parameter Name="SVC_Podiatry" Type="Boolean" />
                <asp:Parameter Name="SVC_DME" Type="Boolean" />
                <asp:Parameter Name="Auth_ProviderPortal" Type="String" />
                <asp:Parameter Name="Auth_OfficeVisits" Type="String" />
                <asp:Parameter Name="Auth_OfficeVisits_Note" Type="String" />
                <asp:Parameter Name="Auth_SX" Type="String" />
                <asp:Parameter Name="Auth_SX_Note" Type="String" />
                <asp:Parameter Name="Auth_Radiology" Type="String" />
                <asp:Parameter Name="Auth_Radiology_Note" Type="String" />
                <asp:Parameter Name="Auth_PT" Type="String" />
                <asp:Parameter Name="Auth_PT_Note" Type="String" />
                <asp:Parameter Name="Auth_OT" Type="String" />
                <asp:Parameter Name="Auth_OT_Note" Type="String" />
                <asp:Parameter Name="Auth_PainMgmt" Type="String" />
                <asp:Parameter Name="Auth_PainMgmt_Note" Type="String" />
                <asp:Parameter Name="Auth_DME" Type="String" />
                <asp:Parameter Name="Auth_DME_Note" Type="String" />
                <asp:Parameter Name="Auth_Podiatry" Type="String" />
                <asp:Parameter Name="Auth_Podiatry_Note" Type="String" />
                <asp:Parameter Name="Auth_Injections" Type="String" />
                <asp:Parameter Name="Auth_Injections_Note" Type="String" />
                <%--<asp:Parameter Name="ContractID" Type="Int32" />--%>
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource
            ID="FC_DataSource1"
            runat="server"
            ConnectionString="<%$ ConnectionStrings:DemographicsConnectionString %>"
            SelectCommand="SELECT [FinancialClass_Name] FROM FinancialClass_lookup">
        </asp:SqlDataSource>
        <asp:SqlDataSource
            ID="Status_DataSource1"
            runat="server"
            ConnectionString="<%$ ConnectionStrings:DemographicsConnectionString %>"
            SelectCommand="SELECT [ContractStatus_Name] FROM ContractStatus_lookup">
        </asp:SqlDataSource>
</asp:Content>