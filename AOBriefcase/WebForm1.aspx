<%@ Page Language="C#" MasterPageFile="~/Site1.Master" UnobtrusiveValidationMode="none" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="AOBriefcase.WebForm1" %>


<asp:Content ID="stuff_1" ContentPlaceHolderID="head" runat="server">
    <title>AO contract Search</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="WebForm1.css" type="text/css"/>
</asp:Content>

<asp:Content ID="submenuview" ContentPlaceHolderID="submenu" runat="server">

    <div id="subNavigationBar">
        <br />
        <h3 id="CS"><span style="color:#D4B47C">C</span>ontract <br /> <span style="color:#D4B47C">S</span>earch</h3>
    </div>

</asp:Content>

<asp:Content ID="stuff_2" ContentPlaceHolderID="MainContent" runat="server">

    <h3><b>This tool is to help determine if we are contracted with a patient's particular insurance. Please enter all or a portion of the insurance name. You may also enter a known abbreviated name for the insurance (ie. BMG for Beaver Medical Group)</b></h3>
        
    <div id="results">
        <div id="search">
            <i class="glyphicon glyphicon-search" id="searchIcon"></i>      
            <asp:TextBox ID="txtName" runat="server" placeholder="Search..." />
            <asp:Button CssClass="btn1" runat="server" OnClick="btnSearch_Click" Text="Search" ValidationGroup="Search"/>            
            <asp:Button CssClass="btn1" runat="server" OnClick="btnViewall_Click" Text="View All" ValidationGroup="OmniView"/>            
        </div>

        <div id="errorMsg">
            <button id="btn2" type="button">Terminology Help</button>
            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="Blank entry, please try again" Display="Dynamic" ValidationGroup="Search"/>            
            <asp:RegularExpressionValidator ID="revName" runat="server" ControlToValidate="txtName" ValidationExpression="^\s*[a-zA-Z,\s]+\s*$" ErrorMessage="Invalid search term, please try again" Display="Dynamic" ValidationGroup="Search"/>
        </div>
           
        <!--<button id="btn2" type="button">Terminology Help</button>--> <!-- Open the hint box modal -->
    </div>

    <div id="searchResults">
        <asp:PlaceHolder ID="phContractSearch" runat="server" Visible="false">            
            <asp:Repeater ID="rpContractSearchView" runat="server" >
                <ItemTemplate>
                    <p><b><asp:HyperLink ID="h1Link" runat="server" NavigateUrl='<%#Eval("guid", "viewdetail.aspx?guid={0}") %>' Text='<%#Eval("AOCode")%>'/></b></p>
                </ItemTemplate>
            </asp:Repeater>
        </asp:PlaceHolder>
        <asp:PlaceHolder ID="phNoContractFound" runat="server" Visible="false">
            <p>No contract found. Please double-check your spelling</p>
        </asp:PlaceHolder>
    </div>       

    <!-- Hint box modal -->
    <div id="myModal" class="modal">
        <!-- Modal content -->
        <div class="hintBox">
            <span class="closeBtn">&times;</span>

            <div id="hbHeading">Important Terminology</div>
            <h4>HMO</h4>
            <h5>"Health Management Organization" This type of health plan generally requires patients to obtain care from medical service providers who are both contracted and credentialed with the health plan in order to be eligible for coverage. Nearly all services covered by an HMO require authorization to be obtained.</h5>
            <h4>PPO</h4>
            <h5>"Preferred Provider Organization" A brief description about PPOs will be entered here. </h5>
            <h4>MPN</h4>
            <h5>"Medical Provider Network" A brief description about MPNs will be entered here.</h5>
        </div>
    </div>
        
    <asp:SqlDataSource ID="Demographics" runat="server" ConnectionString="<%$ ConnectionStrings:DemographicsConnectionString %>" SelectCommand="SELECT * FROM [Contract_Demographics]"></asp:SqlDataSource>

    <script>
        // Get the modal
        var modal = document.getElementById('myModal');

        // Get the button that opens the modal
        var btn = document.getElementById("btn2");

        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("closeBtn")[0];

        // When the user clicks the button, open the modal 
        btn.onclick = function () {
            modal.style.display = "block";
        }

        // When the user clicks on <span> (x), close the modal
        span.onclick = function () {
            modal.style.display = "none";
        }

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    </script>

</asp:Content>

