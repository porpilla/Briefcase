<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="downloads.aspx.cs" Inherits="AOBriefcase.downloads" %>

<asp:Content ID="stuff_1" ContentPlaceHolderID="head" runat="server">
    <title>Download File</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <link rel="stylesheet" href="downloads.css" type="text/css" />
</asp:Content>

<asp:Content ID="stuff_2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div id="instructions">
        <h3><b>If you have reached this page, it is likely that an error has occured regarding your download. Please see below regarding some common issues.</b></h3>
    </div>

    <div id="infolist">
        <p>1. An authorizations detail file has not yet been uploaded into the database.</p>
        <p>2. The database entry has been corrupted or orphaned.</p>
    </div>

    <div id="errorMsg">
        <h4>Debug Information:</h4> <br />
        <asp:Label ID="guidPull" runat="server" /> <br />
        <asp:Label ID="filenamePull" runat="server" /> <br />
        <asp:Label ID="errorMessage" runat="server" /> <br />
    </div>

    <div id="report">
        <p>Please send an email to: Paul.Orpilla@Arrowheadortho.com with the Debug Information above to submit a bug report. We apologize for the inconvenience.</p>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DemographicsConnectionString %>" SelectCommand="SELECT [Contract_PDF] FROM [Contract_Demographics] WHERE ([GUID] = @guide)">
            <SelectParameters>
                <asp:QueryStringParameter Name="guide" QueryStringField="guid" />
                <asp:QueryStringParameter Name="filename" QueryStringField="Contract_PDF" />
            </SelectParameters>            
        </asp:SqlDataSource>

</asp:Content>