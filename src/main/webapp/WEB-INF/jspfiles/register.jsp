<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Admin Registration | PVR Cinemas</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        html, body {
            height: 100%;
            background-color: #121212;
            color: #ffffff;
        }

        nav {
            position: fixed;
            top: 0;
            width: 100%;
            background: linear-gradient(135deg, rgba(0,0,0,0.9) 0%, rgba(20,20,20,0.95) 100%);
            padding: 14px 30px;
            z-index: 100;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 20px rgba(0, 188, 212, 0.2);
            border-bottom: 1px solid rgba(0, 188, 212, 0.1);
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .logo-img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid #00ffff;
        }

        .logo span {
            font-size: 20px;
            font-weight: 700;
            color: #00ffff;
            letter-spacing: 1px;
        }

        nav ul {
            list-style: none;
            display: flex;
            gap: 30px;
        }

        nav ul li a {
            color: #ffffff;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s;
        }

        nav ul li a:hover {
            color: #00ffff;
        }

        .admin-container {
            display: flex;
            min-height: 100vh;
            padding-top: 80px;
        }

        .admin-image {
            flex: 1;
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), 
                        url('https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c') no-repeat center center/cover;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 0 5%;
            position: relative;
        }

        .admin-image-content {
            max-width: 600px;
        }

        .admin-image h1 {
            font-size: 2.5rem;
            color: #00ffff;
            margin-bottom: 20px;
            text-shadow: 0 2px 4px rgba(0,0,0,0.5);
        }

        .admin-image p {
            font-size: 1.1rem;
            color: #dddddd;
            line-height: 1.6;
            margin-bottom: 30px;
        }

        .admin-features {
            list-style: none;
        }

        .admin-features li {
            margin-bottom: 15px;
            padding-left: 0;
            position: relative;
            display: flex;
            align-items: center;
        }

        .admin-form {
            flex: 1;
            padding: 5% 8%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            background: rgba(30, 30, 30, 0.95);
            max-width: 600px;
        }

        .admin-form h2 {
            color: #00ffff;
            margin-bottom: 30px;
            font-size: 2rem;
            position: relative;
        }

        .admin-form h2::after {
            content: '';
            position: absolute;
            width: 50px;
            height: 3px;
            bottom: -10px;
            left: 0;
            background: #00ffff;
        }

        .input-group {
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #dddddd;
            font-weight: 500;
        }

        input, select {
            width: 100%;
            padding: 14px 15px;
            background: rgba(50, 50, 50, 0.8);
            border: 1px solid #333;
            border-radius: 6px;
            font-size: 16px;
            color: #ffffff;
            transition: all 0.3s;
        }

        input:focus, select:focus {
            border-color: #00ffff;
            box-shadow: 0 0 0 3px rgba(0, 255, 255, 0.1);
            outline: none;
            background: rgba(70, 70, 70, 0.8);
        }

        .btn-submit {
            background: linear-gradient(135deg, #00bcd4 0%, #008ba3 100%);
            color: white;
            border: none;
            padding: 16px;
            font-size: 16px;
            font-weight: 600;
            border-radius: 6px;
            cursor: pointer;
            width: 100%;
            transition: all 0.3s;
            margin-top: 10px;
        }

        .btn-submit:hover {
            background: linear-gradient(135deg, #00bcd4 0%, #006978 100%);
            transform: translateY(-2px);
        }

        .login-link {
            text-align: center;
            margin-top: 20px;
            color: #aaaaaa;
        }

        .login-link a {
            color: #00ffff;
            text-decoration: none;
            transition: color 0.3s;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        @media (max-width: 1024px) {
            .admin-container {
                flex-direction: column;
            }
            
            .admin-form {
                max-width: 100%;
                padding: 60px 30px;
            }
            
            .admin-image {
                padding: 80px 30px;
                text-align: center;
            }
            
            .admin-image-content {
                margin: 0 auto;
            }
        }

        @media (max-width: 768px) {
            nav ul {
                gap: 15px;
            }
            
            .admin-image h1 {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav>
        <div class="logo">
            <img src="/images/pvr.png" alt="PVR Logo" class="logo-img">
            <span>PVR</span>
        </div>
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="#contact">Contact</a></li>
        </ul>
    </nav>

    <div class="admin-container">
        <div class="admin-image">
            <div class="admin-image-content">
                <h1>Admin Portal Access</h1>
                <p>Register for exclusive administrator privileges to manage PVR Cinemas operations:</p>
                <ul class="admin-features">
                    <li>Full control over movie listings and showtimes</li>
                    <li>Manage theater screens and configurations</li>
                    <li>Access to comprehensive analytics</li>
                    <li>User management and permission controls</li>
                </ul>
            </div>
        </div>
        
        <div class="admin-form">
            <form action="insertUser" method="post">
                <h2>Admin Registration</h2>
                <div class="input-group">
                    <label for="email">Corporate Email:</label>
                    <input type="email" id="email" name="email" required placeholder="admin@pvr.com">
                </div>
                <div class="input-group">
                    <label for="name">Full Name:</label>
                    <input type="text" id="name" name="name" required placeholder="Your full name">
                </div>
                <div class="input-group">
                    <label for="gender">Gender:</label>
                    <select id="gender" name="gender" required>
                        <option value="" disabled selected>Select gender</option>
                        <option value="male">Male</option>
                        <option value="female">Female</option>
                        <option value="other">Other</option>
                    </select>
                </div>
                <div class="input-group">
                    <label for="pass">Secure Password:</label>
                    <input type="password" id="pass" name="pass" required placeholder="Enter password">
                </div>
                <button type="submit" class="btn-submit">Register Admin Account</button>
                <div class="login-link">
                    Already have an account? <a href="/login">Admin Login</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>