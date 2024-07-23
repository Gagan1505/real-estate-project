<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>New Property</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                crossorigin="anonymous">
            <style>
                * {
                    margin: 0px;
                    padding: 0px;
                }

                body {
                    display: flex;
                    flex-direction: column;
                    justify-content: center;
                    align-items: center;
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

                .buttons a,
                .buttons h4 {
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

                form {
                    margin-top: 120px;
                    width: 50vw;
                    border: 1px solid green;
                    padding: 20px;
                    border-radius: 10px;
                    box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;
                }

                .row {
                    margin: 0 0 30px 0;
                }

                .form input[type="submit"][disabled] {
                    cursor: crosshair;
                }

                input::-webkit-outer-spin-button,
                input::-webkit-inner-spin-button {
                    -webkit-appearance: none;
                    margin: 0;
                }
            </style>
        </head>

        <body>
            <div class="navbar">
                <div class="logo">
                    <img src="https://www.x-workz.in//static/media/Logo.cf195593dc1b3f921369.png" width="100"
                        height="50" alt="Xworkz" class="logo-img">
                    <div class="buttons">
                        <h4>Hello User</h4>
                        <a href="toDashboard">Home</a>
                    </div>
                </div>
            </div>
            <form action="bid" method="POST">
                <div class="row">
                    <div class-"col">
                        <span>${success}</span>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <input type="number" class="form-control" placeholder="Enter your value for the property"
                            name="bidAmount" id="bidAmount">
                        <span id="bidErr" class="msg"></span>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <input type="submit" class="form-control btn btn-success" id="bid" value="Bid Property">
                    </div>
                    <div class="col">
                        <input type="button" class="form-control btn btn-success" id="clear" onclick="reload()"
                            value="Clear">
                    </div>
                </div>
            </form>
            <script>
                function reload() {
                    window.location.reload();
                }
            </script>

        </body>

        </html>