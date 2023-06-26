
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
        <link href="css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="row1">
            <div class="collapse navbar-collapse" id="navbar">
                <ul>
                    <li><a href="WelcomePage.jsp">Home</a></li>
                    <li><a href="WelcomePage.jsp">Shop</a></li>
                        <%
                            Account acc = (Account) session.getAttribute("user");
                            if (acc == null) {
                        %>
                    <li><a href="Login.jsp">Login</a></li>
                    <li><a href="Register.jsp">Register</a></li>
                        <%} else {
                        %>
                    <li><p>Welcome <%= acc.getUsername()%></p></li>
                    <li><a href="LogOutServlet">Log out</a></li>
                    <li><a href="ViewOrders.jsp">View Orders</a></li>
                        <%
                            }
                        %>
                    <li><a href="about.jsp">About us</a></li>
                </ul>


                <form class="navbar-form navbar-right" role="search">
                    <input type="text" placeholder="Search">
                </form>

            </div>
        </div>
        <div class="watchesContainer">
            <div class="row2">
                <%
                    Watch w = (Watch) request.getAttribute("previewwatch");
                %>
                <div class="redirectwatch">
                    <h5><a href=WelcomePage.jsp>Home</a>/<a href=PreviewWatch?watchid=<%= w.getWatchId() - 1%>><%= w.getName()%></a></h5>
                </div>
                <div class="col-md-6 section-left">   
                    <h3><%= w.getName()%></h3>
                    <div class="itemsku">
                        <p>Sku: <%= w.getSku()%>  </p>
                    </div>
                    <div class="itemprice">
                        <p>Price: $<%= w.getPrice()%></p>
                    </div>
                    <div class="itemquantity">
                        <p>Quantity</p>
                        <input type="number" pattern="[0-9]*" data-hook="number-input-spinner-input" value="1" aria-label="Quantity" max="50" min="1"><br>
                    </div>
                    <div class="addtocart">
                        <form action="AddToCartServlet" method="GET">
                            <button type="submit">Add to cart</button>
                        </form>
                    </div>
                </div>
                <div class="col-md-6 section-right">
                    <img class="itemimg" src="images/<%= w.getName()%>.jpg" width="500" height="500"/>
                </div>
            </div>

        </div>
    </body>
</html>
