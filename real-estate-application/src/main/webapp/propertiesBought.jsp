<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Document</title>
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

                .desc {
                    margin-top: 100px;
                    width: 60vw;
                    background-color: rgb(166, 247, 220);
                    color: green;
                    font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
                    font-weight: bold;
                    justify-content: center;
                }

                .table {
                    margin-top: 50px;
                    width: fit-content;

                }

                .table th {
                    color: rgb(1, 94, 125);
                    padding: 10px;
                }

                .table td {
                    padding: 10px;
                    color: rgb(0, 0, 0);
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

            <div class="desc">
                <marquee behavior="" direction="">Properties bought by you!!</marquee>
            </div>

            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Location</th>
                        <th scope="col">Bid Amount</th>
                        <th scope="col">Bought From</th>
                        <th scope="col">Bought On</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="buyed" items="${buyedProps}">
                        <tr>
                            <td>${buyed.getProperty().getPropertyLocation()}</td>
                            <td>${buyed.getBid().getBidAmount()}</td>
                            <td>${buyed.getSeller().getUserFirstName()}</td>
                            <td>${buyed.getBoughtOrSoldOn()}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>



        </body>

        </html>