<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Movie Portal</title>
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
            scroll-behavior: smooth;
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
            transition: transform 0.3s ease;
        }

        .logo:hover {
            transform: scale(1.05);
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
            position: relative;
            padding: 5px 0;
        }

        nav ul li a:hover {
            color: #00ffff;
        }

        nav ul li a::after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            bottom: 0;
            left: 0;
            background-color: #00ffff;
            transition: width 0.3s;
        }

        nav ul li a:hover::after {
            width: 100%;
        }

        .bg-full {
            background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), 
                        url('https://images.unsplash.com/photo-1524985069026-dd778a71c7b4') no-repeat center center/cover;
            height: 100vh;
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            padding-top: 60px;
        }

        h1 {
            font-size: 4.5rem;
            margin-bottom: 15px;
            color: #ffffff;
            font-weight: 700;
            letter-spacing: 2px;
            background: linear-gradient(90deg, #00ffff, #00bcd4);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        h2 {
            font-size: 1.8rem;
            font-weight: 400;
            margin-bottom: 30px;
            color: #ffffff;
        }

        .nav-links {
            display: flex;
            gap: 30px;
            margin-top: 30px;
        }

        .nav-link {
            background: linear-gradient(135deg, #00bcd4 0%, #008ba3 100%);
            padding: 15px 35px;
            color: white;
            text-decoration: none;
            border-radius: 50px;
            font-weight: 600;
            transition: all 0.3s;
            box-shadow: 0 4px 15px rgba(0, 188, 212, 0.4);
            border: none;
            font-size: 1rem;
            letter-spacing: 1px;
        }

        .nav-link:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(0, 188, 212, 0.6);
            background: linear-gradient(135deg, #00bcd4 0%, #006978 100%);
        }

        section {
            padding: 100px 40px;
            text-align: center;
        }

        section h2 {
            font-size: 2.5rem;
            margin-bottom: 40px;
            color: #00ffff;
            position: relative;
            display: inline-block;
        }

        section h2::after {
            content: '';
            position: absolute;
            width: 50%;
            height: 3px;
            bottom: -10px;
            left: 25%;
            background: linear-gradient(90deg, transparent, #00ffff, transparent);
        }

        section p, section ul {
            font-size: 1.1rem;
            color: #dddddd;
            max-width: 800px;
            margin: auto;
            line-height: 1.8;
        }

        ul.amenities {
            list-style: none;
            margin-top: 30px;
            padding-left: 0;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            text-align: left;
        }

        ul.amenities li {
            margin-bottom: 15px;
            padding-left: 25px;
            position: relative;
        }

        ul.amenities li::before {
            content: '';
            position: absolute;
            left: 0;
            top: 10px;
            width: 10px;
            height: 2px;
            background-color: #00ffff;
        }

        #contact {
            background: linear-gradient(135deg, #1e1e1e 0%, #121212 100%);
        }

        #contact p {
            font-size: 1.2rem;
            margin-bottom: 15px;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            h1 {
                font-size: 3rem;
            }
            
            h2 {
                font-size: 1.5rem;
            }
            
            .nav-links {
                flex-direction: column;
                gap: 15px;
            }
            
            nav ul {
                gap: 15px;
            }
            
            section {
                padding: 60px 20px;
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
            <li><a href="#home">Home</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="#contact">Contact</a></li>
        </ul>
    </nav>

    <!-- Home Section with Background -->
    <div class="bg-full" id="home">
        <h1>PVR CINEMAS</h1>
        <h2>Welcome to Admin Movie Portal</h2>
        <div class="nav-links">
            <a href="register" class="nav-link">New User Register</a>
            <a href="login" class="nav-link">Login</a>
        </div>
    </div>

    <!-- About Section -->
    <section id="about">
        <h2>About Our Theatre</h2>
        <p>
            Welcome to a whole new level of movie experience at PVR Cinemas. Our theatre combines luxury, technology, and entertainment to offer you an unforgettable time.
        </p>
        <ul class="amenities">
            <li>Dolby Atmos Surround Sound enhances your movie experience</li>
            <li>4K Laser Projection Screens bring visuals to life</li>
            <li>Luxury Recliner Seats offer maximum comfort</li>
            <li>Contactless Online Booking ensures safety and convenience</li>
            <li>Enjoy premium snacks at our Gourmet Food Lounge</li>
            <li>Clean and Hygienic Restrooms maintained regularly</li>
            <li>We provide Wheelchair Accessible Seating for inclusivity</li>
            <li>Experience exclusivity in our VIP Lounge</li>
        </ul>
    </section>

    <section id="contact">
        <h2>Contact Us</h2>
        <p>Phone: +91 9876543210</p>
        <p>Address: 123, Main Street, Chennai, Tamil Nadu, India</p>
		<p>	&copy;All Right Reserved 302025</p>
    </section>

</body>
</html>