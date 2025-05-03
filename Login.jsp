<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            width: 100vw; /* Full width */
            background-color: #e7f3fe; /* Light blue background */
            margin: 0; /* Remove default margin */
        }
        .container {
            width: 300px;
            padding: 20px;
            background: white;
            border-radius: 5px;
            position: fixed; /* Changed to fixed */
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%); /* Center the container */
            justify-content: center;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        h2 {
            color: #007bff; /* Blue color for the heading */
            text-align: center; /* Center heading */
        }
        input[type="text"], input[type="password"] {
            width: 93%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #007bff; /* Blue border */
            border-radius: 4px;
            transition: border-color 0.3s; /* Smooth border color transition */
        }
        input[type="text"]:focus, input[type="password"]:focus {
            border-color: #0056b3; /* Darker blue on focus */
            outline: block; /* Remove outline */
        }
        input[type="submit"] {
            background-color: #007bff; /* Blue background */
            color: white;
            border: none;
            padding: 10px;
            cursor: pointer;
            border-radius: 4px;
            width: 100%;
            transition: background-color 0.3s; /* Smooth background color transition */
        }
        input[type="submit"]:hover {
            background-color: #0056b3; /* Darker blue on hover */
        }
        .register-link {
            text-align: center;
            margin-top: 10px;
        }
        .register-link a {
            color: #007bff;
            text-decoration: none;
        }
        .register-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Login</h2>
        <form method="post">
            <input type="text" name="Email" placeholder="Email" required>
            <input type="password" name="Password" placeholder="Password" required>
            <input type="submit" value="Login">
        </form>

        <div class="register-link">
            <p>Do not have an account? <a href="Register.jsp">Register</a></p> <!-- Registration link -->
        </div>
    </div>

    <%
    String email_id = request.getParameter("Email");
    String password = request.getParameter("Password");
    boolean loginSuccessful = false;

    if (email_id != null && password != null) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "Kaviyask2003@");
            String query = "SELECT email, password_hash FROM Register WHERE email=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email_id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                String dbEmail = rs.getString("email");
                String dbPassword = rs.getString("password_hash");

                // Secure password comparison 
                if (email_id.equals(dbEmail) && password.equals(dbPassword)) {
                    // Login successful
                    session.setAttribute("email_id", email_id);
                    loginSuccessful = true;
                }
            }

            pstmt.close();
            con.close();
        } catch (Exception e) {
            out.print(e);
        }
    }

    if (loginSuccessful) {
    %>
        <script>
            Swal.fire({
                icon: 'success',
                title: 'Login Successful!',
                text: 'Welcome!',
                confirmButtonText: 'OK'
            }).then(function() {
                window.location.href = 'Home.jsp'; // Redirect to the next page
            });
        </script>
    <%
    } else if (email_id != null) {
    %>
        <script>
            Swal.fire({
                icon: 'error',
                title: 'Invalid Credentials!',
                text: 'Please check your email and password.',
                confirmButtonText: 'Try Again'
            }).then(function() {
                window.location.href = 'Login.jsp'; // Redirect back to login page
            });
        </script>
    <%
    }
    %>
</body>
</html>
