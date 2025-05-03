<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            background-color: #e6f7ff; /* Light blue background */
            margin: 0;
        }

        .loading-container {
            text-align: center;
        }

        .loading-message {
            font-size: 24px;
            color: #1e90ff; /* Dodger blue */
            margin-bottom: 20px;
        }

        /* Spinner Styles */
        .spinner {
            border: 8px solid #f3f3f3; /* Light grey */
            border-top: 8px solid #1e90ff; /* Dodger blue */
            border-radius: 50%;
            width: 50px;
            height: 50px;
            animation: spin 1s linear infinite;
            margin: 0 auto; /* Center the spinner */
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>
</head>
<body>
    <div class="loading-container">
        <div class="loading-message">Welcome! Redirecting to our Home...</div>
        <div class="spinner"></div>
    </div>

    <script>
        // Redirect after 3 seconds
        setTimeout(function() {
            window.location.href = "Home.jsp";
        }, 3000);
    </script>
</body>
</html>
