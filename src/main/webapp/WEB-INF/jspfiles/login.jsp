<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Movie Portal Login</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');
        
        :root {
            --primary: #00bcd4;
            --secondary: #008ba3;
            --accent: #ff7e5f;
            --light: #ffffff;
            --dark: #121212;
            --gray: #6c757d;
            --error: #ff4444;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        
        body {
            background: var(--dark);
            min-height: 100vh;
            display: flex;
            padding: 0;
            overflow: hidden;
        }
        
        .login-wrapper {
            display: flex;
            width: 100%;
            min-height: 100vh;
        }
        
        .login-image {
            flex: 1;
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), 
                        url('https://images.unsplash.com/photo-1536440136628-849c177e76a1') no-repeat center center/cover;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 0 5%;
            position: relative;
        }
        
        .login-image-content {
            max-width: 500px;
            margin-left: auto;
        }
        
        .login-image h1 {
            font-size: 2.5rem;
            color: var(--primary);
            margin-bottom: 20px;
        }
        
        .login-image p {
            font-size: 1.1rem;
            color: #dddddd;
            line-height: 1.6;
        }
        
        .login-container {
            width: 100%;
            max-width: 500px;
            background: rgba(30, 30, 30, 0.9);
            padding: 60px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            animation: fadeInUp 0.8s forwards 0.3s;
            transform: translateY(20px);
            opacity: 0;
        }
        
        @keyframes fadeInUp {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .form-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .form-header h2 {
            color: var(--primary);
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 10px;
        }
        
        .form-header p {
            color: var(--gray);
            font-size: 0.9rem;
        }
        
        .input-group {
            margin-bottom: 25px;
            position: relative;
            opacity: 0;
            transform: translateX(-20px);
            animation: slideIn 0.5s forwards;
        }
        
        @keyframes slideIn {
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }
        
        .input-group:nth-child(1) { animation-delay: 0.4s; }
        .input-group:nth-child(2) { animation-delay: 0.5s; }
        
        .input-group label {
            display: block;
            margin-bottom: 8px;
            color: #dddddd;
            font-weight: 500;
            font-size: 0.95rem;
        }
        
        .input-group input {
            width: 100%;
            padding: 14px 18px;
            background: rgba(50, 50, 50, 0.8);
            border: 1px solid #333;
            border-radius: 6px;
            font-size: 1rem;
            color: var(--light);
            transition: all 0.3s;
        }
        
        .input-group input:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(0, 188, 212, 0.2);
            outline: none;
            background: rgba(70, 70, 70, 0.8);
        }
        
        .btn-container {
            margin-top: 30px;
            opacity: 0;
            animation: fadeIn 0.5s forwards 0.8s;
        }
        
        @keyframes fadeIn {
            to { opacity: 1; }
        }
        
        .btn {
            display: block;
            width: 100%;
            padding: 16px;
            font-size: 1rem;
            font-weight: 600;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.4s;
            text-align: center;
            text-decoration: none;
            border: none;
            margin-bottom: 15px;
        }
        
        .btn-primary {
            background: linear-gradient(to right, var(--primary), var(--secondary));
            color: var(--light);
            box-shadow: 0 6px 15px rgba(0, 188, 212, 0.4);
            position: relative;
            overflow: hidden;
        }
        
        .btn-primary:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 188, 212, 0.6);
        }
        
        .btn-primary::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(to right, transparent, rgba(255,255,255,0.2), transparent);
            transition: 0.5s;
        }
        
        .btn-primary:hover::before {
            left: 100%;
        }
        
        .register-link {
            text-align: center;
            margin-top: 10px;
            opacity: 0;
            animation: fadeIn 0.5s forwards 0.9s;
        }
        
        .register-link a {
            color: var(--primary);
            text-decoration: none;
            font-size: 0.9rem;
            transition: color 0.3s;
        }
        
        .register-link a:hover {
            color: var(--accent);
            text-decoration: underline;
        }
        
        .error-message {
            color: var(--error);
            background: rgba(255, 68, 68, 0.1);
            padding: 12px;
            border-radius: 6px;
            margin-bottom: 20px;
            text-align: center;
            font-size: 0.9rem;
            border: 1px solid rgba(255, 68, 68, 0.3);
            animation: shake 0.5s;
        }
        
        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            10%, 30%, 50%, 70%, 90% { transform: translateX(-5px); }
            20%, 40%, 60%, 80% { transform: translateX(5px); }
        }
        
        @media (max-width: 1024px) {
            .login-wrapper {
                flex-direction: column;
            }
            
            .login-image {
                padding: 80px 30px;
                text-align: center;
            }
            
            .login-image-content {
                margin: 0 auto;
            }
            
            .login-container {
                max-width: 100%;
                padding: 60px 30px;
            }
        }
        
        @media (max-width: 480px) {
            .login-container {
                padding: 40px 20px;
            }
            
            .form-header h2 {
                font-size: 1.8rem;
            }
            
            .btn {
                padding: 14px;
                font-size: 0.95rem;
            }
        }
    </style>
</head>
<body>
    <div class="login-wrapper">
        <div class="login-container">
            <div class="form-header">
                <h2>Welcome Back</h2>
                <p>Sign in to access your movie portal</p>
            </div>
            
            <form action="/checkUser" method="post">

                <% 
                String error = (String) request.getAttribute("error");
                if (error != null) { 
                %>
                    <div class="error-message">
                        <%= error %>
                    </div>
                <% } %>

                <div class="input-group">
                    <label for="email">Email Address</label>
                    <input type="email" id="email" name="email" required placeholder="Enter your email" 
                           value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>">
                </div>
                
                <div class="input-group">
                    <label for="pass">Password</label>
                    <input type="password" id="pass" name="pass" required placeholder="Enter your password">
                </div>
                
                <div class="btn-container">
                    <button type="submit" class="btn btn-primary">Login</button>
                </div>
                
                <div class="register-link">
                    <p>Don't have an account? <a href="/register">Create one</a></p>
                </div>
            </form>
        </div>
        
        <div class="login-image">
            <div class="login-image-content">
                <h1>PVR Cinemas</h1>
                <p>Access the admin portal to manage movies, showtimes, and theater operations.</p>
            </div>
        </div>
    </div>
</body>
</html>
