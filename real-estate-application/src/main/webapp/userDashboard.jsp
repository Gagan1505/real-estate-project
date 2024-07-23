

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
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

        .main {
            justify-content: center;
            margin-top: 80px;
            display: flex;
            flex-direction: row;
            height: 500px;
        }

        .operations {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px 0px 0px 0px;
            height: 100%;
            width: 20%;
            border-right: solid 1px black;
        }

        .buttons1 {
            display: flex;
            flex-direction: column;
            justify-content: center;
            margin-top: 0px;
        }

        .buttons1 a {
            margin: 10px 5px;
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
            text-decoration: none;
            color: black;
        }

        .buttons1 a:hover {
            cursor: pointer;
            font-weight: bolder;
        }

        .contents {
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
            width: 100%;

        }

        .img {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            width: 40%;
            height: 60%;
        }

        .img img {
            width: 240px;
            height: 80%;
            border-radius: 50%;

        }

        .info {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            width: 50%;
            padding: 5px;
        }

        tr {
            margin-top: 10px;
        }

        td,
        th {
            margin: 90px;
            width: 100%;
            font-family: monospace;
            padding: 10px;
            border-bottom: 1px solid green;

        }
    </style>
</head>

<body>
    <div class="navbar">
        <div class="logo">
            <img src="https://www.x-workz.in//static/media/Logo.cf195593dc1b3f921369.png" width="100" height="50"
                alt="Xworkz" class="logo-img">
            <div class="buttons">
                <h4>Hello User</h4>
                <a href="logout">Log Out</a>
            </div>
        </div>
    </div>

    <div class="main">
        <div class="operations">
            <div>
                <h4 style="color: rgb(6, 103, 249);"><b>DASHBOARD</b></h4>
            </div>
            <div class="buttons1">
                <a href="detailsToAddProperty">ADD PROPERTY</a>
                <a href="propertiesToSell">SELL PROPERTY</a>
                <a href="estateProperties">BID PROPERTY</a>
                <a href="bought">PROPERTIES BUYED</a>
                <a href="sold">PROPERTIES SOLD</a>
                <a href="userToUpdate">UPDATE DETAILS</a>
            </div>
        </div>
        <div class="contents">
            <div class="img">
                <img src="https://cdn-icons-png.flaticon.com/512/9131/9131529.png" alt="">
            </div>
            <div class="info">
                <table>
                    <tr>
                        <th>Name</th>
                        <td>${user.getUserFirstName()}</td>
                    </tr>
                    <tr>
                        <th>Email</th>
                        <td>${user.getUserEmailId()}</td>
                    </tr>
                    <tr>
                        <th>Phone</th>
                        <td>${user.getUserPhoneNumber()}</td>
                    </tr>
                    <tr>
                        <th>Current <br> Address</th>
                        <td>${user.getUserCurrentAddress()}</td>
                    </tr>
                    <tr>
                        <th>Permanent <br> Address</th>
                        <td>${user.getUserPermanentAddress()}</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>


</body>

</html>