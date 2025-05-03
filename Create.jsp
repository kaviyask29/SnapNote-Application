<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String username = (String) session.getAttribute("username");
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Note</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e6f7ff;
            margin: 0;
            padding: 0;
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
            max-width: 600px;
            margin: 80px auto 20px auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h3 {
            color: #1e90ff;
            font-size: 24px;
        }

        input, textarea {
            width: 100%;
            margin: 10px 0;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .button {
            background-color: #1e90ff;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .button:hover {
            background-color: #1c7dc3;
        }

        .view-notes-link {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #1e90ff;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        .view-notes-link:hover {
            background-color: #1c7dc3;
        }
    </style>

    <!-- SweetAlert CDN -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
                <span>Welcome, <%= username %>!</span>
                <a href="Logout.jsp">Logout</a>
            <% } else { %>
                <a href="Login.jsp">Login</a>
            <% } %>
        </div>
    </div>

    <div class="container">
        <h3>Save a New Note</h3>
        <form method="post">
            <input type="text" name="title" placeholder="Note Title" required />
            <textarea name="content" placeholder="Note Content" required></textarea>
            <button type="submit" class="button">Save Note</button>
        </form>

        <%
            HttpSession sessions = request.getSession();
            String emailId = (String) sessions.getAttribute("email_id");

            String title = request.getParameter("title");
            String content = request.getParameter("content");

            boolean noteSaved = false;
            String errorMessage = "";

            if (title != null && content != null) {
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "Kaviyask2003@");

                    String noteQuery = "INSERT INTO Notes (title, content, email_id) VALUES (?, ?, ?)";
                    PreparedStatement ps = con.prepareStatement(noteQuery);
                    ps.setString(1, title);
                    ps.setString(2, content);
                    ps.setString(3, emailId);

                    int result = ps.executeUpdate();
                    if (result > 0) {
                        noteSaved = true;
                    } else {
                        errorMessage = "Error saving note. Please try again.";
                    }

                    con.close();
                } catch (Exception e) {
                    errorMessage = e.getMessage();
                }
            }
        %>

        <script>
            <% if (noteSaved) { %>
                Swal.fire({
                    icon: 'success',
                    title: 'Note Saved!',
                    text: 'Your note has been saved successfully.',
                    confirmButtonText: 'OK'
                });
            <% } else if (title != null && content != null) { %>
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: '<%= errorMessage %>',
                    confirmButtonText: 'Try Again'
                });
            <% } %>
        </script>

        <a href="Savenotes.jsp" class="view-notes-link">View Saved Notes</a>
    </div>
</body>
</html>
