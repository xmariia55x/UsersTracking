<%-- 
    Document   : index
    Created on : 21-abr-2021, 10:29:53
    Author     : maria
--%>

<%@page import="java.util.List"%>
<%@page import="usersTracking.entities.Person"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
        <link href="style.css" rel="stylesheet">
        <title>Users tracking</title>
    </head>
    <%
        List<Person> people = (List) request.getAttribute("people");
        List<Person> friends = (List) request.getAttribute("friends");
    %>
    <body>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <div class="new_user">
            <form action="ServletCreatePerson">


                <h4>New user</h4><br>
                <div class="mb-3">
                    <label for="nameInput" class="form-label">Name</label>
                    <input type="text" class="form-control" id="nameInput" name="username"><br>
                    <div class="col-auto">
                        <button type="submit" class="btn btn-primary mb-3">Add user</button>
                    </div>
                </div>

            </form>
            <a href="ServletGetUsers">Add connection between users</a>
        </div>
        <div class="container-sm border" style="text-align: center; width:40%;">
            <h4>Users list</h4>
            <%
                if (people == null || people.isEmpty()) {

            %>
            <br>
            Your database is empty, no users to track!
            <% } else {

            %>  
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <%            for (Person person : people) {
                    %>


                    <tr>
                        <td><%=person.getName()%></td>
                        <!--<td><a href="ServletShowRelationShip?id=<%= person.getId()%>">Show friends</a></td> -->
                        <td><a href="ServletListPeople?id=<%= person.getId()%>">Show friends</a></td>
                    </tr>

                    <%      } %>
                </tbody>
            </table>
            <%
                }
            %>
        </div>
        <br>
        <div class="container-sm border" style="text-align: center;width:40%;">
            <h4>User's friends</h4>
            <%
                if (friends == null || friends.isEmpty()) {

            %>
            <br>
            No users connected!
            <% } else {

            %>  
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Name</th>
                    </tr>
                </thead>
                <tbody>
                    <%            for (Person friend : friends) {
                    %>
                    <tr>
                        <td><%=friend.getName()%></td>

                    </tr>

                    <%      } %>
                </tbody>
            </table>
            <%
                }
            %>
        </div>

    </body>
</html>
