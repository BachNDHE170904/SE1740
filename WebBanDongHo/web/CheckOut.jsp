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
        <link rel="stylesheet" href="css/CheckOutStyleIndex.css">
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
        <div class="Center">
            <div class="row2">
                <%
                    // Retrieving orders from the database for the logged-in user
                    OrderDAO db = new OrderDAO();
                    ArrayList<Order> orders = db.getOrders(acc.getUsername());
                    float subTotal=0;
                    try {
                         subTotal = Float.parseFloat(request.getParameter("subTotal"));
                    } catch (Exception e) {
                         subTotal = 0;
                    }
                %>
                <div class="col-md-9 section-left">   
                    <h1>Shipping Details</h1>
                    <form action="CheckOutServlet" method="POST">
                        <!-- Username input -->
                        <div class="txt_field">
                            <input type="text" name="firstname" required /> 
                            <span></span>
                            <label>First Name</label>
                        </div>
                        <!-- Password input -->
                        <div class="txt_field">
                            <input type="text" name="lastname" required />
                            <span></span>
                            <label>Last name</label>
                        </div>
                        <div class="txt_field">
                            <input type="text" name="phone" required />
                            <span></span>
                            <label>Phone</label>
                        </div>
                        <div class="txt_field">
                            <input type="text" name="address" required />
                            <span></span>
                            <label>Address</label>
                        </div>
                        <input type="submit" value="Save address and order"/>
                    </form>

                </div>
                <div class="col-md-3 section-right">
                    <h3>Order Summary</h3>
                    <div class="sub-total">
                        <p>Sub Total:$<%= subTotal%></p>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>