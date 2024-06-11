<html>

<head>
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
            text-decoration: none;
            color: black;
        }


        form {
            width: 50vw;
            padding: 20px;
            border: 0.5px solid black;
            border-radius: 10px;
            box-shadow: rgba(0, 0, 0, 0.09) 0px 2px 1px, rgba(0, 0, 0, 0.09) 0px 4px 2px, rgba(0, 0, 0, 0.09) 0px 8px 4px, rgba(0, 0, 0, 0.09) 0px 16px 8px, rgba(0, 0, 0, 0.09) 0px 32px 16px;
        }

        .content {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 10px;
        }

        .form-text text-muted {
            color: red;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .form-group input {
            text-align: center;
            width: 70%;
        }
    </style>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
        integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>

<body>

    <div class="navbar m-0 p-0">
        <div class="logo">
            <img src="https://www.x-workz.in//static/media/Logo.cf195593dc1b3f921369.png" width="100" height="50"
                alt="Xworkz" class="logo-img">
            <div class="buttons">
                <a href="userRegister.jsp">Sign up</a>
            </div>
        </div>
    </div>
    <div class="content">
        <form action="generate-Otp" method="POST">
            <div class="form-group">
                <label for="exampleInputEmail1">Email address</label>
                <input type="email" class="form-control row-lg-6 row-md-6 row-sm-6" id="exampleInputEmail1"
                    aria-describedby="emailHelp" placeholder="Enter email" name="userEmailId" onchange="verifyEmail()">
                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone
                    else.</small><br>
                <small id="otpHelp">${msg}</small><br>
                <button type="submit" class="btn btn-primary" id="otpButton" disabled>Generate OTP</button><br>
                <span><a href="userRegister.jsp">Not have an account?Create One</a></span><br>
            </div>
        </form>
    </div>

    <script>

        var otp = document.getElementById("otpButton");
        var email = document.getElementById("exampleInputEmail1");
        var display = document.getElementById('timer');
        var tmir;
        var msg = document.getElementById("otpHelp");

        function startCountdown(duration, display) {
            var timer = duration, minutes, seconds;
            console.log(timer);
            display.style.display = "unset";
            tmir = setInterval(function () {
                minutes = parseInt(timer / 60, 10);
                seconds = parseInt(timer % 60, 10);

                minutes = minutes < 10 ? "0" + minutes : minutes;
                seconds = seconds < 10 ? "0" + seconds : seconds;

                display.textContent = "Otp expires in " + minutes + ":" + seconds;
                otp.disabled = true;
                console.log(minutes, seconds);

                if (--timer < 0) {
                    timer = 0;
                }
                if (minutes == 0 && seconds == 0) {
                    console.log("timer done");
                    otp.innerHTML = "Resend otp";
                    display.style.display = "none";
                    otp.disabled = false;
                    clearInterval(tmir);

                }
            }, 1000);
        }
        if (msg.innerText) {
            // alert(msg.innerText);
        }


        function verifyEmail() {
            document.getElementById("otpHelp").style.display = "none";
            var emailError = document.getElementById("emailHelp");
            msg.innerText = "";
            let req = new XMLHttpRequest();
            req.open("GET", "http://localhost:8080/real-estate-application/verifyUserToGenerateOtp/" + email.value);
            req.send();
            console.log(req);
            req.onload = function () {
                console.log(this.responseText);
                if (this.responseText == "Present and Active") {
                    emailError.innerHTML = "";
                    otp.disabled = false;
                } else if (this.responseText == "Present and inactive") {
                    emailError.innerHTML = "User is blocked for an hour";
                    otp.disabled = true;
                } else {
                    emailError.innerHTML = "Email not present! please register";
                    otp.disabled = true;
                }
            }
        }

    </script>
</body>

</html>