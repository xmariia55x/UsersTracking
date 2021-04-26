<%-- 
    Document   : connectUsers
    Created on : 22-abr-2021, 20:50:30
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
        <title>Add connection</title>
    </head>
    <%
        List<Person> people = (List) request.getAttribute("people");
    %>
    <body>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <h1>Add a connection between two users</h1>
        <div class="new_connection">
            <form action="ServletConnectUsers">
                <% if (people == null) {
                    } else {%>
                <div class="row">
                    <div class="column">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>Select user 1</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <%            for (Person person : people) {
                                %>


                                <tr>
                                    <td>    
                                        <input type="radio" name="person1_name" value="<%=person.getId()%>" /> <%=person.getName()%>                    
                                        <!--<input type="checkbox" name="person_name" value="<%=person.getName()%>" /> -->

                                    </td>
                                    <!--<td><a href="ServletShowRelationShip?id=<%= person.getId()%>">Show friends</a></td> -->
                                    <!--<td><a href="ServletListPeople?id=<%= person.getId()%>">Show friends</a></td>-->
                                </tr>

                                <%      } %>
                            </tbody>
                        </table>
                    </div>
                    <div class="column">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>Select user 2</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <%            for (Person person : people) {
                                %>


                                <tr>
                                    <td>    
                                        <input type="radio" name="person2_name" value="<%=person.getId()%>" /> <%=person.getName()%>                    
                                        <!--<input type="checkbox" name="person_name" value="<%=person.getName()%>" /> -->

                                    </td>
                                    <!--<td><a href="ServletShowRelationShip?id=<%= person.getId()%>">Show friends</a></td> -->
                                    <!--<td><a href="ServletListPeople?id=<%= person.getId()%>">Show friends</a></td>-->
                                </tr>

                                <%      } %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-auto">
                    <button type="submit" class="btn btn-primary mb-3">Connect!</button>
                </div>
                <%      }%>

            </form>
        </div>
    </body>
</html>
