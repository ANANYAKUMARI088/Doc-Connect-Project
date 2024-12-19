<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Home.aspx.vb" Inherits="WebApplication1.Home" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>IOCL Hospital Management</title>
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
            padding: 1rem;
            display: flex;
            flex-direction: column;
            align-items: center;
            transition: background-color 0.3s ease-in-out;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Header shadow */
            position: relative;
            text-align: center;
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
            transition: background-color 0.3s ease-in-out, transform 0.3s ease-in-out;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3); /* Container shadow */
        }
        .container:hover {
            background-color: rgba(0, 0, 0, 0.9);
            transform: translateY(-10px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3); /* Enhanced hover shadow */
        }
        footer {
            background-color: rgba(255, 102, 0, 0.8); /* Semi-transparent background */
            color: white;
            text-align: center;
            padding: 1rem;
            position: fixed;
            width: 100%;
            bottom: 0;
            box-shadow: 0 -4px 8px rgba(0, 0, 0, 0.2); /* Footer shadow */
        }
        h2 {
            margin-top: 0;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        ul li {
            margin: 0.5rem 0;
        }
        p, ul, li {
            transition: color 0.3s ease-in-out;
        }
        .container:hover p, .container:hover ul, .container:hover li {
            color: rgba(255, 255, 255, 0.9);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <img src="IOCL.png" alt="IOCL Logo">
            <h1>IOCL Hospital Management</h1>
            <p>Indian Oil Corporation Limited, Haldia-721625</p>
            <div class="login-container">
                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="login-text" OnClick="btnLogin_Click" />
            </div>
        </header>
        <nav>
            <a href="#home">Home</a>
            <a href="#services">Services</a>
            <a href="#doctors">Doctors</a>
            <a href="#benefits">Employee Benefits</a>
            <a href="#contact">Contact</a>
        </nav>
        <div class="container" id="home">
            <h2>Home</h2>
            <p>Welcome to the IOCL Hospital Management System. We are dedicated to providing comprehensive healthcare services to IOCL employees and their families.</p>
        </div>
        <div class="container" id="services">
            <h2>Services</h2>
            <ul>
                <li>General Medicine</li>
                <li>Emergency Care</li>
                <li>Outpatient Services</li>
                <li>Inpatient Services</li>
                <li>Surgical Services</li>
                <li>Laboratory Services</li>
                <li>Pharmacy</li>
            </ul>
        </div>
        <div class="container" id="doctors">
            <h2>Doctors</h2>
            <p>Our team of experienced doctors is here to provide top-notch medical care.</p>
            <ul>
                <li>Dr. Pradip Sen - Cardiology</li>
                <li>Dr. Amit Bhunia - Neurology</li>
                <li>Dr. Kushal Aggarwal - Orthopedics</li>
                <li>Dr. Bidhan Roy - Pediatrics</li>
                <li>Dr. Swastika Gupta - Medicine</li>
            </ul>
        </div>
        <div class="container" id="benefits">
            <h2>Employee Benefits</h2>
            <p>IOCL employees and their dependents are entitled to various healthcare benefits:</p>
            <ul>
                <li>Comprehensive Health Insurance</li>
                <li>Annual Health Check-ups</li>
                <li>Specialist Consultations</li>
                <li>Subsidized Medication</li>
                <li>Health and Wellness Programs</li>
            </ul>
        </div>
        <div class="container" id="contact">
            <h2>Contact Us</h2>
            <p>Address: IOCL Hospital, Health Avenue, IOCL, Haldia</p>
            <p>Phone: +91-123-456-7890</p>
            <p>Email: hospital@iocl.org.in</p>
        </div>
        <footer>
            &copy; 2024 IOCL Hospital Management. All rights reserved.
        </footer>
    </form>
</body>
</html>
