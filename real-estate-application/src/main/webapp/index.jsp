<!DOCTYPE html>
<html lang="en">

<head>
    <title>Index</title>
    <style>
        * {
            margin: 0px;
            padding: 0px;
        }

        .navbar {
            position: fixed;
            top: 0;
            border-bottom: 1px solid rgb(143, 143, 143);
            box-shadow: rgb(115, 129, 143) 0px 20px 30px -10px;
            font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
        }

        .logo {
            width: 100vw;
            display: flex;
            align-items: center;
            justify-content: space-between;
            background-color: rgb(255, 255, 255);
        }

        .logo-img {
            margin: 5px 10px;
        }

        .buttons {
            display: flex;
            flex-direction: row;
            justify-content: center;
        }

        .buttons a {
            margin: 10px 5px;
            background-color: rgb(255, 255, 255);
            padding: 3px 12px;
            border-right: 1px solid rgb(133, 133, 133);
            text-decoration: none;
            color: black;
        }

        .buttons a:hover {
            cursor: pointer;
            font-weight: bolder;
        }

        .main {
            margin-top: 100px;
            text-align: center;
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
        }

        .homeContent {
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
        }

        .content {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background-color: rgb(255, 255, 255);
            padding: 20px 50px;
            text-align: center;
            height: 400px;
            width: 250px;
            box-shadow: rgba(50, 50, 93, 0.25) 0px 13px 27px -5px, rgba(0, 0, 0, 0.3) 0px 8px 16px -8px;
        }

        .imge {
            height: 200px;
            width: 100%;
        }

        .text {
            padding: 10px;
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
        }

        .text p,
        h2 {
            padding: 10px;
        }

        .homeContent a {
            text-decoration: none;
            color: black;
        }

        .homeContent a:hover {
            border: 1px solid rgb(200, 199, 199);
            box-shadow: rgba(0, 0, 0, 0.25) 0px 25px 50px -12px;
        }

        footer {
            background-color: rgba(18, 80, 151, 0.938);
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
            gap: 100px;
        }

        .contact {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 10px;
            margin: 10px;
            color: aliceblue;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
</head>

<body>
    <div class="navbar">
        <div class="logo">
            <img src="https://www.x-workz.in//static/media/Logo.cf195593dc1b3f921369.png" width="100" height="50"
                alt="Xworkz" class="logo-img">
            <div class="buttons">
                <a href="userRegister.jsp">Sign up</a>
                <a href="generateOtp.jsp">Sign in</a>
            </div>
        </div>
    </div>

    <div class="main">
        <h2>What you can do?</h2>
        <div class="homeContent">
            <a href="generateOtp.jsp">
                <div class="content">
                    <div class="imge"
                        style="background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhc3ZlXb5RlV37KRsneBadV2Y0IKMZyP-8YkfXYXLBh9yWkpgXOXS7ME1K35CUsFPCBwA&usqp=CAU');background-size: cover;background-repeat: no-repeat;">
                    </div>
                    <div class="text">
                        <h2>Add New Property</h2>
                        <small>Create a concise description highlighting location, size, features, amenities, and any
                            unique selling points for the new property.</small>
                    </div>
                </div>
            </a>
            <a href="generateOtp.jsp">
                <div class="content">

                    <div class="imge"
                        style="background-image: url('https://www.lakesidetitle.com/wp-content/uploads/2021/11/house-for-sale-gca1b44b4f_1920.jpg');background-size: cover;background-repeat: no-repeat;">
                    </div>
                    <div class="text">
                        <h2>Buy a Property</h2>
                        <small>Seeking versatile property? Explore our listings for diverse options, from residential
                            homes to commercial spaces. Your perfect investment awaits!</small>
                    </div>
                </div>
            </a>
            <a href="generateOtp.jsp">
                <div class="content">
                    <div class="imge"
                        style="background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdoO8m83IbenjgLFNCcwKcL3-M_YWExo50ccMNf9RNrA&s');background-size: cover;background-repeat: no-repeat;">
                    </div>
                    <div class="text">
                        <h2>Sell a property</h2>
                        <small>Stunning property, prime location, spacious interiors, modern amenities, breathtaking
                            views, ideal for families or investors. Schedule your viewing today!</small>
                    </div>
                </div>
            </a>

        </div>
    </div>

    <footer>
        <div class="contact">
            <h3><u>By : Gagan A</u></h3><br>
            <p>Developer in : XWorkz</p><br>
            <p>Guided by : Vinoda P</p>
        </div>
        <div class="contact">
            <p id="timer"></p>
        </div>
        <div class="contact">
            <h3><u>Contact</u></h3><br>
            <p>Phone : 9353840435</p><br>
            <p><i class="fa-brands fa-whatsapp"></i><span> : 9353840435</span></p><br>
            <p><a href="www.linkedin.com/in/gagan-anand-" style="color: aliceblue;"><i
                        class="fa-brands fa-linkedin-in"></i></a></p>
        </div>
    </footer>

    <script>
        function updateClock() {
            // Get the current date and time
            var now = new Date();

            // Extract hours, minutes, and seconds
            var hours = now.getHours();
            var minutes = now.getMinutes();
            var seconds = now.getSeconds();

            // Format time components to add leading zeros if necessary
            hours = hours < 10 ? '0' + hours : hours;
            minutes = minutes < 10 ? '0' + minutes : minutes;
            seconds = seconds < 10 ? '0' + seconds : seconds;

            // Construct the time string
            var timeString = hours + ':' + minutes + ':' + seconds;

            // Get the current date
            var currentDate = now.toDateString();

            // Update the HTML content of the timer div
            document.getElementById('timer').innerHTML = timeString + ' | ' + currentDate;
        }

        // Call the function once to initially display the time
        updateClock();

        // Update the clock every second
        setInterval(updateClock, 1000);

    </script>

</body>
</html>