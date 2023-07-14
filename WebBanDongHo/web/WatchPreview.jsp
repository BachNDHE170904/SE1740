<%@page import="model.WatchSpecs"%>
<%@page import="model.Account"%>
<%@page import="model.Watch"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAL.WatchDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Preview Page</title>
        <link rel="stylesheet" href="css/PreviewStyleindex.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    </head>
    <body>
        <div class="hero-image">
            <nav class="navbar navbar-expand-lg bg-body-tertiary">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">Watch shop</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="WelcomePage.jsp">Home</a>
                            </li>
                            <%
                                //check if the user is logged in or not
                                Account acc = (Account) session.getAttribute("user");
                                if (acc != null) {
                            %>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <%= acc.getUsername()%>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="ViewOrders.jsp">View Orders</a></li>
                                    <li><a class="dropdown-item" href="ViewOrdersHistory.jsp">View My Order History</a></li>
                                        <% if (acc.getRole().equalsIgnoreCase("Administrator")) { %>
                                    <li><a class="dropdown-item" href="AddItem.jsp">Add New Item</a></li>
                                        <%}%>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="LogOutServlet">Log Out</a></li>
                                </ul>
                            </li>
                            <%} else {
                            %>
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="Login.jsp">Login</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="Register.jsp">Register</a>
                            </li>
                            <%
                                }
                            %>
                        </ul>
                        <form class="navbar-form navbar-right" action="SearchServlet" method="GET" role="search">
                            <input name="searchResult" type="text" placeholder="Search">
                        </form>
                    </div>
                </div>
            </nav>
        </div>
        <div class="container">
            <form action="AddToCartServlet?method="GET">
                <%
                    // Retrieving the watch and its specifications from the request attributes
                    Watch w = (Watch) request.getAttribute("previewwatch");
                    session.setAttribute("previewwatch", w);
                    WatchSpecs ws = (WatchSpecs) request.getAttribute("previewwatchspec");
                %>
                <div class="d-flex justify-content-between">
                    <div class="redirectwatch">
                        <h5><a href="WelcomePage.jsp">Home</a>/<a href="PreviewWatch?watchid=<%= w.getWatchId() - 1%>"><%= w.getName()%></a></h5>
                    </div>
                    <% if (acc!=null&&acc.getRole().equalsIgnoreCase("Administrator")) {%>
                    <div class="del-update-watch">
                        <div class="update-watch">
                            <a href="UpdateItemServlet?watchid=<%= w.getWatchId()-1%>">Update watch</a>
                        </div>
                        <div class="del-watch">
                            <a href="DeleteItemServlet?watchid=<%= w.getWatchId()%>">Delete watch</a>
                        </div>
                    </div>
                    <%}%>
                </div>
                <div class="row">
                    <div class="col-6 section-left">   
                        <h3><%= w.getName()%></h3>
                        <div class="itemsku">
                            <p>Sku: <%= w.getSku()%>  </p>
                        </div>
                        <div class="itemprice">
                            <p>Price: $<%= w.getPrice()%></p>
                        </div>
                        <div class="itemquantity">
                            <p>Quantity</p>
                            <input type="number" pattern="[0-9]*" data-hook="number-input-spinner-input" value="1" aria-label="Quantity" max="50" min="1" name="quantity"><br>
                        </div>
                        <div class="watch-specs">
                            <h4>Watch Specs</h4>
                            <p>BEZEL - <%= ws.getBezel()%></p>
                            <p>MOVEMENT - <%= ws.getMovement()%></p>
                            <p>DIAL - <%= ws.getMovement()%></p>
                            <p>CASE - <%= ws.getWatchCase()%></p>
                            <p>GLASS - <%= ws.getGlass()%></p>
                            <p>STRAP - <%= ws.getStrap()%></p>
                        </div>
                        <div class="addtocart">
                            <button class="btn btn-primary" type="submit">Add to cart</button>
                        </div>
                    </div>
                    <div class="col-6 section-right">
                        <img class="itemimg" src="images/<%= w.getName()%>.jpg" width="500" height="500"/>
                    </div>
            </form>
        </div>

    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>
