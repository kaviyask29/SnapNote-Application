<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.security.MessageDigest" %>
<%@ page import="java.security.NoSuchAlgorithmException" %>
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
            width: 100vw;
            background-color: #e7f3fe;
            margin: 0;
        }
        .container {
            width: 300px;
            padding: 20px;
            background: white;
            border-radius: 5px;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            justify-content: center;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        h2 {
            color: #007bff;
            text-align: center;
        }
        input[type="text"], input[type="password"] {
            width: 93%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #007bff;
            border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px;
            cursor: pointer;
            border-radius: 4px;
            width: 100%;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
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
        <p>Don't have an account? <a href="Register.jsp">Register</a></p>
    </div>
</div>

<%
    String email_id = request.getParameter("Email");
    String password = request.getParameter("Password");
    boolean loginSuccessful = false;

    if (email_id != null && password != null) {
        try {
            // Hash the entered password using SHA-256
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(password.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : md.digest()) {
                sb.append(String.format("%02x", b));
            }
            String hashedPassword = sb.toString();

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "Kaviyask2003@");

            String query = "SELECT password_hash FROM Register WHERE email=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email_id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                String dbPassword = rs.getString("password_hash");

                if (hashedPassword.equals(dbPassword)) {
                    session.setAttribute("email_id", email_id);
                    loginSuccessful = true;
                }
            }

            rs.close();
            pstmt.close();
            con.close();
        } catch (Exception e) {
            out.print("<script>Swal.fire({icon:'error', title:'Error', text:'" + e.getMessage() + "'});</script>");
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
        window.location.href = 'Home.jsp';
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
    });
</script>
<%
    }
%>

</body>
</html>
