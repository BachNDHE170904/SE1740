<%-- 
    Document   : WelcomePage
    Created on : Jun 2, 2023, 3:23:56 AM
    Author     : ADMIN
--%>

<%@page import="model.Watch"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAL.WatchDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome Page</title>
        <link rel="stylesheet" href="css/styleindex.css">
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
                <h3>Wrist Watches</h3>
                <%
                    WatchDAO db = new WatchDAO();
                    ArrayList<Watch> watches = db.getWatches();
                    if (watches == null) {
                        out.println("Cannot get the data");
                    } else {
                        for (Watch w : watches) {
                %>
                <a class="itembox" id="<%= w.getId()%>" href="PreviewWatch">
                    <img class="itemimg" src="images/<%= w.getName()%>.jpg" width="290" height="290"/>
                    <div class="itemcontent">
                        <h5><%= w.getName()%></h5>
                        <div class="itemprice">
                            <strong>$<%= w.getPrice()%></strong>
                        </div>
                        <button type="button">Add to cart</button>
                    </div>
                </a>
                <%
                        }
                    }
                %>
            </div>

        </div>
    </body>
</html>
