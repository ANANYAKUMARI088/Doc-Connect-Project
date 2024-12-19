<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Register.aspx.vb" Inherits="WebApplication1.Register" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Indian Oil Corporation - Registration Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            background-image: url('IOCL_BG.jpeg'); /* Replace with your background image */
            background-size: cover;
            background-position: center;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            overflow: hidden; /* Prevent scrolling */
        }
        .container {
            background-color: rgba(255, 255, 255, 0.9); /* Translucent background */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            border-top: 10px solid #f36f21; /* IOC orange color */
            text-align: center;
            position: absolute;
            top: 50%; /* Center vertically */
            transform: translate(-50%, -50%);
            left: 50%; /* Center horizontally */
        }
        .container img {
            width: 80px;
            margin-bottom: 10px; /* Reduced margin for the logo */
        }
        .container h2 {
            margin-bottom: 15px;
            font-size: 20px;
            color: #0056b3; /* IOC blue color */
        }
        .container label {
            display: block;
            margin: 8px 0 4px;
            font-size: 12px;
            color: #555;
            text-align: left;
        }
        .container input[type="text"], 
        .container input[type="password"], 
        .container select {
            width: calc(100% - 22px); /* Adjusted width to accommodate the scrollbar */
            padding: 8px;
            margin-bottom: 6px; /* Reduced margin between fields */
            box-sizing: border-box;
            border: 1px solid #ddd;
            border-radius: 3px;
            font-size: 12px;
            color: #333;
        }
        .container button[type="submit"], .container .asp-button {
            padding: 10px;
            background-color: #0056b3; /* IOC blue color */
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            font-size: 14px;
            width: 100%;
            margin-top: 10px; /* Added margin to separate from last input */
        }
        .container button[type="submit"]:hover, .container .asp-button:hover {
            background-color: #004494; /* Darker blue for hover */
        }
        .show-password {
            text-align: left;
            margin-top: -10px; /* Adjusted margin to move closer to the password fields */
        }
        .show-password label {
            font-size: 12px;
            color: #555;
            cursor: pointer;
        }
    </style>
</head>
<body>

<div class="container">
    <img src="IOCL.png" alt="Indian Oil Corporation">
    <h2>Registration Form</h2>
    <form id="form1" runat="server">
        <label for="employee-number">Employee Number:</label>
        <asp:TextBox ID="txtEmployeeNumber" runat="server" required="true"></asp:TextBox>
        
        <label for="name">Username:</label>
        <asp:TextBox ID="txtName" runat="server" required="true"></asp:TextBox>

        <div>
            <label for="ddlRole">Role:</label>
            <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-control">
                <asp:ListItem Text="Please select" Value="" Selected="True"></asp:ListItem>
                <asp:ListItem Text="CISF" Value="CISF"></asp:ListItem>
                <asp:ListItem Text="KV" Value="KV"></asp:ListItem>
            </asp:DropDownList>
        </div>

        <div>
            <label for="ddlUserType">User Type:</label>
            <asp:DropDownList ID="ddlUserType" runat="server" CssClass="form-control">
                <asp:ListItem Text="Please select" Value="" Selected="True"></asp:ListItem>
                <asp:ListItem Text="Employee" Value="Employee"></asp:ListItem>
                <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                <asp:ListItem Text="Guest" Value="Guest"></asp:ListItem>
            </asp:DropDownList>
        </div>

        <label for="create-password">Create New Password:</label>
        <asp:TextBox ID="txtCreatePassword" runat="server" TextMode="Password" required="true"></asp:TextBox>

        <label for="confirm-password">Confirm Password:</label>
        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" required="true"></asp:TextBox>

        <div class="show-password">
            <input type="checkbox" id="show-password-checkbox" onclick="togglePasswordVisibility()">
            <label for="show-password-checkbox">Show Password</label>
        </div>

        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

        <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="asp-button" OnClick="btnRegister_Click" />
        <asp:Button ID="btnBackToLogin" runat="server" Text="Back to Login" CssClass="asp-button" OnClick="btnBackToLogin_Click" />
    </form>
</div>

<script>
    function togglePasswordVisibility() {
        var password = document.getElementById("txtCreatePassword");
        var confirm = document.getElementById("txtConfirmPassword");
        if (password.type === "password") {
            password.type = "text";
            confirm.type = "text";
        } else {
            password.type = "password";
            confirm.type = "password";
        }
    }
</script>

</body>
</html>
