

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
            <a href="toDashboard?id=${user.getUserId()}"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-house" viewBox="0 0 16 16">
                 <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V8.207l.646.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293zM13 7.207V13.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V7.207l5-5z"/>
            </svg></a>
        </div>
    </div>
    <form action="sell" method="POST">
        <c:forEach var="propertyErr" items="${propertyErrors}">
            <span>${propertyErr}</span>
        </c:forEach>
        <div class="row">
              <div class="col">
                <select class="form-select form-select-sm" aria-label=".form-select-sm example" name="propertyType">
                    <option value="Shop" selected>Shop</option>
                    <option value="Empty Site">Empty Site</option>
                    <option value="Working space">Working space</option>
                </select>
              </div>
        </div>
        <div class="row">
                    <div class="col">
                      <input type="number" class="form-control" placeholder="user id is" name="id" id="userId" value="${user.getUserId()}"style="display:none">
                      <span></span>
                    </div>
        </div>
        <div class="row">
            <div class="col">
              <input type="text" class="form-control" placeholder="Enter the dimensions of the property" name="dimensions" id="dimensions" required>
              <span></span>
            </div>
        </div>
        <div class="row">
            <div class="col">
              <input type="number" class="form-control" placeholder="Enter the base value for the property in INR" name="propertyValue" id="propertyValue" >
              <span id="emailErr" class="msg"></span>
        </div>
        <div class="row">
            <div class="col">
                <input type="text" class="form-control" placeholder="Enter exact location of the property" name="propertyLocation" id="propertyLocation" >
                <span id="emailErr" class="msg"></span>
            </div>
        </div>
        <div class="row">
            <div class="col">
              <input type="submit" class="form-control btn btn-success" id="register" value="Add Property">
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