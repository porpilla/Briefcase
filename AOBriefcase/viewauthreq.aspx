<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="viewauthreq.aspx.cs" Inherits="AOBriefcase.viewauthreq" %>


<asp:Content ID="stuff_1" ContentPlaceHolderID="head" runat="server">
    <title>Authorizations Requirements Viewer</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <link rel="stylesheet" href="viewauthreq.css" type="text/css" />
</asp:Content>


<asp:Content ID="submenuview" ContentPlaceHolderID="submenu" runat="server">
    <div id="subNavigationBar">
        <br />
        <h3 id="ARV"><span style="color:#D4B47C">A</span>uthorizations <br /> <span style="color:#D4B47C">R</span>equirements <br /> <span style="color:#D4B47C">V</span>iewer</h3>
        <asp:Menu
            ID="subNavi"
            runat="server"
            EnabledViewState="false"
            Orientation="Vertical"
            OnMenuItemClick="subNavi_MenuItem_Click"
            IncludeStyleBlock="true"
            ItemWrap="true"
            CssClass="submenutestcss"
            >

            <Items>
                <asp:MenuItem Text="Contract Details" />
                <asp:MenuItem Text="Provider Credentialing" />                    
                <asp:MenuItem Text="Authorization Requirements" Selected="true"/>                    
                <asp:MenuItem Text="Business Office Details" />
            </Items>

        </asp:Menu>

    </div>
</asp:Content>
        

<asp:Content ID="stuff_2" ContentPlaceHolderID="MainContent" runat="server">

        <%-- %>The bottom two lines are for debugging the GUID sql querystring process--%>
            <asp:Label ID="viewGUID" runat="server" Visible="false"></asp:Label>
            <asp:Label ID="viewGUID2" runat="server" Visible="false"></asp:Label>        
        
        <asp:DetailsView ID="DetailsView2" 
            runat="server" 
            AutoGenerateRows="False" 
            DataKeyNames="ContractID" 
            DataSourceID="SqlDataSource1" 
            HeaderText="Authorizations Requirements"
            Gridlines="None"
            CssClass="viewer"
            HeaderStyle-CssClass="detailheader"
            FieldHeaderStyle-CssClass="detailfieldheader"
            AlternatingRowStyle-CssClass="alternatingRow"
            >

            <Fields>
                <%--<asp:BoundField DataField="ContractID" HeaderText="ContractID" InsertVisible="False" ReadOnly="True" SortExpression="ContractID"  HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Center" headerStyle-Wrap="false" HeaderStyle-Height="40px"/>--%>
                <asp:BoundField DataField="AOID" HeaderText="AOID" SortExpression="AOID"/>
                <asp:BoundField DataField="Amend_Count" HeaderText="Amendments" SortExpression="Amend_Count"/>
                <asp:BoundField DataField="Amend_Comment" HeaderText="Comment" SortExpression="Amend_Comment"/>
                <asp:BoundField DataField="Contract_Name" HeaderText="Contract Name" SortExpression="Contract_Name"/>
                <asp:BoundField DataField="Contract_Parent" HeaderText="Parent Organization" SortExpression="Contract_Parent"/>
                <asp:BoundField DataField="Contract_Type" HeaderText="Type" SortExpression="Contract_Type"/>
                <asp:BoundField DataField="Contract_FC" HeaderText="Financial Class" SortExpression="Contract_FC"/>
                <asp:BoundField DataField="Contract_Phone" HeaderText="Contact Phone" SortExpression="Contract_Phone"/>
                <%--<asp:BoundField DataField="Contract_Homepage" HeaderText="Contract_Homepage" SortExpression="Contract_Homepage" />--%>
                <asp:BoundField DataField="Contract_Status" HeaderText="Status" SortExpression="Contract_Status"/>
                <%--<asp:BoundField DataField="Contract_EffectiveDate" HeaderText="Contract_EffectiveDate" SortExpression="Contract_EffectiveDate" />
                <asp:BoundField DataField="Contract_TerminateDate" HeaderText="Contract_TerminateDate" SortExpression="Contract_TerminateDate" />
                <asp:BoundField DataField="Contract_UpdateDate" HeaderText="Contract_UpdateDate" SortExpression="Contract_UpdateDate" />
                <asp:BoundField DataField="Contract_Alias1" HeaderText="Contract_Alias1" SortExpression="Contract_Alias1" />
                <asp:BoundField DataField="Contract_Alias2" HeaderText="Contract_Alias2" SortExpression="Contract_Alias2" />
                <asp:BoundField DataField="Contract_Alias3" HeaderText="Contract_Alias3" SortExpression="Contract_Alias3" />
                <asp:BoundField DataField="Contract_Alias4" HeaderText="Contract_Alias4" SortExpression="Contract_Alias4" />
                <asp:CheckBoxField DataField="SVC_OfficeVisits" HeaderText="SVC_OfficeVisits" SortExpression="SVC_OfficeVisits" />
                <asp:CheckBoxField DataField="SVC_SX" HeaderText="SVC_SX" SortExpression="SVC_SX" />
                <asp:CheckBoxField DataField="SVC_Radiology" HeaderText="SVC_Radiology" SortExpression="SVC_Radiology" />
                <asp:CheckBoxField DataField="SVC_PT" HeaderText="SVC_PT" SortExpression="SVC_PT" />
                <asp:CheckBoxField DataField="SVC_OT" HeaderText="SVC_OT" SortExpression="SVC_OT" />
                <asp:CheckBoxField DataField="SVC_PainMgmt" HeaderText="SVC_PainMgmt" SortExpression="SVC_PainMgmt" />
                <asp:CheckBoxField DataField="SVC_DME" HeaderText="SVC_DME" SortExpression="SVC_DME" />
                <asp:CheckBoxField DataField="SVC_Podiatry" HeaderText="SVC_Podiatry" SortExpression="SVC_Podiatry" />
                <asp:CheckBoxField DataField="SVC_Injections" HeaderText="SVC_Injections" SortExpression="SVC_Injections" />
                <asp:BoundField DataField="SVC_Injectibles" HeaderText="SVC_Injectibles" SortExpression="SVC_Injectibles" />--%>
                <asp:HyperLinkField DataNavigateUrlFields="Auth_ProviderPortal" DataNavigateUrlFormatString="http://{0}" HeaderText="Provider Portal" Text="Visit Provider Portal" SortExpression="Auth_ProviderPortal"/>
                <asp:BoundField DataField="Auth_OfficeVisits" HeaderText="Office Visit Authorizations" SortExpression="Auth_OfficeVisits"/>                
                <asp:BoundField DataField="Auth_OfficeVisits_Note" HeaderText="Additional Details" SortExpression="Auth_OfficeVisits_Note"/>
                <asp:BoundField DataField="Auth_SX" HeaderText="Surgery Authorizations" SortExpression="Auth_SX"/>
                <asp:BoundField DataField="Auth_SX_Note" HeaderText="Additional Details" SortExpression="Auth_SX_Note"/>
                <asp:BoundField DataField="Auth_Radiology" HeaderText="Radiology Authorizations" SortExpression="Auth_Radiology"/>
                <asp:BoundField DataField="Auth_Radiology_Note" HeaderText="Additional Details" SortExpression="Auth_Radiology_Note"/>
                <asp:BoundField DataField="Auth_PT" HeaderText="Physical Therapy Authorizations" SortExpression="Auth_PT"/>
                <asp:BoundField DataField="Auth_PT_Note" HeaderText="Additional Details" SortExpression="Auth_PT_Note"/>
                <asp:BoundField DataField="Auth_OT" HeaderText="Occupational Therapy Authorizations" SortExpression="Auth_OT"/>
                <asp:BoundField DataField="Auth_OT_Note" HeaderText="Additional Details" SortExpression="Auth_OT_Note"/>
                <asp:BoundField DataField="Auth_PainMgmt" HeaderText="Pain Management Authorizations" SortExpression="Auth_PainMgmt"/>
                <asp:BoundField DataField="Auth_PainMgmt_Note" HeaderText="Additional Details" SortExpression="Auth_PainMgmt_Note"/>
                <asp:BoundField DataField="Auth_DME" HeaderText="DME Authorizations" SortExpression="Auth_DME"/>
                <asp:BoundField DataField="Auth_DME_Note" HeaderText="Additional Details" SortExpression="Auth_DME_Note"/>
                <asp:BoundField DataField="Auth_Podiatry" HeaderText="Podiatry Authorizations" SortExpression="Auth_Podiatry"/>
                <asp:BoundField DataField="Auth_Podiatry_Note" HeaderText="Additional Details" SortExpression="Auth_Podiatry_Note"/>
                <asp:BoundField DataField="Auth_Injections" HeaderText="Injection Authorizations" SortExpression="Auth_Injections"/>
                <asp:BoundField DataField="Auth_Injections_Note" HeaderText="Additional Details" SortExpression="Auth_Injections_Note"/>
                <asp:HyperLinkField DataNavigateUrlFields="GUID, Contract_PDF" DataNavigateUrlFormatString="downloads.aspx?guid={0}&file={1}" HeaderText="Authorizations Detail File" Text="Download" SortExpression="Contract_PDF"/>
                <%--<asp:BoundField DataField="GUID" HeaderText="GUID" SortExpression="GUID" />--%>
            </Fields>
            <HeaderStyle CssClass="detailheader" ></HeaderStyle>
        </asp:DetailsView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DemographicsConnectionString %>" SelectCommand="SELECT * FROM [Contract_Demographics] WHERE ([GUID] = @guide)">
            <SelectParameters>
                <asp:QueryStringParameter Name="guide" QueryStringField="guid" /><%--Type="Object" /> Commenting this out apparently re-fixed the querystring--%>
            </SelectParameters>
        </asp:SqlDataSource>
    
</asp:Content>