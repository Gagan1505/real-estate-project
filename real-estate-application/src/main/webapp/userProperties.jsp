

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

                .logo {
                    left: 0;
                    position: fixed;
                    display: flex;
                    align-items: center;
                    background-color: black;
                }

                .logo-img {
                    margin: 0px 10px;
                }

                .icons {
                    display: flex;
                    flex-direction: row;
                    justify-content: end;
                    align-items: center;
                    background-color: rgb(0, 0, 0);
                    margin-right: 30PX;
                    gap: 10px;
                    width: 60vw;
                }

                a {
                    text-decoration: none;
                    color: aliceblue;
                }

                a:hover {
                    color: rgb(255, 4, 0);

                }

                .c-card {
                    height: 100%;
                    width: 100%;
                    padding: 5px;
                    font-family: Arial, Helvetica, sans-serif;
                    border-top: 3px solid green;
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
            <div class="navbar m-0 p-0">
                <div class="logo">
                    <img src="https://www.x-workz.in//static/media/Logo.cf195593dc1b3f921369.png" width="100"
                        height="50" alt="Xworkz" class="logo-img">
                    <a href="toDashboard">HOME</a>
                </div>
                <div class="icons">
                    <a href="#">${user.getUserFirstName()}<i class="bi bi-person-circle"></i></a>
                </div>
            </div>
            <small>${NOTHING}</small>
            <div class="c-cards" style="width: 100%; margin-top: 50px;height:max-content">
                <div class="row">
                <small>${SellSuccess}</small>
                <c:forEach var="bid" items="${bids}">
                    <div class="col col-md-6 col-lg-4 col-sm-12 p-2" style="height:auto;">
                        <div class="c-card">
                            <div class="c-card-content">
                                <div class="c-card-header">
                                    <div class="d-flex justify-content-between p-2">
                                        <span>${bid.getProperty().getPropertyType()}</span>
                                        <span>${bid.getProperty().getPropertyValue()} INR</span>
                                    </div>
                                </div>
                                <div class="c-card-body p-2">
                                    <span class="row mb-1 border-bottom"><span class="col-5 border-end"><b>Bidder Name</b></span>
                                    <span class="col-5 c-ownr">${bid.getUserBid().getUserFirstName()}</span></span>

                                    <span class="row mb-1 border-bottom"><span class="col-5 border-end"><b>Bid Amount</b></span>
                                    <span class="col-5 c-phone">${bid.getBidAmount()}</span></span>
                                    <span class="row mb-1 border-bottom"><span class="col-5 border-end"><b>Property Location</b></span>
                                    <span class="col-5 c-loc">${bid.getProperty().getPropertyLocation()}</span></span>

                                </div>
                                <div class="c-card-footer d-flex justify-content-center p-2 m-0">
                                    <a href="sellProperty?bidId=${bid.getBidId()}" class="btn btn-success btn-pill m-0 p-1 w-100 row"><button class="btn btn-success btn-pill m-0 p-1 w-100 row">SELL</button></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
            </div>





        </body>

        </html>