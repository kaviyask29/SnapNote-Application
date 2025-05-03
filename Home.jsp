
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Get the username from the session (if logged in)
    String username = (String) session.getAttribute("username");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Notes App - Home</title>
    <style>
        /* Global Styles */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f7fc;
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
        
        /* Main Content Area */
        .container {
            max-width: 700px;
            margin: 70px auto;
            padding: 30px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .container h3 {
            color: #333;
            font-size: 24px;
            margin-bottom: 20px;
        }

        /* Footer */
        .footer {
            background-color: #f1f1f1;
            padding: 10px;
            text-align: center;
            position: fixed;
            bottom: 0;
            width: 100%;
        }

        .footer p {
            margin: 0;
        }

        .footer a {
            color: #1e90ff;
            text-decoration: none;
        }

        .footer a:hover {
            text-decoration: underline;
        }
        .steps {
    list-style: none;
    padding: 0;
    text-align: left;
    max-width: 600px;
    margin: 0 auto;
}

.steps li {
    background-color: #e3f2fd;
    margin-bottom: 10px;
    padding: 15px;
    border-left: 5px solid #1e90ff;
    border-radius: 5px;
    font-size: 18px;
    transition: background-color 0.3s ease;
}

.steps li:hover {
    background-color: #bbdefb;
    cursor: pointer;
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
            <% if (username != null) { %>
                <!-- Display username and logout option -->
                <span>Welcome, <%= username %>!</span>
                <a href="Logout.jsp" class="logout-btn">Logout</a>  <!-- Logout link -->
            <% } else { %>
                <!-- If not logged in, show login link -->
                <a href="Login.jsp" class="login-btn">Login</a>
            <% } %>
        </div>
    </div>

<!-- Main Content -->
<div class="container">
    <h3>How to Use the Notes App?</h3>
    <ul class="steps">
        <li>Click on <strong>"Create Note"</strong> in the navigation bar to start a new note.</li>
        <li>Fill in your title and content, then click <strong>Save</strong>.</li>
        <li>Access your notes anytime from the <strong>"Save Notes"</strong> section.</li>
        <li>Edit or delete notes as needed using the buttons provided.</li>
    </ul>
</div>

   

    <!-- Footer -->
    <div class="footer">
        <p>Need help? Visit our <a href="Help.jsp">Help page</a>.</p>
    </div>

</body>
</html>
