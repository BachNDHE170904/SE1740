

<%@page import="java.util.Comparator"%>
<%@page import="java.util.Collections"%>
<%@page import="model.Account"%>
<%@page import="model.Watch"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAL.WatchDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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


                <form class="navbar-form navbar-right" action="" role="search">
                    <input id="searchbar" type="text" placeholder="Search">
                </form>
                <script src="js/search.js"></script>
            </div>
        </div>
        <div class="watchesContainer">
            <img class="itemimg" src="images/11062b_2a28ff5b16904be5bde7a89ad3d5fc25~mv2_d_3000_2000_s_2.webp"width="500" height="500px"/>
            <div class="sectioc-middle">
                <h3>Wrist Watches</h3>
                <%
                    int pageId;
                    try {
                        pageId = Integer.parseInt(request.getParameter("page"));
                    } catch (NumberFormatException e) {
                        pageId = 1;
                    }
                %>
                <div class="pagination">
                    <p>Page</p>
                    <a href="WelcomePage.jsp?page=<%= pageId - 1%>&&selectedValue=<%=request.getParameter("selectedValue") %>">&laquo;</a>
                    <a href="WelcomePage.jsp?page=1&&selectedValue=<%=request.getParameter("selectedValue") %>">1</a>
                    <a href="WelcomePage.jsp?page=2&&selectedValue=<%=request.getParameter("selectedValue") %>">2</a>
                    <a href="WelcomePage.jsp?page=3&&selectedValue=<%=request.getParameter("selectedValue") %>">3</a>
                    <a href="WelcomePage.jsp?page=4&&selectedValue=<%=request.getParameter("selectedValue") %>">4</a>
                    <a href="WelcomePage.jsp?page=5&&selectedValue=<%=request.getParameter("selectedValue") %>">5</a>
                    <a href="WelcomePage.jsp?page=6&&selectedValue=<%=request.getParameter("selectedValue") %>">6</a>
                    <a href="WelcomePage.jsp?page=<%= pageId + 1%>&&selectedValue=<%=request.getParameter("selectedValue") %>">&raquo;</a>
                </div>
                <div class="sort-by">
                    Sort by:
                    <select name="sort" id="sortSelect">
                        <option value="none" selected disabled hidden>Select an Option</option>
                        <option value="default">Default</option>
                        <option value="high-to-low">Price (High to low)</option>
                        <option value="low-to-high">Price (Low to high)</option>
                    </select>
                </div>
                <script>
                    document.getElementById("sortSelect").addEventListener("change", function () {
                        var selectedValue = this.value;
                        window.location.href = "WelcomePage.jsp?page=<%= pageId%>&&selectedValue=" + encodeURIComponent(selectedValue);
                    });
                </script>
                <%
                    WatchDAO db = new WatchDAO();
                    ArrayList<Watch> watches = db.getWatches();
                    if (watches == null) {
                        out.println("Cannot get the data");
                    } else {
                        ArrayList<Watch> sortedWatches = new ArrayList<>(watches);
                        String sort = request.getParameter("selectedValue");
                        if (sort == null || sort.equalsIgnoreCase("default")) {
                            Collections.sort(sortedWatches, new Comparator<Watch>() {
                                public int compare(Watch o1, Watch o2) {
                                    return (int) (o1.getWatchId() - o2.getWatchId());
                                }
                            });
                        } else if (sort.equalsIgnoreCase("high-to-low")) {
                            Collections.sort(sortedWatches, new Comparator<Watch>() {
                                public int compare(Watch o1, Watch o2) {
                                    return (int) (o2.getPrice() - o1.getPrice());
                                }
                            });
                        } else if (sort.equalsIgnoreCase("low-to-high")) {
                            Collections.sort(sortedWatches, new Comparator<Watch>() {
                                public int compare(Watch o1, Watch o2) {
                                    return (int) (o1.getPrice() - o2.getPrice());
                                }
                            });
                        }
                        for (Watch w : sortedWatches) {
                            if (w.getPageId() == pageId) {
                %>
                <div class="item-list" >
                    <a class="itembox"href="PreviewWatch?watchid=<%= w.getWatchId() - 1%>" id="<%= w.getWatchId()%>">
                        <img class="itemimg" src="images/<%= w.getName()%>.jpg"width="194" height="250"/>
                        <div class="iteminfo">
                            <div class="itemcontent">
                                <h5 class="itemname"><%= w.getName()%></h5>
                                <div class="itemprice">
                                    <strong>$<%= w.getPrice()%></strong>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%
                            }
                        }
                    }
                %>
            </div>

        </div>
    </body>
</html>
