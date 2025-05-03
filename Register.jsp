
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.security.MessageDigest"%>
<%@ page import="java.security.NoSuchAlgorithmException"%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #e0f7fa, #b2ebf2);
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container {
            width: 100%;
            max-width: 450px;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 16px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
            text-align: center;
            position: relative;
        }

        h3 {
            color: #1e90ff;
            margin-bottom: 25px;
            font-size: 24px;
        }

        input {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
            transition: 0.3s;
        }

        input:focus {
            border-color: #1e90ff;
            outline: none;
            box-shadow: 0 0 6px rgba(30, 144, 255, 0.3);
        }

        .button {
            width: 100%;
            padding: 12px;
            background-color: #1e90ff;
            color: white;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            margin-top: 15px;
            transition: 0.3s ease-in-out;
        }

        .button:hover {
            background-color: #0f78d1;
            transform: scale(1.02);
        }

        .view-notes-link {
            display: block;
            margin-top: 20px;
            color: #1e90ff;
            text-decoration: none;
            font-weight: 600;
            font-size: 14px;
        }

        .view-notes-link:hover {
            text-decoration: underline;
        }

        @media (max-width: 500px) {
            .container {
                padding: 20px;
            }
        }
    </style>

    <!-- SweetAlert2 CDN -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>
<body>

    <div class="container">
        <h3>User Registration</h3>

        <form method="post">
            <input type="text" name="username" placeholder="Username" required />
            <input type="text" name="first_name" placeholder="First Name" required />
            <input type="text" name="last_name" placeholder="Last Name" required />
            <input type="email" name="email" placeholder="Email" required />
            <input type="password" name="password" placeholder="Password" required />
            <button type="submit" class="button">Register</button>
        </form>

        <!-- Link to login page -->
        <a href="Login.jsp" class="view-notes-link">Already have an account? Login</a>
    </div>

    <%
        // Handling registration
        String username = request.getParameter("username");
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String email_id = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordHash = null;

        boolean registrationSuccess = false;
        String errorMessage = ""; // To store error messages

        if (username != null && firstName != null && lastName != null && email_id != null && password != null) {
            try {
                // Hash the password
                MessageDigest md = MessageDigest.getInstance("SHA-256");
                md.update(password.getBytes());
                StringBuilder sb = new StringBuilder();
                for (byte b : md.digest()) {
                    sb.append(String.format("%02x", b));
                }
                passwordHash = sb.toString();

                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "Kaviyask2003@");

                // Insert new user into the Register table
                String registerQuery = "INSERT INTO Register (username, first_name, last_name, email, password_hash) VALUES (?, ?, ?, ?, ?)";
                PreparedStatement ps = con.prepareStatement(registerQuery);
                ps.setString(1, username);
                ps.setString(2, firstName);
                ps.setString(3, lastName);
                ps.setString(4, email_id);
                ps.setString(5, passwordHash); // Save the hashed password

                int result = ps.executeUpdate();
                if (result > 0) {
                    registrationSuccess = true;
                }

                con.close();
            } catch (SQLException e) {
                // Determine the error message based on the SQL exception
                if (e.getErrorCode() == 1062) {
                    errorMessage = "Email is already registered. Please use a different email.";
                } else {
                    errorMessage = "Database error occurred: " + e.getMessage();
                }
            } catch (NoSuchAlgorithmException e) {
                errorMessage = "Error hashing password: " + e.getMessage();
            } catch (Exception e) {
                errorMessage = "An unexpected error occurred: " + e.getMessage();
            }
        }
    %>

    <!-- JavaScript SweetAlert based on registration result -->
    <script>
        <% if (username != null && firstName != null && lastName != null && email_id != null && password != null) { %>
            <% if (registrationSuccess) { %>
                Swal.fire({
                    icon: 'success',
                    title: 'Registration Successful!',
                    text: 'Welcome!',
                    confirmButtonText: 'OK'
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.href = "Home.jsp"; // Redirect to save.jsp
                    }
                });
            <% 
            session.setAttribute("email_id", email_id);} else { %>
                Swal.fire({
                    icon: 'error',
                    title: 'Registration Failed',
                    text: '<%= errorMessage %>',
                    confirmButtonText: 'Try Again'
                });
            <% } %>
        <% } %>
    </script>

</body>
</html>

