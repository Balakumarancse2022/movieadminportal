<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard | PVR Cinemas</title>
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

        .dashboard-container {
            display: flex;
            min-height: 100vh;
            padding-top: 80px;
        }

        .dashboard-content {
            flex: 1;
            padding: 5% 8%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            background: rgba(30, 30, 30, 0.9);
        }

        .dashboard-image {
            flex: 1;
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), 
                        url('https://images.unsplash.com/photo-1536440136628-849c177e76a1') no-repeat center center/cover;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 0 5%;
        }

        .dashboard-image-content {
            max-width: 600px;
            margin-left: auto;
        }

        .dashboard-image h1 {
            font-size: 2.5rem;
            color: #00ffff;
            margin-bottom: 20px;
            text-shadow: 0 2px 4px rgba(0,0,0,0.5);
        }

        .success-message {
            color: #00ffff;
            margin-bottom: 40px;
            font-size: 2rem;
            position: relative;
            text-align: center;
        }

        .success-message::after {
            content: '';
            position: absolute;
            width: 50px;
            height: 3px;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            background: #00ffff;
        }

        .options-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
            margin-top: 40px;
        }

        .option-card {
            background: rgba(50, 50, 50, 0.8);
            border-radius: 8px;
            padding: 30px;
            text-align: center;
            transition: all 0.3s;
            border: 1px solid #333;
        }

        .option-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
            border-color: #00ffff;
        }

        .option-icon {
            font-size: 2.5rem;
            color: #00ffff;
            margin-bottom: 20px;
        }

        .option-title {
            font-size: 1.3rem;
            margin-bottom: 15px;
            color: #ffffff;
        }

        .option-btn {
            background: linear-gradient(135deg, #00bcd4 0%, #008ba3 100%);
            color: white;
            border: none;
            padding: 12px 25px;
            font-size: 1rem;
            font-weight: 600;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-block;
        }

        .option-btn:hover {
            background: linear-gradient(135deg, #00bcd4 0%, #006978 100%);
            transform: translateY(-2px);
        }

        @media (max-width: 1024px) {
            .dashboard-container {
                flex-direction: column;
            }
            
            .dashboard-content {
                padding: 60px 30px;
            }
            
            .dashboard-image {
                padding: 80px 30px;
                text-align: center;
            }
            
            .dashboard-image-content {
                margin: 0 auto;
            }
        }

        @media (max-width: 768px) {
            nav ul {
                gap: 15px;
            }
            
            .dashboard-image h1 {
                font-size: 2rem;
            }
            
            .options-container {
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
            <li><a href="/index#about">About</a></li>
            <li><a href="/index#contact">Contact</a></li>
        </ul>
    </nav>

    <div class="dashboard-container">
        <div class="dashboard-content">
            <h1 class="success-message">Operation Successful!</h1>
            
            <div class="options-container">
                <div class="option-card">
                    <div class="option-icon">🎬</div>
                    <h3 class="option-title">View All Movies</h3>
                    <a href="viewmovies" class="option-btn">View Movies</a>
                </div>
                
                <div class="option-card">
                    <div class="option-icon">➕</div>
                    <h3 class="option-title">Add New Movie</h3>
                    <a href="addmovie" class="option-btn">Add Movie</a>
                </div>
                
                <div class="option-card">
                    <div class="option-icon">🌐</div>
                    <h3 class="option-title">View By Language</h3>
                    <a href="viewlanguages" class="option-btn">View Languages</a>
                </div>
            </div>
        </div>
        
        <div class="dashboard-image">
            <div class="dashboard-image-content">
                <h1>Movie Management</h1>
                <p>Manage your cinema's movie collection with ease. View, add, or filter movies by language.</p>
            </div>
        </div>
    </div>
</body>
</html>