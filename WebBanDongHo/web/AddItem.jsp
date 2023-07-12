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
        <div class="container Center">
            <div class="row">
                <h1>New Item Details</h1>
                <form action="AddNewItemServlet" method="POST">
                    <div class="txt_field">
                        <input type="text" name="name" required /> 
                        <span></span>
                        <label>Name</label>
                    </div>
                    <div class="txt_field">
                        <input type="text" name="sku" required />
                        <span></span>
                        <label>Sku</label>
                    </div>
                    <div class="txt_field">
                        <input type="number" step="0.01" name="price" required />
                        <span></span>
                        <label>Price</label>
                    </div>
                    <div class="txt_field">
                        <input type="text" name="address" required />
                        <span></span>
                        <label>Address</label>
                    </div>
                    <label for="myfile">Select an image</label>
                    <input type="file" id="myfile" name="myfile">
                    <input type="submit" onclick="return confirm('Are you sure you want to add this item?');" value="Add new item"/>
                </form>

            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    </body>
</html>