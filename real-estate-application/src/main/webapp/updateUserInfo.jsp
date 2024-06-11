

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">    <style>
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
                     color: aliceblue;
        }

        .buttons a:hover{
            background-color: rgb(96, 249, 126);
            color: black !important;
            cursor: pointer;
            text-decoration: none;
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
        .msg{
            font-size: small;
            color: red;
            font-family: sans-serif;
        }

        .errorMsg{
            margin-top=20vh;
            color: red;
        }
    </style>

</head>
<body>
    <div class="navbar m-0 p-0">
        <div class="logo">
            <img src="https://www.x-workz.in//static/media/Logo.cf195593dc1b3f921369.png" width="100" height="50" alt="Xworkz" class="logo-img">
            <a href="toDashboard"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-house" viewBox="0 0 16 16">
                <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V8.207l.646.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293zM13 7.207V13.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V7.207l5-5z"/>
              </svg>HOME
            </a>
        </div>
    </div>

    <div class="form">
        <form action="updateUser" method="POST" style="margin-top:120px; width: 60vw;border: 1px solid green;padding: 20px;border-radius: 10px;box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;">
            <c:forEach var="objectError" items="${errors}" >
                 <small class="errorMsg">${objectError.getDefaultMessage()}</small><br>
            </c:forEach>
            <small class="errorMsg">${updateSuccessMsg}</small><br>
            <div class="row">
              <div class="col">
                <input type="text" class="form-control" placeholder="User First name" name="userFirstName" id="userFirstName" value="${user.getUserFirstName()}" required>
                <span></span>
              </div>
              <div class="col">
                <input type="text" class="form-control" placeholder="Last Name" name="userLastName" id="userLastName" value="${user.getUserLastName()}" required>
                <span></span>
              </div>
            </div>
            <div class="row">
                <div class="col">
                  <input type="text" class="form-control" placeholder="Email Id" name="userEmailId" id="userEmailId" onchange="verifyEmail()" value="${user.getUserEmailId()}" >
                  <span id="emailErr" class="msg"></span>
                </div>
                <div class="col">
                  <input type="number" class="form-control" placeholder="Phone number" name="userPhoneNumber" id="userPhoneNumber" maxlength="10" oninput="limitDigits(this,10)" onchange="verifyPhone()" value="${user.getUserPhoneNumber()}">
                  <span id="phoneError"  class="msg"></span>
                </div>
            </div>
            <div class="row">
                <div class="col">
                  <input type="number" class="form-control" placeholder="Adhaar number" name="userAdhaar" id="userAdhaar" maxlength="12" oninput="limitDigits(this,12)" onchange="verifyAdhaar()" value="${user.getUserAdhaar()}">
                  <span id="adhaarError"  class="msg"></span>
                </div>
                <div class="col">
                  <input type="text" class="form-control" placeholder="PAN number" name="userPanCard" id="userPanCard" maxlength="10" onchange="verifyPanCard()" value="${user.getUserPanCard()}">
                  <span id="panError"  class="msg"></span>
                </div>
            </div>
            <div class="row">
                <div class="col">
                  <input type="text" class="form-control" placeholder="Current Address" name="userCurrentAddress" id="userCurrentAddress" onchange="verifyCurrentAddress(this)" value="${user.getUserCurrentAddress()}">
                  <span id="currentErr" class="msg"></span>
                </div>
                <div class="col">
                  <input type="text" class="form-control" placeholder="Permanent Address" name="userPermanentAddress" id="userPermanentAddress" onchange="verifyPermanentAddress(this)" value="${user.getUserPermanentAddress()}">
                  <span id="permanentErr" class="msg"></span>
                </div>
            </div>
            <div class="row">
                <div class="col">
                  <input type="submit" class="form-control btn btn-success" id="update" value="Update" >
                </div>
                <div class="col">
                  <input type="button" class="form-control btn btn-success" id="clear" onclick="reload()" value="Clear">
                </div>
            </div>
        </form>
    </div>

    <script>

        function limitDigits(number,limit){
            let inputValue = number.value;
            let sanitizedValue = inputValue.replace(/\D/g, '');
            if (sanitizedValue.length > 10) {
                sanitizedValue = sanitizedValue.slice(0, limit);
            }
            number.value = sanitizedValue;
        }

        var valid = {};
        function enableRegister(key,value){
            if(key || value){
                if(valid[key]){
                    valid[key] = value;
                }else{
                    valid[key] = value;
                }

                console.log(key,value);
                var enableButton = true;
                for(k in valid){
                    enableButton = enableButton && valid[k];
                }
                if(enableButton && Object.keys(valid).length == 5){
                    document.getElementById("register").disabled=false;
                }else{
                    document.getElementById("register").disabled=true;
                }
            }else{
                return valid;
            }
        }

        var registerButton = document.getElementById("update");
        function verifyEmail(){
            registerButton.disabled = true;
            var email = document.getElementById("userEmailId");
            var emailError = document.getElementById("emailErr");
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

            if(emailRegex.test(email.value)){
                emailError.innerHTML = "";
                let req = new XMLHttpRequest();
                req.open("GET","http://localhost:8080/real-estate-application/getEmail/"+email.value);
                req.send();
                console.log(req);
                req.onload = function() {
                    emailError.innerHTML = this.responseText;
                    console.log(this.responseText);
                    if(this.responseText == "Already exist"){
                        enableRegister("email",false);
                    }
                    else{
                        enableRegister("email",true);
                    }
                }
            }else{
                emailError.innerHTML = "invalid email pattern";
                enableRegister("email",false);
            }
        }

        function verifyPhone(){
            var phone = document.getElementById("userPhoneNumber");
            let phoneErr = document.getElementById("phoneError");
            console.log(phone.value);
            const phoneNumberRegex = /^[6-9]\d{9}$/;
            if(phoneNumberRegex.test(phone.value)){
                phoneErr.innerHTML = "";
                let req = new XMLHttpRequest();
                req.open("GET","http://localhost:8080/real-estate-application/getPhone/"+phone.value);
                req.send();
                console.log(req);
                req.onload = function() {
                    console.log(this.responseText);
                    var phoneErr = document.getElementById("phoneError");
                    phoneErr.innerHTML = this.responseText;
                    if(this.responseText == "Already exist"){
                        enableRegister("phone",false);
                    }
                    else{
                        enableRegister("phone",true);
                    }
                }
            }else{
                phoneErr.innerHTML = "invalid phone number";
                enableRegister("phone",false);
            }
        }

        function verifyAdhaar(){
            var adhaar = document.getElementById("userAdhaar");
            let adhaarErr = document.getElementById("adhaarError");
            console.log(adhaar.value);
            if(adhaar.value.length<12){
                adhaarErr.innerHTML = "invalid adhaar number";
            }else{
                adhaarErr.innerHTML = "";
                let req = new XMLHttpRequest();
                req.open("GET","http://localhost:8080/real-estate-application/getAdhaar/"+adhaar.value);
                req.send();
                req.onload = function() {
                    console.log(this.responseText);
                    var adhaarErr = document.getElementById("adhaarError");
                    adhaarErr.innerHTML = this.responseText;
                    if(this.responseText == "Already exist"){
                        enableRegister("adhaar",false);
                    }else{
                        enableRegister("adhaar",true);
                    }
                }
            }

        }

        function verifyPanCard(){
            var pan = document.getElementById("userPanCard");
            let panError = document.getElementById("panError");
            const panRegex = /^([A-Z]){5}([0-9]){4}([A-Z]){1}$/;
            if(panRegex.test(pan.value)){
                panError.innerHTML = "";
                let req = new XMLHttpRequest();
                req.open("GET","http://localhost:8080/real-estate-application/getPan/"+pan.value);
                req.send();
                req.onload = function() {
                    document.getElementById("panError").innerHTML = this.responseText;
                    if(this.responseText == "Already exist"){
                        enableRegister("pan",false);
                    }else{
                        enableRegister("pan",true);
                    }
                }
            }else{
                panError.innerHTML = "invalid pan number";
                enableRegister("pan",false);
            }
        }

        function verifyCurrentAddress(rt){
            let current = document.getElementById("currentErr");
            if(rt.value == ""){
                current.innerHTML = "Address cannot be empty";
                enableRegister("current",false);
            }else{
                current.innerHTML = "";
                enableRegister("current",true);
            }
        }

        function verifyPermanentAddress(val){
            let permanent = document.getElementById("permanentErr");
            if(val.value == ""){
                permanent.innerHTML = "Address cannot be empty";
                enableRegister("permanent",false);
            }else{
                permanent.innerHTML = "";
                enableRegister("permanent",true);
            }
        }

        function reload(){
            window.location.reload();
        }
    </script>
</body>
</html>