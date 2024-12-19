<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="login_new.aspx.vb" Inherits="WebApplication1.login_new" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            background-image: url('IOCL_BG.jpeg'); /* Replace with the actual path to your background image */
            background-size: cover;
            background-position: center;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            animation: fadeInBackground 2s ease-in-out;
        }
        @keyframes fadeInBackground {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        .login-container {
            background-color: rgba(255, 255, 255, 0.9); /* Translucent background */
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 350px;
            text-align: center;
            animation: fadeInContainer 1s ease-in-out;
        }
        @keyframes fadeInContainer {
            from { transform: scale(0.9); opacity: 0; }
            to { transform: scale(1); opacity: 1; }
        }
        .login-container img {
            width: 129px;
            margin-bottom: 20px;
            animation: fadeInImage 1.5s ease-in-out;
        }
        @keyframes fadeInImage {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        .login-container h2 {
            margin-bottom: 20px;
            color: #333;
        }
        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-group input, .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .form-group button {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            border: none;
            color: white;
            cursor: pointer;
            border-radius: 5px;
            font-size: 16px;
            text-decoration: none;
            margin-top: 10px; /* Added margin to separate links */
        }
        .form-group button:hover {
            background-color: #0056b3;
        }
        .forgot-password,
        .register {
            margin-top: 10px;
        }
        .forgot-password a,
        .register a {
            color: #007bff;
            text-decoration: none;
        }
        .forgot-password a:hover,
        .register a:hover {
            text-decoration: underline;
        }
        .register-button {
            background-color: #28a745;
            font-size: 16px;
            border: none;
            color: white;
            cursor: pointer;
            border-radius: 5px;
            padding: 10px;
            width: 100%;
            margin-top: 10px; /* Added margin to separate buttons */
        }
        .register-button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <img src="IOCL.png" alt="IOCL Logo" />
            <h2>Login</h2>
            <div class="form-group">
                <label for="txtUserName">Username</label>
                <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtPassword">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="ddlUserType">User Type</label>
                <asp:DropDownList ID="ddlUserType" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Please select" Value="" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Employee" Value="Employee"></asp:ListItem>
                    <asp:ListItem Text="Doctor" Value="Doctor"></asp:ListItem>
                    <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="login-button" OnClick="btnLogin_Click" />
            </div>
            <div class="form-group">
                <asp:Button ID="btnRegister" runat="server" Text="Register New User" CssClass="register-button" OnClick="btnRegister_Click" />
            </div>
            <div class="forgot-password">
                <asp:HyperLink ID="lnkForgotPassword" runat="server" NavigateUrl="~/ForgotPassword.aspx">Forgot Password?</asp:HyperLink>
            </div>
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
        </div>
    </form>
</body>
</html>
