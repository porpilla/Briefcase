<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="downloads.aspx.cs" Inherits="AOBriefcase.downloads" %>

<asp:Content ID="stuff_1" ContentPlaceHolderID="head" runat="server">
    <title>Download File</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <link rel="stylesheet" href="downloads.css" type="text/css" />
</asp:Content>

<asp:Content ID="stuff_2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div id="instructions">
        <h3><b>Your download should begin shortly. Please click the link below if your download does not begin automatically.</b></h3>
    </div>

    <div id="ddl">
        <p>[Direct download link here]</p>
    </div>

    <div id="errorMsg">
        <p>[Error messages will appear here]</p>
    </div>

    <div id="return">
        <p>Dialogue for returning to previously searched contract here.</p>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DemographicsConnectionString %>" SelectCommand="SELECT [Contract_PDF] FROM [Contract_Demographics] WHERE ([GUID] = @guide)">
            <SelectParameters>
                <asp:QueryStringParameter Name="guide" QueryStringField="guid" />
                <asp:QueryStringParameter Name="filename" QueryStringField="Contract_PDF" />
            </SelectParameters>            
        </asp:SqlDataSource>

</asp:Content>