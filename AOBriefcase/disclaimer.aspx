<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="disclaimer.aspx.cs" Inherits="AOBriefcase.disclaimer" %>


<asp:Content ID="stuff_1" ContentPlaceHolderID="head" runat="server">
    <title>Internal Resources Disclaimer</title>
    <link rel="stylesheet" href="disclaimer.css" type="text/css"/>
</asp:Content>

<asp:Content ID="stuff_2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Disclaimer Notice for Employee Use of Internal Resources</h1>
    <p>
        <b>Please read the text below and then select 'Accept' at the bottom of the page to indicate your acceptance of the disclaimer. Users are required to accept this disclaimer prior to using the Contract Reference Database Tool.</b>
    </p>
    <p>This website contains contracting information for the internal use of Arrowhead Orthopaedics employees only. It is intended to provide a brief summary of each contract agreement for the purposes of scheduling a patient appointment, obtaining authorization for services, or to confirm credentialed providers. Please refer to the Employee Manual on Internet and Electronic Communication for our corporate policy on these matters. Any misuse of this information may result in disciplinary action, including termination.</p>
    <p>The information provided may be modified as necessary and every attempt will be made to inform employees of these changes as they occur. If additional information or clarification is needed, please send your request to <a href="mailto:Contracting@Arrowheadortho.com">Contracting@Arrowheadortho.com</a>.</p>
    <p>
        <b><u>This web application is designed to be used with Google Chrome Version 57.0.2987.133 and later.</u></b>
    </p>
    <div>                   
        <asp:Button ID="btnAccept" runat="server" CssClass="FancyButtonOrange" Text="Accept" OnClick="btnAccept_Click"/>
        <asp:Button ID="btnNoAccept" runat="server" CssClass="FancyButtonBlue" Text="Don't Accept" OnClick="btnNoAccept_Click"/>
    </div>
</asp:Content>
