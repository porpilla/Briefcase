<%@ Page Language="C#" MasterPageFile="~/Site1.Master" UnobtrusiveValidationMode="none" AutoEventWireup="true" CodeBehind="Contacts.aspx.cs" Inherits="AOBriefcase.Contacts" %>


<asp:Content ID="stuff_1" ContentPlaceHolderID="head" runat="server">
    <title>Contact Information</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <link rel="stylesheet" href="Contacts.css" type="text/css"/>
</asp:Content>

<asp:Content ID="submenuview" ContentPlaceHolderID="submenu" runat="server">

    <div id="subNavigationBar">
        <br />
        <h3 id="CI"><span style="color:#79b9ef">C</span>ontact <br /> <span style="color:#79b9ef">I</span>nformation</h3>
    </div>

</asp:Content>

<asp:Content ID="stuff_2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div id="contentHeader">
        <h1>Unable to find the information you need?</h1>
    </div>

    <div id="Contents">
        <p>For questions regarding contract information, please contact the <a href="mailto:Contracting@Arrowheadortho.com?subject=Contract%20Information%20Question">Director of Business Services</a>.</p>
        <p>For questions regarding credentialing information, please contact the <a href="mailto:Credentialing@Arrowheadortho.com?subject=Provider%20Credentialing%Question">Credentialing Department</a>.</p>
        <p>For questions regarding billing/collection information regarding contracts, please contact the <a href="mailto:Michaela.Gorlack@Arrowheadortho.com?subject=Business%20Office%20Question">Business Office Supervisor</a>.</p>
        <p>To report issues/bugs with this web application, please contact the <a href="mailto:Paul.Orpilla@Arrowheadortho.com?subject=Database%20Question">Web Application Administrator</a>.</p>
    </div>

</asp:Content>