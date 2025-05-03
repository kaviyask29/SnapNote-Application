<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%
    String username = (String) session.getAttribute("username");
%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Your Notes</title>
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
            max-width: 1000px;
            margin: 80px auto 20px auto;
            padding: 20px;
            text-align: center;
        }

        h3 {
            color: blue;
            font-size: 24px;
        }

        .notes-wrapper {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            gap: 20px;
        }

        .note {
            background-color: pink;
            padding: 15px;
            width: 250px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: left;
            position: relative;
        }

        .note-title {
            font-size: 18px;
            color: blue;
            font-weight: bold;
        }

        .note-content {
            margin-top: 10px;
            font-size: 16px;
            color:blue;
        }

        .delete-button {
            position: absolute;
            top: 10px;
            right: 10px;
            background-color: blue;
            color: white;
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .delete-button:hover {
            background-color: #c0392b;
        }

        .back-button {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: blue;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        .back-button:hover {
            background-color: #2e7d32;
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
                <span>Welcome, <%= username %>!</span>
                <a href="Logoutjsp">Logout</a>
            <% } else { %>
                <a href="Login.jsp">Login</a>
            <% } %>
        </div>
    </div>

    <div class="container">
        <h3>Your Saved Notes</h3>

        <div class="notes-wrapper">
        <%
            HttpSession sessionses = request.getSession();
            String emailId = (String) sessionses.getAttribute("email_id");

            String deleteId = request.getParameter("deleteId");
            if (deleteId != null) {
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "Kaviyask2003@");

                    String deleteQuery = "DELETE FROM Notes WHERE id = ?";
                    PreparedStatement deletePs = con.prepareStatement(deleteQuery);
                    deletePs.setInt(1, Integer.parseInt(deleteId));
                    deletePs.executeUpdate();

                    deletePs.close();
                    con.close();
                } catch (Exception e) {
                    out.println("<p>Error deleting note: " + e.getMessage() + "</p>");
                }
            }

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Project", "root", "Kaviyask2003@");

                String selectQuery = "SELECT * FROM Notes WHERE email_id = ?";
                PreparedStatement ps = con.prepareStatement(selectQuery);
                ps.setString(1, emailId);
                ResultSet rs = ps.executeQuery();

                boolean notesExist = false;
                while (rs.next()) {
                    notesExist = true;
        %>
                    <div class="note">
                        <div class="note-title"><%= rs.getString("title") %></div>
                        <div class="note-content"><%= rs.getString("content") %></div>
                        <form method="post" style="display: inline;">
                            <input type="hidden" name="deleteId" value="<%= rs.getInt("id") %>" />
                            <button type="submit" class="delete-button">Delete</button>
                        </form>
                    </div>
        <%
                }

                if (!notesExist) {
        %>
                    <p>No notes found for your account!</p>
        <%
                }

                ps.close();
                con.close();
            } catch (Exception e) {
        %>
                <p>Error: <%= e.getMessage() %></p>
        <%
            }
        %>
        </div>

        <a href="Send.jsp" class="back-button">Back to Save Note</a>
          <a href="Logout.jsp" class="back-button">Log out</a>
    </div>
</body>
</html>
