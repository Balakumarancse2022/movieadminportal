<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Movie Languages | PVR Cinemas</title>
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
            max-width: 1200px;
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
            color: var(--primary);
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
            background: var(--primary);
        }
        
        .language-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }
        
        .language-card {
            background: var(--card-bg);
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            transition: all 0.3s ease;
            border: 1px solid rgba(255, 255, 255, 0.05);
            text-align: center;
        }
        
        .language-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 188, 212, 0.3);
            border-color: rgba(0, 188, 212, 0.3);
        }
        
        .language-link {
            display: block;
            padding: 30px 20px;
            color: var(--light);
            text-decoration: none;
            font-size: 1.2rem;
            font-weight: 500;
            transition: all 0.3s;
        }
        
        .language-link:hover {
            color: var(--primary);
        }
        
        .no-languages {
            grid-column: 1 / -1;
            text-align: center;
            padding: 40px;
            background: var(--card-bg);
            border-radius: 10px;
            color: var(--gray);
            font-style: italic;
            border: 1px dashed rgba(255, 255, 255, 0.1);
        }
        
        @media (max-width: 1024px) {
            .container {
                padding: 30px;
            }
            
            .language-grid {
                grid-template-columns: repeat(auto-fill, minmax(180px, 1fr));
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
            
            .language-grid {
                grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
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
        <div class="header">
            <h1>Browse by Language</h1>
        </div>
        
        <div class="language-grid">
            <c:choose>
                <c:when test="${not empty lang}">
                    <c:forEach items="${lang}" var="language">
                        <div class="language-card">
                            <a href="viewmoviesbylang?lang=${language}" class="language-link">
                                ${language}
                            </a>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="no-languages">
                        No languages currently available
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</body>
</html>