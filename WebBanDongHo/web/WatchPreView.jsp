
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
                <a href="WelcomePage.jsp">Home</a> 
                <a href="WelcomePage.jsp">Shop</a>
                <a href="Login.html">Login</a>
                <a href="#">About us</a>

                <form class="navbar-form navbar-right" role="search">
                    <input type="text" placeholder="Search">
                    <button type="submit">search</button>
                </form>

            </div>
        </div>
        <div class="watchesContainer">
            <div class="row">
                <%
                    Watch w = (Watch) request.getAttribute("previewwatch");
                %>
                <div class="redirectwatch">
                    <h5><a href=WelcomePage.jsp>Home</a>/<a href=PreviewWatch?watchid=<%= w.getId() - 1%>><%= w.getName()%></a></h5>
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
                        <button type="submit">Add to cart</button>
                    </div>
                </div>
                <div class="col-md-6 section-right">
                    <img class="itemimg" src="images/<%= w.getName()%>.jpg" width="500" height="500"/>
                </div>
            </div>

        </div>
    </body>
</html>
