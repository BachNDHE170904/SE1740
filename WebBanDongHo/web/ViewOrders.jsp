
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
                
            </div>

        </div>
    </body>
</html>
