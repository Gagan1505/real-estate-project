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
            <link rel="stylesheet"
                href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.4.2/css/fontawesome.min.css"
                integrity="sha384-BY+fdrpOd3gfeRvTSMT+VUZmA728cfF9Z2G42xpaRkUGu2i3DyzpTURDo5A6CaLK"
                crossorigin="anonymous">
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

                .c-card {
                    height: 100%;
                    width: 100%;
                    padding: 5px;
                    font-family: Arial, Helvetica, sans-serif;
                    border-top: 1px solid green;
                    border-radius: 10px;
                    box-shadow: rgba(0, 0, 0, 0.25) 0px 0.0625em 0.0625em, rgba(0, 0, 0, 0.25) 0px 0.125em 0.5em, rgba(255, 255, 255, 0.1) 0px 0px 0px 1px inset;
                }

                .c-card-content {
                    width: 100%;
                    height: 100%;
                }

                .c-card-header {
                    font-size: large;
                    font-weight: bold;
                    background-image: url('https://img-in-1.trovit.com/1W1mX131s1d1S1V/1W1mX131s1d1S1V.1_11.jpg');
                    background-color: red;
                    background-size: cover;
                    border-radius: 5px;
                    height: 220px;
                }

                .c-card-header>div {
                    background: rgb(3, 3, 3);
                    background: linear-gradient(0deg, rgba(3, 3, 3, 0) 0%, rgba(255, 255, 255, 1) 100%);
                    height: 40%;
                }

                .c-card-body {
                    font-size: medium;
                }

                .row {
                    align-items: center;
                    margin: 0px 0px;
                }

                img,
                svg {
                    vertical-align: baseline;
                }

                .c-ownr,
                .c-phone,
                .c-loc {
                    font-size: medium;
                }

                .c-card-footer>button {
                    font-weight: bold;
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

            <small>${NOTHING}</small>
            <div class="c-cards" style="width: 100%; margin-top: 50px;height:max-content">
                <marquee behavior="" direction=""><small style="color: red;">These are the properties currently
                        available for sale!!! Please bid your desired amount for desired property</small></marquee>
                <div class="row">
                    <c:forEach var="prop" items="${props}">
                        <div class="col col-md-6 col-lg-4 col-sm-12 p-2" style="height:auto;">
                            <div class="c-card">
                                <div class="c-card-content">
                                    <div class="c-card-header">
                                        <div class="d-flex justify-content-between p-2">
                                            <span>${prop.getPropertyType()}</span>
                                            <span>${prop.getPropertyValue()} INR</span>
                                        </div>
                                    </div>
                                    <div class="c-card-body p-2">
                                        <span class="row mb-1"><span class="col-1"><svg
                                                    xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                    fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
                                                    <path
                                                        d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6" />
                                                </svg></span><span
                                                class="col-10 c-ownr">${prop.getUser().getUserFirstName()}</span></span>
                                        <span class="row mb-1"><span class="col-1"><svg
                                                    xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                    fill="currentColor" class="bi bi-telephone-fill"
                                                    viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd"
                                                        d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.68.68 0 0 0 .178.643l2.457 2.457a.68.68 0 0 0 .644.178l2.189-.547a1.75 1.75 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.6 18.6 0 0 1-7.01-4.42 18.6 18.6 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877z" />
                                                </svg></span><span
                                                class="col-10 c-phone">${prop.getUser().getUserPhoneNumber()}</span></span>
                                        <span class="row"><span class="col-1"><svg xmlns="http://www.w3.org/2000/svg"
                                                    width="16" height="16" fill="currentColor"
                                                    class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
                                                    <path
                                                        d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10m0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6" />
                                                </svg></span><span
                                                class="col-10 c-loc">${prop.getPropertyLocation()}</span></span>

                                    </div>
                                    <div class="c-card-footer d-flex justify-content-center p-2 m-0">
                                        <a href="bidProperty?propertyId=${prop.getPropertyId()}"
                                            class="btn btn-success btn-pill m-0 p-1 w-100 row"><button
                                                class="btn btn-success btn-pill m-0 p-1 w-100 row">BID</button></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </body>

        </html>