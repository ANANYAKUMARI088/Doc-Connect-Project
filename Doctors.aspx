        </div>
<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Doctors.aspx.vb" Inherits="WebApplication1.Doctors" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Appointments - IOCL Hospital Management</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');
        
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            position: relative;
            color: white;
            background-image: url('Hospital.jpg'); /* Adjust the path as needed */
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            box-shadow: inset 0 0 10px rgba(0, 0, 0, 0.7); /* Shadow for background */
        }
        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5); /* Dark overlay */
            z-index: -1;
        }
        header {
            background-color: rgba(255, 102, 0, 0.8); /* Semi-transparent background */
            color: white;
            display: flex;
            flex-direction: column;
            align-items: center;
            transition: background-color 0.3s ease-in-out;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Header shadow */
            position: relative;
            text-align: center;
            top: 0px;
            left: 0px;
        }
        header:hover {
            background-color: rgba(255, 102, 0, 0.9);
        }
        header img {
            width: 80px; /* Make the logo larger */
            height: auto;
            margin-bottom: 1rem; /* Increased margin */
            transition: transform 0.3s ease-in-out;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Logo shadow */
        }
        header img:hover {
            transform: scale(1.1);
        }
        header h1 {
            margin: 0; /* Remove margin */
            font-size: 2rem; /* Increase font size */
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7); /* Add text shadow */
        }
        header p {
            margin: 0.5rem 0; /* Reduced margin */
        }
        .login-container {
            display: flex;
            align-items: center;
            margin-top: 1rem;
        }
        .login-text {
            color: white;
            font-weight: bold;
            font-size: 1.2rem;
            text-decoration: none;
            transition: color 0.3s ease-in-out;
            padding: 0.5rem 1rem;
            border: 2px solid white;
            border-radius: 5px;
            background: rgba(255, 102, 0, 0.8);
        }
        .login-text:hover {
            color: #ffcc99;
        }
        nav {
            display: flex;
            justify-content: center;
            background-color: rgba(204, 82, 0, 0.8); /* Semi-transparent background */
            padding: 1rem;
            transition: background-color 0.3s ease-in-out;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Nav shadow */
        }
        nav a {
            color: white;
            margin: 0 1rem;
            text-decoration: none;
            font-weight: bold;
            position: relative;
            transition: color 0.3s ease-in-out;
        }
        nav a::after {
            content: '';
            position: absolute;
            width: 100%;
            transform: scaleX(0);
            height: 2px;
            bottom: 0;
            left: 0;
            background-color: white;
            transform-origin: bottom right;
            transition: transform 0.25s ease-out;
        }
        nav a:hover::after {
            transform: scaleX(1);
            transform-origin: bottom left;
        }
        nav a:hover {
            color: #ffcc99;
        }
        .container {
            padding: 2rem;
            background-color: rgba(0, 0, 0, 0.7); /* Merge with background */
            margin: 1rem auto;
            border-radius: 8px;
            max-width: 800px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3); /* Container shadow */
        }
        .doctor-id-container {
            margin: 1rem auto;
            padding: 2rem;
            background-color: rgba(0, 0, 0, 0.7); /* Merge with background */
            border-radius: 8px;
            max-width: 800px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3); /* Container shadow */
        }
        .doctor-id-container label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }
        .doctor-id-container input[type="text"] {
            padding: 5px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 3px;
            width: auto;
            display: inline-block;
            background-color: rgba(0, 0, 0, 0.7);
            color: white;
        }
        .doctor-id-container button {
            padding: 8px 16px;
            background-color: rgba(255, 102, 0, 0.8);
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s ease-in-out;
        }
        .doctor-id-container button:hover {
            background-color: rgba(255, 102, 0, 1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background-color: white;
            color: black;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3); /* Table shadow */
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f36f21;
            color: white;
        }
        .update-form {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }
        .update-form label {
            margin-bottom: 8px;
            font-weight: 700;
        }
        .update-form input[type="text"], 
        .update-form input[type="number"] {
            padding: 5px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 3px;
            width: auto;
            background-color: rgba(0, 0, 0, 0.7);
            color: white;
        }
        .update-form button {
            padding: 8px 16px;
            background-color: rgba(255, 102, 0, 0.8);
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s ease-in-out;
        }
        .update-form button:hover {
            background-color: rgba(255, 102, 0, 1);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <h1>Doctor's Dashboard</h1>
            <p>IOCL Hospital Management</p>
        </header>
        <nav>
            <a href="Home.aspx">Home</a>
            <a href="#appointments">Appointments</a>
            <a href="#update">Update Appointment</a>
        </nav>
        <div class="doctor-id-container">
            <h2>Enter Your Doctor ID</h2>
            <label for="txtDoctorID">Doctor ID:</label>
            <asp:TextBox ID="txtDoctorID" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="btnViewProfile" runat="server" Text="View Profile" OnClick="btnViewProfile_Click" />
        </div>
        <div class="container" id="appointments">
            <h2>Doctor Profile</h2>
            <asp:Label ID="lblDoctorProfile" runat="server" Text=""></asp:Label>
            <h2>Appointments</h2>
            <asp:Label ID="Label1" runat="server" />
            <asp:GridView ID="gvAppointments" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvAppointments_RowDataBound">
                <Columns>
                    <asp:BoundField HeaderText="Appointment No." />
                    <asp:BoundField DataField="AppointmentID" HeaderText="Appointment ID" />
                    <asp:BoundField DataField="DependentName" HeaderText="Patient Name" />
                    <asp:BoundField DataField="AppointmentDate" HeaderText="Appointment Date" DataFormatString="{0:yyyy-MM-dd}" />
                </Columns>
            </asp:GridView>
        </div>
        <div class="container" id="update">
            <h2>Update Appointment Number</h2>
            <div class="update-form">
                <label for="txtAppointmentID">Appointment ID:</label>
                <asp:TextBox ID="txtAppointmentID" runat="server"></asp:TextBox>
                
                <label for="txtNewAppointmentNumber">New Appointment Number:</label>
                <asp:TextBox ID="txtNewAppointmentNumber" runat="server"></asp:TextBox>
                
                <asp:Button ID="btnUpdateAppointment" runat="server" Text="Update Appointment" OnClick="btnUpdateAppointment_Click" /> 
            </div>
        </div>
    </form>
</body>
</html>
