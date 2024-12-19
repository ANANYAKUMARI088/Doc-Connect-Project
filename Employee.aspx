<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Employee.aspx.vb" Inherits="WebApplication1.Employee" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Appointment</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: url('Hospital.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            width: 100%;
            max-width: 500px;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.8); /* Slightly transparent background */
            border: 1px solid #cccccc;
            border-radius: 10px;
        }
        form {
            margin-bottom: 0;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }
        input[type="date"], input[type="text"], select {
            width: calc(100% - 22px); /* Adjusted width to accommodate border */
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            font-size: 16px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }
        button:hover {
            background-color: #45a049;
        }
        .message {
            margin-top: 20px;
            font-weight: bold;
            text-align: center;
        }
    </style>
    <script>
        function validateForm() {
            const today = new Date().toISOString().split('T')[0];
            const tomorrow = new Date();
            tomorrow.setDate(tomorrow.getDate() + 1);
            const tomorrowDate = tomorrow.toISOString().split('T')[0];

            const selectedDate = document.getElementById('date').value;
            if (selectedDate !== today && selectedDate !== tomorrowDate) {
                alert('Please select a valid date (today or tomorrow).');
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <div class="container">
        <h1 style="text-align: center;">Book an Appointment</h1>
        <form id="appointmentForm" runat="server" onsubmit="return validateForm()">
            <label for="date">Date:</label>
            <input type="date" id="date" name="date" runat="server" required>
            
            <label for="dependent">Dependent Name:</label>
            <input type="text" id="dependent" name="dependent" placeholder="Enter dependent's name" runat="server" required>

            <label for="specialty">Specialty:</label>
            <asp:DropDownList ID="ddlSpecialty" runat="server" CssClass="form-control" required>
                <asp:ListItem Text="Select Specialty" Value="" />
                <asp:ListItem Text="Cardiology" Value="cardiology" />
                <asp:ListItem Text="Dermatology" Value="dermatology" />
                <asp:ListItem Text="Neurology" Value="neurology" />
                <asp:ListItem Text="Pediatrics" Value="pediatrics" />
                <asp:ListItem Text="Orthopedics" Value="orthopedics" />
            </asp:DropDownList>

            <label for="doctor">Doctor:</label>
            <asp:DropDownList ID="ddlDoctor" runat="server" CssClass="form-control" required>
                <asp:ListItem Text="Select Doctor" Value="" />
                <asp:ListItem Text="Dr. Amit Bhunia" Value="dr_smith" />
                <asp:ListItem Text="Dr. Pradip Sen" Value="dr_jones" />
                <asp:ListItem Text="Dr. Swastika Gupta" Value="dr_brown" />
                <asp:ListItem Text="Dr. Kushal Aggarwal" Value="dr_clark" />
                <asp:ListItem Text="Dr. Bidhan Roy" Value="dr_davis" />
            </asp:DropDownList>

            <label for="slot">Slot No:</label>
            <asp:DropDownList ID="ddlSlot" runat="server" CssClass="form-control" required>
                <asp:ListItem Text="Select Slot" Value="" />
                <asp:ListItem Text="Slot 1 (9:00 AM - 10:00 AM)" Value="1" />
                <asp:ListItem Text="Slot 2 (10:00 AM - 11:00 AM)" Value="2" />
                <asp:ListItem Text="Slot 3 (11:00 AM - 12:00 PM)" Value="3" />
                <asp:ListItem Text="Slot 4 (1:00 PM - 2:00 PM)" Value="4" />
                <asp:ListItem Text="Slot 5 (2:00 PM - 3:00 PM)" Value="5" />
                <asp:ListItem Text="Slot 6 (3:00 PM - 4:00 PM)" Value="6" />
            </asp:DropDownList>

            <asp:Button ID="btnBookAppointment" runat="server" Text="Book Appointment" OnClick="btnBookAppointment_Click" />
        </form>
        
        <div class="container">
            <asp:Label ID="lblMessage" runat="server" CssClass="message" />
        </div>
    </div>
</body>
</html>
