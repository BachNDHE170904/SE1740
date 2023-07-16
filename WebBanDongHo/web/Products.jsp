<%-- 
    Document   : Products
    Created on : Jul 15, 2023, 8:59:34 AM
    Author     : ADMIN
--%>


<%@page import="model.Account"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Watch"%>
<%@page import="DAL.WatchDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Products Page</title>
        <link rel="stylesheet" href="css/WelcomeStyleindex.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    </head>
    <body>
        <%
            WatchDAO db = new WatchDAO();
            ArrayList<Watch> watches = db.getWatches();
            Account acc = (Account) session.getAttribute("user");
        %>
        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Watch shop</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="WelcomePage.jsp">Home</a>
                        </li>
                        <% if (acc != null && acc.getRole().equalsIgnoreCase("Administrator")) { %>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="Products.jsp">Products</a>
                        </li>
                        <% } %>
                    </ul>
                    <form class="d-flex" action="SearchServlet" method="GET" role="search">
                        <input class="form-control " name="searchResult" type="text" placeholder="Search">
                        <%
                            if (acc != null) {
                        %>
                        <div class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <%= acc.getUsername()%>
                            </a>
                            <ul class="dropdown-menu">
                                <% if (acc != null && !acc.getRole().equalsIgnoreCase("Administrator")) { %>
                                <li><a class="dropdown-item" href="ViewOrders.jsp">View Orders</a></li>
                                <li><a class="dropdown-item" href="ViewOrdersHistory.jsp">View My Order History</a></li>
                                    <%}%>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="LogOutServlet">Log Out</a></li>
                            </ul>
                        </div>
                        <%
                        } else {
                        %>
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="Login.jsp">Login</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="Register.jsp">Register</a>
                            </li>
                        </ul>
                        <%
                            }
                        %>
                    </form>
                </div>
            </div>
        </nav>
        <table class="table table-hover">
            <tr>
                <td>
                    Id
                </td>
                <td>
                    Image
                </td>
                <td>
                    Name
                </td>
                <td>
                    Price
                </td>
                <td>
                    Sku
                </td>
            </tr>
            <% for (Watch s : watches) {
            %>
            <tr>
                <td>
                    <%=s.getWatchId()%>
                </td> 
                <td>
                    <img src="images/<%= s.getName()%>.jpg" width="100" height="100" alt="<%= s.getName()%>">
                </td> 
                <td>
                    <%=s.getName()%>
                </td> 
                <td>
                    <%=s.getPrice()%>
                </td>
                <td>
                    <%=s.getSku()%>
                </td>                
                <td>   
                    <a href="UpdateItemServlet?watchid=<%= s.getWatchId()%>" onclick="return confirm('Are you sure you want to update this item?');">Update watch</a>
                    <a href="DeleteItemServlet?watchid=<%= s.getWatchId()%>" onclick="return confirm('Are you sure you want to delete this item?');">Delete watch</a>
                </td>

            </tr>
            <%}%>
        </table>
        <a href="AddItem.jsp">Add New Item</a>

    </body>
</html>
