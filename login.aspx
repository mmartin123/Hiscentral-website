<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CUAHSI HIS Central</title>
    <link href="styles/his.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        input[type="submit"],
        input[type="button"],
        button {
            background-color: #d3dce0;
            border: 1px solid #787878;
            cursor: pointer;
            font-size: 1.2em;
            font-weight: 600;
            padding: 7px;
            margin-right: 8px;
            width: auto;
        }

        .padit {
            padding: 10px;
        }

            .padit h1, .padit h2 {
                font-family: "Segoe UI", Verdana, Helvetica, Sans-Serif;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="pageheader" style="z-index: 100">
                <div class="whiteline"></div>
                <div class="hislogo">
                    <img src="images/hiscentrallogo.jpg" alt="CUAHSI Hydrologic Information System - Sharing Hydrologic Data" align="left" height="125" width="700" />
                </div>
                <div class="whiteline"></div>
            </div>
            <asp:Label ID="LoginErrorDetails" runat="server" Font-Italic="True" ForeColor="Red"
                Style="z-index: 101; left: 360px; position: absolute; top: 274px"></asp:Label>
            &nbsp; &nbsp;&nbsp;<br />
            <%--<asp:HyperLink ID="HyperLink4" runat="server" Font-Bold="True" Font-Underline="False"
                NavigateUrl="register.aspx" Style="z-index: 102; left: 242px; position: absolute; top: 404px">Register</asp:HyperLink>--%>
            &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
        <%--<asp:Login ID="Login1" runat="server" BackColor="#F7F6F3" BorderColor="#E6E2D8" BorderPadding="4"
            BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em"
            ForeColor="#333333" Style="z-index: 99; left: 53px; position: absolute; top: 251px">
            <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
            <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
            <TextBoxStyle Font-Size="0.8em" />
            <LoginButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px"
                Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" />
        </asp:Login>--%>


            <%-- <asp:PasswordRecovery ID="PasswordRecovery1" runat="server" BackColor="#F7F6F3" BorderColor="#E6E2D8"
                BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em"
                Style="z-index: 104; left: 54px; position: absolute; top: 426px" Width="248px">
                <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                <SuccessTextStyle Font-Bold="True" ForeColor="#5D7B9D" />
                <TextBoxStyle Font-Size="0.8em" />
                <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
                <SubmitButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid"
                    BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" />
            </asp:PasswordRecovery>--%>
        </div>
        <div class="padit">
            <h1 style="margin-left: 30px;">Log In</h1>
            <div style="margin-left: 60px;">
                <h2>Log in with your Google account.</h2>
                <asp:ListView runat="server" ID="providerDetails" ItemType="System.String"
                    SelectMethod="GetProviderNames" ViewStateMode="Disabled">
                    <ItemTemplate>
                        <button type="submit" name="provider" value="<%#: Item %>"
                            title="Log in using your <%#: Item %> account.">
                            <%#: Item %>
                        </button>


                    </ItemTemplate>
                    <EmptyDataTemplate>
                        <p>There are no external authentication services configured. </p>
                    </EmptyDataTemplate>
                </asp:ListView>
                <br />

                <asp:Label ID="lblLogin" runat="server">You are not signed in</asp:Label>
                <br /><br />
                <h4><a style="color: black;" href="https://accounts.google.com/SignUp?service=mail">Create a new Google account.</h4>
                <%--<button>
                    <a style="color: black;" href="https://accounts.google.com/SignUp?service=mail"> Create account</a>
                </button>--%>
            </div>
        </div>
    </form>
</body>
</html>
