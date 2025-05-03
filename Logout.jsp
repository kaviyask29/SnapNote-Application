<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Logout</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e6f7ff; /* Light blue background */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 350px;
        }

        h3 {
            color: #1e90ff; 
            font-size: 24px;
            margin-bottom: 15px;
        }

        .redirect {
            font-size: 14px;
            color: #555; 
        }
    </style>
</head>
<body>
    <div class="container">
        <h3>You have been logged out successfully.</h3>
        <p class="redirect">Redirecting to login page in 2 seconds...</p>
    </div>

    <%
        // Invalidate the session to log the user out
        session.invalidate();

        // Set a refresh header to redirect after 2 seconds
        response.setHeader("Refresh", "2; URL=Login.jsp");
    %>
</body>
</html>
