<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Movie Gallery | PVR Cinemas</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        
        body {
            background-color: #121212;
            color: #ffffff;
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
        
        .container {
            max-width: 1400px;
            margin: 80px auto 40px;
            padding: 40px;
        }
        
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 40px;
        }
        
        h1 {
            color: #00ffff;
            font-size: 2rem;
            font-weight: 600;
            position: relative;
            padding-bottom: 10px;
        }
        
        h1::after {
            content: '';
            position: absolute;
            width: 50px;
            height: 3px;
            bottom: 0;
            left: 0;
            background: #00ffff;
        }
        
        .add-movie-btn {
            background: linear-gradient(135deg, #00bcd4 0%, #008ba3 100%);
            color: white;
            border: none;
            padding: 12px 24px;
            font-size: 16px;
            font-weight: 600;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-block;
        }
        
        .add-movie-btn:hover {
            background: linear-gradient(135deg, #00bcd4 0%, #006978 100%);
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(0, 188, 212, 0.4);
        }
        
        .movie-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 30px;
            margin-top: 30px;
        }
        
        .movie-card {
            background: rgba(30, 30, 30, 0.8);
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
            transition: all 0.3s ease;
            border: 1px solid rgba(255, 255, 255, 0.05);
        }
        
        .movie-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 188, 212, 0.2);
            border-color: rgba(0, 188, 212, 0.3);
        }
        
        .movie-poster {
            height: 180px;
            background: linear-gradient(135deg, #006978 0%, #003640 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: rgba(255, 255, 255, 0.3);
            font-size: 1.5rem;
            position: relative;
            overflow: hidden;
        }
        
        .movie-poster::after {
            content: 'PVR';
            position: absolute;
            font-size: 5rem;
            font-weight: 700;
            opacity: 0.05;
        }
        
        .movie-details {
            padding: 20px;
        }
        
        .movie-title {
            font-size: 1.2rem;
            font-weight: 600;
            margin-bottom: 10px;
            color: #ffffff;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        
        .movie-info {
            display: flex;
            flex-direction: column;
            gap: 8px;
            margin-bottom: 20px;
        }
        
        .info-row {
            display: flex;
            align-items: center;
        }
        
        .info-label {
            color: #00ffff;
            font-weight: 500;
            min-width: 100px;
            font-size: 0.9rem;
        }
        
        .info-value {
            color: #dddddd;
            font-size: 0.9rem;
        }
        
        .card-actions {
            display: flex;
            gap: 10px;
            margin-top: 15px;
            border-top: 1px solid rgba(255, 255, 255, 0.05);
            padding-top: 15px;
        }
        
        .action-btn {
            flex: 1;
            padding: 8px 12px;
            border-radius: 6px;
            font-weight: 500;
            font-size: 0.85rem;
            text-align: center;
            text-decoration: none;
            transition: all 0.3s;
        }
        
        .edit-btn {
            background: rgba(0, 188, 212, 0.1);
            color: #00ffff;
            border: 1px solid rgba(0, 188, 212, 0.3);
        }
        
        .edit-btn:hover {
            background: rgba(0, 188, 212, 0.2);
        }
        
        .delete-btn {
            background: rgba(234, 67, 53, 0.1);
            color: #ea4335;
            border: 1px solid rgba(234, 67, 53, 0.3);
        }
        
        .delete-btn:hover {
            background: rgba(234, 67, 53, 0.2);
        }
        
        @media (max-width: 1024px) {
            .container {
                padding: 30px;
            }
            
            .movie-grid {
                grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            }
        }
        
        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }
            
            .header {
                flex-direction: column;
                align-items: flex-start;
                gap: 20px;
            }
            
            .movie-grid {
                grid-template-columns: 1fr;
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
            <li><a href="index">Home</a></li>
            <li><a href="index#about">About</a></li>
            <li><a href="index#contact">Contact</a></li>
        </ul>
    </nav>

    <div class="container">
        <div class="header">
            <h1>Movie Gallery</h1>
            <a href="addmovie" class="add-movie-btn">+ Add New Movie</a>
        </div>
        
        <div class="movie-grid">
            <c:forEach items="${movies}" var="m">
            <div class="movie-card">
                <div class="movie-poster">
                    <!-- Placeholder for movie poster - you can replace with actual image -->
                    ${m.moviename}
                </div>
                <div class="movie-details">
                    <h3 class="movie-title">${m.moviename}</h3>
                    <div class="movie-info">
                        <div class="info-row">
                            <span class="info-label">Language:</span>
                            <span class="info-value">${m.language}</span>
                        </div>
                        <div class="info-row">
                            <span class="info-label">Release Date:</span>
                            <span class="info-value">${m.relesedate}</span>
                        </div>
                        <div class="info-row">
                            <span class="info-label">Director:</span>
                            <span class="info-value">${m.director}</span>
                        </div>
                    </div>
                    <div class="card-actions">
                        <a href="updatemovie?id=${m.movieid}" class="action-btn edit-btn">Edit</a>
                        <a href="deletemovie?id=${m.movieid}" class="action-btn delete-btn">Delete</a>
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>