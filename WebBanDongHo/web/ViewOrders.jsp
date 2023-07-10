<%@page import="DAL.OrderDAO"%>
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
                </ul>

                <!-- Search form -->
                <form class="navbar-form navbar-right" action="SearchServlet" method="GET" role="search">
                    <input name="searchResult" type="text" placeholder="Search">
                </form>

            </div>
        </div>
        <div class="watchesContainer">
            <div class="row2">
                <%
                    // Retrieving orders from the database for the logged-in user
                    OrderDAO db = new OrderDAO();
                    ArrayList<Order> orders = db.getOrders(acc.getUsername());
                    float subTotal = 0;
                %>
                <div class="col-md-9 section-left">   
                    <h3>My Cart</h3>
                    <%
                        // Displaying the orders if there are any
                        if (orders.size() != 0) {
                            for (Order order : orders) {
                            //show not paid orders
                                if (!order.isStatus()) {
                                    float totalWatch = 0;
                                    Watch w = order.getWatch();
                                    totalWatch += order.getQuantity() * w.getPrice();
                                    subTotal += totalWatch;
                    %>
                    <div class="item-info">
                        <img class="itemimg" src="images/<%= w.getName()%>.jpg" width="150" height="150"/>
                        <ul>
                            <li><p><%= w.getName()%></p></li><br>
                            <li><p>Price: $<%= w.getPrice()%></p></li><br>
                            <li><p>Quantity:<%= order.getQuantity()%></p></li><br>
                            <li><p>Total:$<%= totalWatch%></p></li><br>
                        </ul>
                        <!-- Allow user to remove order -->
                        <a href="RemoveOrderServlet?id=<%= order.getId()%>">Remove</a>
                    </div>
                    <%
                            }
                        }
                    %>

                </div>
                <div class="col-md-3 section-right">
                    <h3>Order Summary</h3>
                    <div class="sub-total">
                        <p>Sub Total:$<%= subTotal%></p>
                        <a href="CheckOut.jsp?subTotal=<%= subTotal%>">Check Out</a>
                    </div>
                </div>
                <%
                } else {
                %>
                <!-- Display a message if the cart is empty -->
                <div class="empty-cart">
                    <p>You have nothing in your cart!<a href="WelcomePage.jsp">Shop now</a></p>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </body>
</html>