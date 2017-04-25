<%@ Page Language="C#" MasterPageFile="~/Site1.Master" UnobtrusiveValidationMode="none" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="AOBriefcase.Admin" %>


<asp:Content ID="stuff_1" ContentPlaceHolderID="head" runat="server">
    <title>Admin Portal</title>

</asp:Content>

<asp:Content ID="stuff_2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Contract Editor Access</h1>

    <p>Access beyond this point is intended only for individuals who may directly determine Arrowhead Orthopaedic's distributable contracting information. Please contact the Director of Business Services to request access to this portal.</p>

    <asp:Login ID="Login1" runat="server" OnAuthenticate ="ValidateUser"></asp:Login>    
    
    <div>
        <%--Welcome
        <asp:LoginName ID="LoginName1" runat="server" Font-Bold="true" />
        <br />
        <br />
        <asp:LoginStatus ID="LoginStatus1" runat="server" />--%>
    </div>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
</asp:Content>
