<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Notes App</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f7fc;
        }

        /* Navbar */
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
            color: #ffd700;
        }

        .logout-btn,
        .login-btn {
            background-color: #1e90ff;
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

        .login-btn:hover {
            background-color: #1565c0;
            transform: scale(1.05);
        }

        /* About Section */
        .about-section {
            max-width: 700px;
            margin: 50px auto;
            padding: 30px;
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .about-section h3 {
            color: #333;
            font-size: 28px;
            margin-bottom: 15px;
        }

        .about-section p {
            color: #555;
            font-size: 16px;
            line-height: 1.6;
            text-align: center;
        }

        .about-section h4 {
            font-size: 20px;
            margin-top: 30px;
            color: #1e90ff;
        }

        /* Feature List */
        .feature-list {
            list-style: none;
            padding-left: 0;
            text-align: left;
            margin-top: 15px;
        }

        .feature-list li {
            font-size: 16px;
            color: #444;
            margin-bottom: 12px;
            padding-left: 10px;
            position: relative;
            display: flex;
            align-items: center;
            transition: transform 0.2s ease;
        }

        .feature-list li span {
            font-size: 18px;
            margin-right: 10px;
            transition: transform 0.3s ease;
        }

        .feature-list li:hover {
            transform: translateX(5px);
            color: #1e90ff;
        }

        .feature-list li:hover span {
            transform: scale(1.2);
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
            <a href="Login.jsp" class="login-btn">Login</a>
        </div>
    </div>

    <!-- About Section -->
    <div class="about-section">
        <h3>About Notes App</h3>
        <p>
            <strong>Notes App</strong> is a sleek, intuitive web application designed to simplify the process of creating, storing, and managing notes. Whether you're a student, professional, or a casual user, this tool helps you organize your thoughts and ideas effortlessly.
        </p>

        <h4>✨ Key Features</h4>
        <ul class="feature-list">
            <li><span>📝</span> Create and edit notes with ease</li>
            <li><span>💾</span> Save notes securely for later use</li>
            <li><span>🌐</span> Access your notes from any device, anytime</li>
            <li><span>🎯</span> Clean, clutter-free interface for smooth navigation</li>
        </ul>

        <h4>🎯 Our Mission</h4>
        <p>
            Our mission is to provide a distraction-free space for you to capture thoughts, track tasks, and stay organized. We aim to boost your productivity and help you focus on what matters most—one note at a time.
        </p>
    </div>

    <!-- Footer -->
    <div class="footer">
        <p>Need help? Visit our <a href="Help.jsp">Help page</a>.</p>
    </div>

</body>
</html>
