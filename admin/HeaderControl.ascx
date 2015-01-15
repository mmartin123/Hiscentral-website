<%@ Control Language="C#" AutoEventWireup="true" CodeFile="HeaderControl.ascx.cs" Inherits="AdminWebUserControl" %>
<link href="../styles/his.css" rel="stylesheet" type="text/css" />

	<div class="pageheader">
    <div class="whiteline"></div>
    <div class="hislogo"><img src="../images/hiscentrallogo.jpg" alt="CUAHSI Hydrologic Information System - Sharing Hydrologic Data" align="left" height="125" width="700"  / >

    </div>
   
    <div class="whiteline"></div>
 </div>
    
<asp:LoginView ID="LoginView1" runat="server" OnViewChanged="LoginView1_ViewChanged"  >
    <LoggedInTemplate>
        &nbsp;
        <asp:LoginName ID="LoginName1" runat="server" Font-Bold="True" FormatString="Welcome, {0}"
            Style="font-size: 13px !important; z-index: 100; left: 658px; position: absolute; top: 11px"  ForeColor="White" />
        <asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="False" Font-Size="Smaller"
             Style="font-size: 13px !important; z-index: 101; left: 658px; position: absolute;
            top: 31px" Width="52px" OnClick="LinkButton1_Click" ForeColor="White">Log out</asp:LinkButton>
      &nbsp;
        <asp:HyperLink ID="HyperLink1" runat="server" BorderStyle="None" Font-Bold="True"
            Font-Underline="False" NavigateUrl="../addnetwork.aspx" Style="font-size: 13px !important; z-index: 102; left: 533px;
            position: absolute; top: 110px" Width="125px" Font-Size="Smaller" ForeColor="White">New Data Service</asp:HyperLink>
          <asp:HyperLink ID="HyperLink7" runat="server" BorderStyle="None" Font-Bold="True"
            Font-Size="Smaller" Font-Underline="False" ForeColor="White" NavigateUrl="../default.aspx"
            Style="font-size: 13px !important; z-index: 107; left: 352px; position: absolute; top: 110px" Width="45px">Home</asp:HyperLink>
        <asp:HyperLink ID="HyperLink3" runat="server" BorderStyle="None" Font-Bold="True"
            Font-Underline="False" NavigateUrl="../mynetworks.aspx" Style="font-size: 13px !important; z-index: 104; left: 404px;
            position: absolute; top: 110px" Width="124px" Font-Size="Smaller" ForeColor="White">My Data Services</asp:HyperLink>
        <asp:HyperLink ID="HyperLink5" runat="server" BorderStyle="None" Font-Bold="True"
            Font-Underline="False" NavigateUrl="pub_services.aspx" Style="font-size: 13px !important; z-index: 105; left: 663px;
            position: absolute; top: 110px" Width="115px" Font-Size="Smaller" ForeColor="White">All Data Services</asp:HyperLink>    
        <asp:HyperLink ID="HyperLink8" runat="server" BorderStyle="None" Font-Bold="True"
            Font-Underline="False" NavigateUrl="https://groups.google.com/forum/#!forum/cuahsi-wds-user-group-forum" Style="font-size: 13px !important; z-index: 105; left: 775px; position: absolute; top: 110px"
            Width="115px" Font-Size="Smaller" ForeColor="White">Forum</asp:HyperLink>

    </LoggedInTemplate>
    <AnonymousTemplate>
<asp:HyperLink ID="HyperLink7" runat="server" BorderStyle="None" Font-Bold="True"
            Font-Size="Smaller" Font-Underline="False" ForeColor="White" NavigateUrl="default.aspx"
            Style="font-size: 13px !important; z-index: 107; left: 352px; position: absolute; top: 110px" Width="45px">Home</asp:HyperLink>    &nbsp;
        <asp:HyperLink ID="HyperLink2" runat="server" Font-Bold="True" Font-Underline="False"
            NavigateUrl="login.aspx" Style="z-index: 100; left: 536px; position: absolute;
            top: 23px" CssClass="links" ForeColor="White" Width="45px">Login</asp:HyperLink>
        <asp:HyperLink ID="HyperLink5" runat="server" BorderStyle="None" Font-Bold="True"
            Font-Underline="False" NavigateUrl="pub_services.aspx" Style="font-size: 13px !important; z-index: 105; left: 402px;
            position: absolute; top: 110px" Width="136px" Font-Size="Smaller" ForeColor="White">All Data Services</asp:HyperLink>                
        <asp:HyperLink ID="HyperLink4" runat="server" Font-Bold="True" Font-Underline="False"
            NavigateUrl="register.aspx" Style="font-size: 13px !important; z-index: 102; left: 588px; position: absolute;
            top: 24px" CssClass="links" ForeColor="White" Width="63px">Register</asp:HyperLink>
        <asp:HyperLink ID="HyperLink8" runat="server" BorderStyle="None" Font-Bold="True"
            Font-Underline="False" Target="_blank" NavigateUrl="https://groups.google.com/forum/#!forum/cuahsi-wds-user-group-forum" Style="font-size: 13px !important; z-index: 105; left: 775px; position: absolute; top: 110px"
            Width="115px" Font-Size="Smaller" ForeColor="White">Forum</asp:HyperLink>

    </AnonymousTemplate>
    <RoleGroups>
        <asp:RoleGroup Roles="Administrator">

        <ContentTemplate>
        <asp:LoginName ID="LoginName1" runat="server" Font-Bold="True" FormatString="Welcome, {0}"
            Style="z-index: 100; left: 626px; position: absolute; top: 9px"  ForeColor="White" />
          &nbsp;
        <asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="False" Font-Size="Smaller"
             Style="z-index: 101; left: 626px; position: absolute;
            top: 29px" Width="87px" OnClick="LinkButton1_Click" ForeColor="White">Log out</asp:LinkButton>
        <asp:HyperLink ID="HyperLink1" runat="server" BorderStyle="None" Font-Bold="True"
            Font-Underline="False" NavigateUrl="../addnetwork.aspx" Style="font-size: 13px !important; z-index: 102; left: 522px;
            position: absolute; top: 110px" Width="125px" Font-Size="Smaller" ForeColor="White">New Data Service</asp:HyperLink>
          <asp:HyperLink ID="HyperLink7" runat="server" BorderStyle="None" Font-Bold="True"
            Font-Size="Smaller" Font-Underline="False" ForeColor="White" NavigateUrl="../default.aspx"
            Style="font-size: 13px !important; z-index: 107; left: 343px; position: absolute; top: 110px" Width="45px">Home</asp:HyperLink>
        <asp:HyperLink ID="HyperLink3" runat="server" BorderStyle="None" Font-Bold="True"
            Font-Underline="False" NavigateUrl="../mynetworks.aspx?sa=sa" Style="z-index: 104; left: 393px;
            position: absolute; top: 110px" Width="160px" Font-Size="Smaller" ForeColor="White">(Admin) Data Svcs</asp:HyperLink>
        <asp:HyperLink ID="HyperLink5" runat="server" BorderStyle="None" Font-Bold="True"
            Font-Underline="False" NavigateUrl="../pub_services.aspx" Style="font-size: 13px !important; z-index: 105; left: 652px;
            position: absolute; top: 110px" Width="136px" Font-Size="Smaller" ForeColor="White">All Data Services</asp:HyperLink>   
             <asp:HyperLink ID="HyperLink4" runat="server" BorderStyle="None" Font-Bold="True"
            Font-Underline="False" NavigateUrl="http://localhost:55925/QueryHydroServer/" Style="font-size: 13px !important; z-index: 109; left: 775px; position: absolute; top: 110px"
            Width="115px" Font-Size="Smaller" ForeColor="White">Health Monitor</asp:HyperLink> 
              <asp:HyperLink ID="HyperLink9" runat="server" BorderStyle="None" Font-Bold="True" Target="_blank"
            Font-Underline="False" NavigateUrl="~/admin/HealthMonitor.aspx" Style="font-size: 13px !important; z-index: 109; left: 895px; position: absolute; top: 110px"
            Width="150px" Font-Size="Smaller" ForeColor="White">Daily Health Monitor</asp:HyperLink>                   
            <asp:HyperLink ID="HyperLink8" runat="server" BorderStyle="None" Font-Bold="True"
            Font-Underline="False" Target="_blank" NavigateUrl="https://groups.google.com/forum/#!forum/cuahsi-wds-user-group-forum" Style="font-size: 13px !important; z-index: 105; left: 1045px; position: absolute; top: 110px"
            Width="115px" Font-Size="Smaller" ForeColor="White">Forum</asp:HyperLink>

        <asp:HyperLink ID="HyperLink6" runat="server" BorderStyle="None" Font-Bold="True"
            Font-Underline="False" NavigateUrl="admin.aspx" Style="font-size: 13px !important; z-index: 106; left: 674px;
            position: absolute; top: 65px" Width="102px" Font-Size="Smaller" ForeColor="White">Administration</asp:HyperLink>

        </ContentTemplate>
        </asp:RoleGroup>
    </RoleGroups>

</asp:LoginView>




