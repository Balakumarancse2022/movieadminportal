<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Add Movie | PVR Cinemas</title>
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

        .movie-container {
            display: flex;
            min-height: 100vh;
            padding-top: 80px;
        }

        .movie-form {
            flex: 1;
            padding: 5% 8%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            background: rgba(30, 30, 30, 0.9);
            max-width: 50%;
        }

        .movie-form h2 {
            color: #00ffff;
            margin-bottom: 30px;
            font-size: 2rem;
            position: relative;
        }

        .movie-form h2::after {
            content: '';
            position: absolute;
            width: 50px;
            height: 3px;
            bottom: -10px;
            left: 0;
            background: #00ffff;
        }

        .form-group {
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
            padding: 12px 15px;
            background: transparent;
            border: none;
            border-bottom: 2px solid #333;
            font-size: 16px;
            color: #ffffff;
            transition: all 0.3s;
        }

        input:focus, select:focus {
            border-bottom-color: #00ffff;
            outline: none;
        }

	

		    select {
		        width: 100%;
		        padding: 12px 15px;
		        background: rgba(50, 50, 50, 0.8); /* Changed to dark background */
		        border: none;
		        border-bottom: 2px solid #333;
		        font-size: 16px;
		        color: #ffffff;
		        transition: all 0.3s;
		        border-radius: 4px; /* Added slight rounding */
		        appearance: none;
		        background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' fill='%2300ffff' viewBox='0 0 24 24'%3E%3Cpath d='M7 10l5 5 5-5z'/%3E%3C/svg%3E");
		        background-repeat: no-repeat;
		        background-position: right 15px center;
		    }


        .submit-btn {
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
            margin-top: 30px;
        }

        .submit-btn:hover {
            background: linear-gradient(135deg, #00bcd4 0%, #006978 100%);
            transform: translateY(-2px);
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
            color: #00ffff;
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
            .movie-container {
                flex-direction: column;
            }
            
            .movie-form {
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
            nav ul {
                gap: 15px;
            }
            
            .movie-image h1 {
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

    <div class="movie-container">
        <div class="movie-form">
            <form action="insertMovie" method="post">
                <h2>Add New Movie</h2>
                <div class="form-group">
                    <label for="mname">Movie Name</label>
                    <input type="text" id="mname" name="mname" required placeholder="Enter movie name">
                </div>
                <div class="form-group">
                    <label for="director">Director</label>
                    <input type="text" id="director" name="director" required placeholder="Enter director's name">
                </div>
                <div class="form-group">
                    <label for="lang">Language</label>
                    <select id="lang" name="lang" required>
                        <option value="" disabled selected>Select language</option>
                        <option value="Tamil">Tamil</option>
                        <option value="English">English</option>
                        <option value="Hindi">Hindi</option>
                        <option value="Telugu">Telugu</option>
                        <option value="Malayalam">Malayalam</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="rdate">Release Date</label>
                    <input type="date" id="rdate" name="rdate" required>
                </div>
                <button type="submit" class="submit-btn">Add Movie</button>
            </form>
        </div>
		
        
        <div class="movie-image">
            <div class="movie-image-content">
                <h1>Movie Management</h1>
                <p>Add new movies to the PVR Cinemas database. All added movies will be available for scheduling across our theaters.</p>
            </div>
        </div>
    </div>
</body>
</html>