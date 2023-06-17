

<%@page import="model.Watch"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAL.WatchDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome Page</title>
        <link rel="stylesheet" href="css/WelcomeStyleindex.css">
        <link href="css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="row1">
            <div class="collapse navbar-collapse" id="navbar">
                <ul>
                    <li><a href="WelcomePage.jsp">Home</a></li>
                    <li><a href="WelcomePage.jsp">Shop</a></li>
                    <li><a href="Login.html">Login</a></li>
                    <li><a href="Resgister.jsp">Register</a></li>
                    <li><a href="about.jsp">About us</a></li>
                </ul>


                <form class="navbar-form navbar-right" role="search">
                    <input type="text" placeholder="Search">
                    <button type="submit">search</button>
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
                <a class="itembox"href="PreviewWatch?watchid=<%= w.getId()%>" id="<%= w.getId()%>">
                    <img class="itemimg" src="images/<%= w.getName()%>.jpg" width="290" height="290"/>
                    <div class="itemcontent">
                        <h5><%= w.getName()%></h5>
                        <div class="itemprice">
                            <strong>$<%= w.getPrice()%></strong>
                        </div>
                        <button href="addToCart" type="button">Add to cart</button>
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
