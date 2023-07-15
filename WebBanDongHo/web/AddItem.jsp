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
        <link rel="stylesheet" href="css/AddItemStyleIndex.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    </head>
    <body>
        <%
            //check if the user is logged in or not
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
                        <input class="form-control me-2" name="searchResult" type="text" placeholder="Search">
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
        <div class="container Center">
            <div class="row">
                <form class="row" action="AddNewItemServlet" method="POST" enctype="multipart/form-data">
                    <div class="col-md-6 section-left">
                        <h1>New Item Details</h1>
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
                        <div class="input-group mb-3">
                            <label class="input-group-text" for="myfile">Upload an image</label>
                            <input type="file" class="form-control" id="myFile" name="myFile" required>
                        </div>
                        <script>
                            const fileInput = document.getElementById("file");

                            fileInput.addEventListener("change", (event) => {
                                const file = event.target.files[0];
                                const fileType = file["type"];
                                const validImageTypes = ["image/jpeg", "image/png", "image/gif"];

                                if (!validImageTypes.includes(fileType)) {
                                    alert("Invalid file type. Please upload an image file.");
                                    event.target.value = "";
                                }
                            });
                        </script>
                    </div>
                    <div class="col-md-6 section-right">
                        <h1>New Item Specs</h1>
                        <div class="txt_field">
                            <input type="text" name="bezel" required /> 
                            <span></span>
                            <label>Bezel</label>
                        </div>
                        <div class="txt_field">
                            <input type="text" name="movement" required />
                            <span></span>
                            <label>Movement</label>
                        </div>
                        <div class="txt_field">
                            <input type="text" name="dial" required />
                            <span></span>
                            <label>Dial</label>
                        </div>
                        <div class="txt_field">
                            <input type="text" name="case" required />
                            <span></span>
                            <label>Case</label>
                        </div>
                        <div class="txt_field">
                            <input type="text" name="glass" required />
                            <span></span>
                            <label>Glass</label>
                        </div>
                        <div class="txt_field">
                            <input type="text" name="strap" required />
                            <span></span>
                            <label>Strap</label>
                        </div>
                    </div>
                    <input type="submit" onclick="return confirm('Are you sure you want to add this item?');" value="Add new item"/>
                </form>    
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    </body>
</html>