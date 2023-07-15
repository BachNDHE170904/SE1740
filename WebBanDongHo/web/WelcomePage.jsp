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
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="WelcomePage.jsp">Home</a>
                        </li>
                        <% if (acc != null && acc.getRole().equalsIgnoreCase("Administrator")) { %>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="Products.jsp">Products</a>
                        </li>
                        <% }if(acc==null) {
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
                        <%
                            if(acc!=null){
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
                            }
                        %>
                    </form>
                </div>
            </div>
        </nav>
        <%
            if ((acc == null) || (acc != null && !acc.getRole().equalsIgnoreCase("Administrator"))) {
        %>
        <div class="hero-image">
        </div>
        <div class="container watchesContainer">
            <h3 class="pt-3">Wrist Watches</h3>
            <%
                int pageId;
                //retrieve page, page is set to 1 by default
                try {
                    pageId = Integer.parseInt(request.getParameter("page"));
                } catch (NumberFormatException e) {
                    pageId = 1;
                }
                //get search result, it is set to "" by default to get all watches
                String search = (String) request.getAttribute("searchResult");
                if (search == null) {
                    search = request.getParameter("searchResult");
                }
                if (search == null || search.equalsIgnoreCase("null")) {
                    search = "";
                }
                WatchDAO db = new WatchDAO();
                ArrayList<Watch> watches = db.getWatches();
                if (watches == null) {
                    out.println("Cannot get the data");
                } else {
                    //set max number of page
                    int maxPage = (int) watches.size() / 8 + 1;
            %>
            <div class="d-flex justify-content-between">
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <%
                            //when should ">>" and "<<" signs appear
                            if (pageId > 1) {
                        %>
                        <li class="page-item"><a class="page-link" href="WelcomePage.jsp?page=<%= pageId - 1%>&&selectedValue=<%=request.getParameter("selectedValue")%>&&searchResult=<%=request.getParameter("searchResult")%>">&laquo;</a></li>
                            <%
                                }
                            %>
                            <%
                                for (int i = 1; i <= maxPage; i++) {
                            %>
                        <li class="page-item"><a class="page-link" href="WelcomePage.jsp?page=<%= i%>&&selectedValue=<%=request.getParameter("selectedValue")%>&&searchResult=<%=request.getParameter("searchResult")%>"><%= i%></a></li>
                            <%
                                }
                            %>
                            <%
                                if (pageId < maxPage) {
                            %>
                        <li class="page-item"><a class="page-link" href="WelcomePage.jsp?page=<%= pageId + 1%>&&selectedValue=<%=request.getParameter("selectedValue")%>&&searchResult=<%=request.getParameter("searchResult")%>">&raquo;</a></li>
                            <%
                                }
                            %>
                    </ul>
                </nav>
                <div class="sort-by">
                    Sort by:
                    <select name="sort" id="sortSelect">
                        <option value="sort" selected hidden>Select an option</option>
                        <option value="default">Default</option>
                        <option value="high-to-low">Price (High to low)</option>
                        <option value="low-to-high">Price (Low to high)</option>
                    </select>
                </div>
            </div>
            <script>
                //script to check the user choice in the sort By dropdown menu 
                document.getElementById("sortSelect").addEventListener("change", function () {
                    var selectedValue = this.value;
                    window.location.href = "WelcomePage.jsp?searchResult=<%=request.getParameter("searchResult")%>&&page=<%= pageId%>&&selectedValue=" + encodeURIComponent(selectedValue);
                });
            </script>
            <div class="row">
                <%
                    //sort the watches, they are sorted by id by default
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
                    for (int i = 0; i < sortedWatches.size(); i++) {
                        int pageID = i / 8 + 1;
                        sortedWatches.get(i).setPageId(pageID);
                    }
                    //show all the watches 
                    for (Watch w : sortedWatches) {
                        if (w.getPageId() == pageId && w.getName().toLowerCase().contains(search.toLowerCase())) {
                %>
                <div class="col-3 mb-4">
                    <div class="card">
                        <img src="images/<%= w.getName()%>.jpg" class="card-img-top" alt="<%= w.getName()%>">
                        <div class="card-body">
                            <h6 class="card-title"><%= w.getName()%></h6>
                            <p class="card-text">$<%= w.getPrice()%></p>
                            <a href="PreviewWatch?watchid=<%= w.getWatchId() - 1%>" id="<%= w.getWatchId()%>" class="btn btn-primary">Preview watch</a>
                        </div>
                    </div>
                </div>
                <%
                            }
                        }
                    }
                %>
            </div>

        </div>
        <%}%>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    </body>
</html>
