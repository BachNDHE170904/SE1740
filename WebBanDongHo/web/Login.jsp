<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="css/LoginStyleindex.css">
        <link href="css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="row1">
            <div class="collapse navbar-collapse" id="navbar">
                <ul>
                    <li><a href="WelcomePage.jsp">Home</a></li>
                    <li><a href="WelcomePage.jsp">Shop</a></li>
                    <li><a href="Login.jsp">Login</a></li>
                    <li><a href="Register.jsp">Register</a></li>
                </ul>
                
                <!-- Search form -->
                <form class="navbar-form navbar-right" action="SearchServlet" method="GET" role="search">
                    <input name="searchResult" type="text" placeholder="Search">
                </form>

            </div>
        </div>
        <div class="Center">
            <h1>Login</h1>
            <form action="LoginServlet" method="POST">
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
                <input type="submit" value="Login"/>
                <!-- Signup link -->
                <div class="signup_link">
                    Don't have an account?<a href="Register.jsp">Sign up</a>
                </div>
                <% 
                    // Server-side code to handle failed login attempt
                    String failedLogin = (String) request.getAttribute("failedLogin");
                    if (failedLogin != null) {
                        if (failedLogin.equalsIgnoreCase("fail")) {
                %> 
                <!-- Display error message for failed login -->
                <div class="WrongLogin">
                    <p>Wrong username or password</p>
                </div>
                <%
                        }
                    }
                %>
            </form>
        </div>
    </body>
</html>