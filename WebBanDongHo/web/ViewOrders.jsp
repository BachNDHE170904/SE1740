
<%@page import="model.Order"%>
<%@page import="model.Account"%>
<%@page import="model.Watch"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAL.WatchDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Orders Page</title>
        <link rel="stylesheet" href="css/ViewOrdersStyleindex.css">
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
                    ArrayList<Order> orders = (ArrayList<Order>) session.getAttribute("orders");
                %>
                <div class="col-md-6 section-left">   
                    <%
                        if (orders != null) {
                            float total = 0;
                            for (Order order : orders) {
                                Watch w = order.getWatch();
                                total += order.getQuantity() * w.getPrice();
                    %>
                    <h3><%= w.getName()%></h3>
                    <div class="itemprice">
                        <p>Price: $<%= w.getPrice()%></p>
                    </div>
                    <div class="itemquantity">
                        <p>Quantity: </p> $<%= order.getQuantity()%>
                    </div>
                    <%
                        }
                    %>
                    <div class="totalPrice">
                        <p>Total: <%= total %></p>
                    </div>
                    <%
                        }
                    %>
                </div>
                <div class="col-md-6 section-right">

                </div>
            </div>
    </body>
</html>
