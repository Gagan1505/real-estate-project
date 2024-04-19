

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
            <a href="userFromDashboard?id=${user.getUserId()}"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-house" viewBox="0 0 16 16">
                                                                 <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V8.207l.646.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293zM13 7.207V13.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V7.207l5-5z"/>
                                                               </svg></a>
        </div>
        <div class="icons">
              <a href=""><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
                <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1"/>
              </svg>
            </a>
            <a href="detailsToAddProperty?id=${user.getUserId()}">SELL</a>
            <a href="estateProperties?id=${user.getUserId()}">BID</a>

        </div>
        <span>${success}</span>
    </div>

</body>
</html>