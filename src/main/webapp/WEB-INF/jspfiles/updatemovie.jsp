<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Update Movie | PVR Cinemas</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');
        
        :root {
            --primary: #00bcd4;
            --secondary: #008ba3;
            --accent: #ff7e5f;
            --light: #ffffff;
            --dark: #121212;
            --gray: #6c757d;
            --card-bg: rgba(30, 30, 30, 0.9);
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        
        body {
            background-color: var(--dark);
            color: var(--light);
            min-height: 100vh;
            padding: 0;
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
            border: 2px solid var(--primary);
        }
        
        .logo span {
            font-size: 20px;
            font-weight: 700;
            color: var(--primary);
            letter-spacing: 1px;
        }
        
        nav ul {
            list-style: none;
            display: flex;
            gap: 30px;
        }
        
        nav ul li a {
            color: var(--light);
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s;
        }
        
        nav ul li a:hover {
            color: var(--primary);
        }
        
        .container {
            display: flex;
            min-height: 100vh;
            padding-top: 80px;
        }
        
        .update-form {
            flex: 1;
            padding: 5% 8%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            background: var(--card-bg);
            max-width: 50%;
        }
        
        .update-form h2 {
            color: var(--primary);
            margin-bottom: 30px;
            font-size: 2rem;
            position: relative;
        }
        
        .update-form h2::after {
            content: '';
            position: absolute;
            width: 50px;
            height: 3px;
            bottom: -10px;
            left: 0;
            background: var(--primary);
        }
        
        .form-group {
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
        
        .form-group:nth-child(1) { animation-delay: 0.4s; }
        .form-group:nth-child(2) { animation-delay: 0.5s; }
        .form-group:nth-child(3) { animation-delay: 0.6s; }
        .form-group:nth-child(4) { animation-delay: 0.7s; }
        
        label {
            display: block;
            margin-bottom: 8px;
            color: #dddddd;
            font-weight: 500;
        }
        
        input, select {
            width: 100%;
            padding: 14px 18px;
            background: rgba(50, 50, 50, 0.8);
            border: 1px solid #333;
            border-radius: 6px;
            font-size: 1rem;
            color: var(--light);
            transition: all 0.3s;
        }
        
        input:focus, select:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(0, 188, 212, 0.2);
            outline: none;
            background: rgba(70, 70, 70, 0.8);
        }
        
        select {
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' fill='%2300ffff' viewBox='0 0 24 24'%3E%3Cpath d='M7 10l5 5 5-5z'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 15px center;
        }
        
        .submit-btn {
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            color: white;
            border: none;
            padding: 16px;
            font-size: 1rem;
            font-weight: 600;
            border-radius: 6px;
            cursor: pointer;
            width: 100%;
            transition: all 0.3s;
            margin-top: 30px;
            opacity: 0;
            animation: fadeIn 0.5s forwards 1s;
            box-shadow: 0 4px 15px rgba(0, 188, 212, 0.3);
        }
        
        @keyframes fadeIn {
            to { opacity: 1; }
        }
        
        .submit-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(0, 188, 212, 0.4);
        }
        
        .movie-image {
            flex: 1;
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), 
                        url('https://images.unsplash.com/photo-1489599849927-2ee91cede3ba') no-repeat center center/cover;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 0 5%;
            position: relative;
        }
        
        .movie-image-content {
            max-width: 600px;
            margin-left: auto;
        }
        
        .movie-image h1 {
            font-size: 2.5rem;
            color: var(--primary);
            margin-bottom: 20px;
            text-shadow: 0 2px 4px rgba(0,0,0,0.5);
        }
        
        .movie-image p {
            font-size: 1.1rem;
            color: #dddddd;
            line-height: 1.6;
            margin-bottom: 30px;
        }
        
        @media (max-width: 1024px) {
            .container {
                flex-direction: column;
            }
            
            .update-form {
                max-width: 100%;
                padding: 60px 30px;
            }
            
            .movie-image {
                padding: 80px 30px;
                text-align: center;
            }
            
            .movie-image-content {
                margin: 0 auto;
            }
        }
        
        @media (max-width: 768px) {
            .update-form {
                padding: 40px 20px;
            }
            
            .update-form h2 {
                font-size: 1.8rem;
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

    <div class="container">
        <div class="update-form">
            <form action="updatemoviedetails" method="post">
                <h2>Update Movie</h2>
                
                <div class="form-group">
                    <label for="mname">Movie Name</label>
                    <input type="text" id="mname" name="mname" value="${movie.moviename}" required>
                </div>
                
                <div class="form-group">
                    <label for="director">Director</label>
                    <input type="text" id="director" name="director" value="${movie.director}" required>
                </div>
                
                <div class="form-group">
                    <label for="lang">Language</label>
                    <select id="lang" name="lang" required>
                        <option value="Tamil" ${movie.language == 'Tamil' ? 'selected' : ''}>Tamil</option>
                        <option value="English" ${movie.language == 'English' ? 'selected' : ''}>English</option>
                        <option value="Hindi" ${movie.language == 'Hindi' ? 'selected' : ''}>Hindi</option>
                        <option value="Telugu" ${movie.language == 'Telugu' ? 'selected' : ''}>Telugu</option>
                        <option value="Malayalam" ${movie.language == 'Malayalam' ? 'selected' : ''}>Malayalam</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="rdate">Release Date</label>
                    <input type="date" id="rdate" name="rdate" value="${movie.relesedate}" required>
                </div>
                
                <input type="hidden" name="movieid" value="${movie.movieid}">
                <button type="submit" class="submit-btn">Update Movie</button>
            </form>
        </div>
        
        <div class="movie-image">
            <div class="movie-image-content">
                <h1>Movie Management</h1>
                <p>Update movie details in the PVR Cinemas database. All changes will be reflected across our theaters immediately.</p>
            </div>
        </div>
    </div>
</body>
</html>