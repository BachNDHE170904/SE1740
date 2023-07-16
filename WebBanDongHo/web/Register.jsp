<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <link rel="stylesheet" href="css/RegisterStyleindex.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    </head>
    <body>
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
                    </ul>
                    <form class="d-flex" action="SearchServlet" method="GET" role="search">
                        <input class="form-control" name="searchResult" type="text" placeholder="Search">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="Login.jsp">Login</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="Register.jsp">Register</a>
                            </li>
                        </ul>
                    </form>
                </div>
            </div>
        </nav>
        <div class="Center">
            <h1>Register</h1>
            <form action="RegisterServlet" method="POST">
                <!-- Username input -->
                <div class="txt_field">
                    <input type="text" name="username" required /> 
                    <span></span>
                    <label>Username</label>
                </div>
                <!-- Password input -->
                <div class="txt_field">
                    <input type="password" name="password" required />
                    <span></span>
                    <label>Password</label>
                </div>
                <input type="submit" value="Register"/>
                <%
                    // Server-side code to handle failed registration attempt
                    String failedRegister = (String) request.getAttribute("failedRegister");
                    if (failedRegister != null) {
                        if (failedRegister.equalsIgnoreCase("fail")) {
                %> 
                <!-- Display error message for failed registration -->
                <div class="WrongRegister">
                    <p>Account already existed, please choose another username</p>
                </div>
                <%
                        }
                    }
                %>
            </form>
        </div>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    </body>
</html>