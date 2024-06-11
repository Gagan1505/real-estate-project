

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        *{
            margin: 0px;
            padding: 0px;
        }
        .navbar{
            width: 100vw;
            background-color: black;
            position: fixed;
            height: 50px;
            top: 0;
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            justify-content: end;
        }
        .logo{
            left: 0;
            position: fixed;
            display: flex;
            align-items: center;
            background-color: black;
        }
        .logo-img{
            margin: 0px 10px;
        }
        .icons{
            display: flex;
            flex-direction: row;
            justify-content: end;
            align-items: center;
            background-color: rgb(0, 0, 0);
            margin-right: 30PX;
            gap: 10px;
            width: 60vw;
        }

        a{
            text-decoration: none;
            color: aliceblue;
        }
        a:hover{
            color: rgb(255, 4, 0);
        }
    </style>
</head>
<body>
    <div class="navbar m-0 p-0">
        <div class="logo">
            <img src="https://www.x-workz.in//static/media/Logo.cf195593dc1b3f921369.png" width="100" height="50" alt="Xworkz" class="logo-img">
        </div>
        <div class="icons">
            <a href="userToUpdate">${user.getUserFirstName()}</a>
            <a href="userToUpdate">update</a>
            <a href="detailsToAddProperty">ADD PROPERTY</a>
            <a href="estateProperties">BID</a>
            <a href="propertiesToSell">SELL PROPERTY</a>
            <a href="bought">BOUGHT</a>
            <a href="sold">SOLD</a>
            <a href="logout">LOGOUT</a>
        </div>
    </div>
    <table class="table mt-5">
        <thead class="thead-dark">
          <tr>
            <th scope="col">Location</th>
            <th scope="col">Bid Amount</th>
            <th scope="col">Bought From</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="sold" items="${soldProps}">
          <tr>
            <td>${sold.getProperty().getPropertyLocation()}</td>
            <td>${sold.getBid().getBidAmount()}</td>
            <td>${sold.getSeller().getUserFirstName()}</td>
          </tr>
          </c:forEach>
        </tbody>
      </table>



</body>
</html>