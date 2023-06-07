
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
                <a href="Login.html">Login</a>
                <a href="#">Shop</a>
                <a href="#">About us</a>


                <form class="navbar-form navbar-right" role="search">
                    <input type="text" class="form-control" placeholder="Search">
                    <button type="submit" class="btn btn-default">search</button>
                </form>

            </div>
        </div>
        <div class="watchesContainer">
            <div class="row">
                <%
                    Watch w=(Watch)request.getAttribute("previewwatch");
                %>
                <h3><%= w.getName() %></h3>
                S
            </div>

        </div>
    </body>
</html>
