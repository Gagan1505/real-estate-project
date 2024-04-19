

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Property</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        *{
            margin: 0px;
            padding: 0px;
        }
        body{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
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
            margin: 0px 10px;
        }
        a:hover{
            color: rgb(255, 4, 0);
        }
        form{
            margin-top:120px; width: 50vw;border: 1px solid green;padding: 20px;border-radius: 10px;box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;
        }
        .form{
            display: flex;
            flex-direction: row;
            justify-content: center;
            width: 100vw;
        }
        .row{
            margin: 0 0 30px 0;
        }
        .form input[type="submit"][disabled]{
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
    <div class="navbar m-0 p-0">
        <div class="logo">
            <img src="https://www.x-workz.in//static/media/Logo.cf195593dc1b3f921369.png" width="100" height="50" alt="Xworkz" class="logo-img">
            <a href="userDashboard.jsp">HOME</a>
        </div>
        <div class="icons">
            <a href=""><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
                <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1"/>
              </svg>
            </a>
        </div>
    </div>
    <form action="bid" method="POST">
        <div class="row">
            <div class="col">
                <input type="number" class="form-control" placeholder="Enter your value for the property" name="bidAmount" id="bidAmount" >
                <span id="bidErr" class="msg"></span>
            </div>
        </div>
        <div class="row">
            <div class="col">
              <input type="submit" class="form-control btn btn-success" id="bid" value="Bid Property">
            </div>
            <div class="col">
              <input type="button" class="form-control btn btn-success" id="clear" onclick="reload()" value="Clear">
            </div>
        </div>
    </form>
<script>
        function reload(){
            window.location.reload();
        }
</script>

</body>
</html>