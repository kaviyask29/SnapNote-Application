<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Help - Notes App</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f6fc;
        }

       /* Navigation Bar */
.navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #1e90ff;
    padding: 15px 30px;
    color: white;
}

.navbar-left a,
.navbar-right a {
    color: white;
    text-decoration: none;
    margin: 0 15px;
    font-size: 18px;
    position: relative;
    transition: color 0.3s ease;
}

/* Hover underline effect with animation */
.navbar-left a::after,
.navbar-right a::after {
    content: '';
    position: absolute;
    width: 0%;
    height: 2px;
    background: white;
    bottom: -3px;
    left: 0;
    transition: width 0.3s ease;
}

.navbar-left a:hover::after,
.navbar-right a:hover::after {
    width: 100%;
}

.navbar-left a:hover,
.navbar-right a:hover {
    color: #ffd700; /* gold highlight on hover */
}

.navbar-right span {
    font-size: 18px;
    margin-right: 20px;
}

.logout-btn {
    background-color: #ff4d4d;
    color: white;
    padding: 5px 10px;
    border-radius: 5px;
    text-decoration: none;
    transition: background-color 0.3s ease, transform 0.2s ease;
}

.logout-btn:hover {
    background-color: #d63031;
    transform: scale(1.05);
}

.login-btn {
    background-color: #1e90ff;
    color: white;
    padding: 5px 10px;
    border-radius: 5px;
    text-decoration: none;
    transition: background-color 0.3s ease, transform 0.2s ease;
}

.login-btn:hover {
    background-color: #1565c0;
    transform: scale(1.05);
}
       
       
        .container {
            max-width: 900px;
            margin: 40px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 25px;
        }

        h4 {
            color: #1e90ff;
            margin-top: 20px;
        }

        p {
            color: #555;
            line-height: 1.6;
        }

        ul {
            color: #555;
            padding-left: 20px;
        }

       
    </style>
</head>
<body>

    <!-- Navigation Bar -->
    <div class="navbar">
        <div class="navbar-left">
            <a href="Home.jsp">Home</a>
            <a href="Create.jsp">Create Note</a>
            <a href="Savenotes.jsp">Save Notes</a>
            <a href="About.jsp">About</a>
            <a href="Help.jsp">Help</a>
        </div>
        <div class="navbar-right">
            <a href="Login.jsp">Login</a>
        </div>
    </div>

    <!-- Help Content -->
    <div class="container">
        <h2>Help & Support</h2>

        <h4>1. How to Register?</h4>
        <p>Click on the "Register" link from the login page. Fill in your username, name, email, and password to create an account.</p>

        <h4>2. How to Create a Note?</h4>
        <p>After logging in, go to the "Create Note" page. Enter your note and save it using the submit button.</p>

        <h4>3. How to View or Edit Saved Notes?</h4>
        <p>Visit the "Save Notes" page to view all your saved notes. You can edit or delete them as needed.</p>

        <h4>4. Forgot Password?</h4>
        <p>If you forget your password, please contact the admin or check if your application has a password reset feature implemented.</p>

        <h4>5. Contact Support</h4>
        <p>If you need further assistance, please email us at <strong>support@notesapp.com</strong>.</p>
    </div>

    <!-- Footer -->
    <div class="footer">
        <p>Have questions? Visit the <a href="About.jsp">About Page</a> or contact us.</p>
    </div>

</body>
</html>
