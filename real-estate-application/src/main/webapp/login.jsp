<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                    box-shadow: rgba(50, 50, 93, 0.25) 0px 30px 60px -12px inset, rgba(94, 93, 93, 0.3) 0px 18px 36px -18px inset;
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
                integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
                crossorigin="anonymous">
        </head>

        <body>

            <div class="navbar m-0 p-0">
                <div class="logo">
                    <img src="https://www.x-workz.in//static/media/Logo.cf195593dc1b3f921369.png" width="100"
                        height="50" alt="Xworkz" class="logo-img">
                    <div class="buttons">
                        <a href="userRegister.jsp">Sign up</a>
                    </div>
                </div>
            </div>
            <div class="content">

                <form action="user-Login" method="POST">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Email address</label>
                        <input type="email" class="form-control row-lg-12 row-md-6 row-sm-6" id="exampleInputEmail1"
                            aria-describedby="emailHelp" placeholder="Enter email" name="userEmailId"
                            onchange="verifyEmail()" value="${user.getUserEmailId()}">
                    </div>
                    <!-- <div><small id="loginError" class="form-group text-muted">${msg}</small></div> -->
                    <div><small id="otpHelp" class="form-group text-muted"></small></div>
                    <div class="form-group">
                        <label for="enteredOtp">OTP</label>
                        <input type="text" class="form-control" id="enteredOtp" name="enteredOtp"
                            placeholder="Enter otp here">
                        <div id="timer" style="display: none;">10:00</div><br>
                        <button type="submit" class="btn btn-primary" id="login">Sign in</button><br>
                        <span><a href="userRegister.jsp">Not have an account?Create One</a></span><br>
                    </div>
                </form>
            </div>


            <script>
                var loginButton = document.getElementById("login");
                var otpSentCount = 0;
                var otpInput = document.getElementById("enteredOtp");
                var email = document.getElementById("exampleInputEmail1");
                var display = document.getElementById('timer');
                var tmir;
                var msg = document.getElementById("loginError");

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
                        console.log(minutes, seconds);

                        if (--timer < 0) {
                            timer = 0;
                        }
                        if (minutes == 0 && seconds == 0) {
                            console.log("timer done");
                            display.style.display = "none";
                            clearInterval(tmir);
                        }
                    }, 1000);
                }
                var oneMinute = 600;
                startCountdown(oneMinute, display);

            </script>
        </body>

        </html>