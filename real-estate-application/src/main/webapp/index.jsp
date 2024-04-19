<!DOCTYPE html>
<html lang="en">
<head>
    <title>Index</title>
    <style>
        *{
            margin: 0px;
            padding: 0px;
        }
        .navbar{
            position: fixed;
            top: 0;
        }
        .logo{
            width: 100vw;
            display: flex;
            align-items: center;
            justify-content: space-between;
            background-color: black;
        }
        .logo-img{
            margin-left: 10px;
        }
        .buttons{
            display: flex;
            flex-direction: row;
            justify-content: center;
        }
        .buttons a{
            margin: 0px 10px;
            background-color: black;
            padding: 3px 12px;
            border-radius: 5px;
            border:2px solid green;
            text-decoration: none;
            color:aliceblue;
        }

        .buttons a:hover{
            background-color: rgb(96, 249, 126);
            color: black !important;
            cursor: pointer;
        }


    </style>
</head>
<body>
    <div class="navbar">
        <div class="logo">
            <img src="https://www.x-workz.in//static/media/Logo.cf195593dc1b3f921369.png" width="100" height="50" alt="Xworkz" class="logo-img">
            <div class="buttons">
                <a href="userRegister.jsp">Register</a>
                <a href="generateOtp.jsp">Login</a>
            </div>
        </div>
    </div>

</body>
</html>