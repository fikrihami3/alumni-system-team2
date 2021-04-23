<%-- 
    Document   : view4
    Created on : Dec 27, 2020, 1:35:35 AM
    Author     : Lenovo
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.models.user.User"%>
<%@page import="java.util.ArrayList"%>

<%
    ArrayList<User> users = null;
    User user = null;
    if(!session.isNew()) {
        users = (ArrayList)session.getAttribute("users");
        user = (User)session.getAttribute("user");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DELETE USER</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
        
        <style>
            body, h1,h2,h3,h4,h5,h6 {font-family: "Montserrat", sans-serif}
            @media only screen and (max-width: 600px) {#main {margin-left: 0}}
            th,
            td {
                text-align: center;
                padding: 0.5em 1em;
            }
            body, h1,h2,h3,h4,h5,h6 {font-family: "Montserrat", sans-serif}
            #outer {
                width:100%;
                text-align: center;
            }
            .inner {
                display: inline-block;
            }
            .center-container {
                width: 80%;
                display: block;
                margin-right: auto;
                margin-left: auto;
                padding-top: 5px;
            }
            .delete-user-container {
                width: 95%;
                display:block;
                margin-right:auto;
                margin-left:auto;
            }
            .custom-shadow {
                box-shadow: rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;
            }
            .header-home {
                margin-top: -25px;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <script>
            var a = "<%= request.getParameter("status") %>";
            if (a === "true") {
                var answer = window.confirm("Delete Confirmation");
                if (answer) {
                    location.replace("ManageUserController?option=confirmDelete&id=<%= request.getParameter("name") %>");
                }
                else {
                    //some code
                }
            }
        </script>

        <div class="row">
            <div class="col-1">
                <jsp:include page="../../allModules/sideNavigationBar.jsp" />
            </div>
            <div class="col">
                <div class="center-container">
                    <nav class="navbar navbar-dark bg-dark">
                        <div style="height:36px;">
                            <p class="navbar-brand"><i class="fas fa-user-minus"></i> DELETE A USER</p>
                        </div>
                    </nav>
                    <div class="jumbotron">
                        <!-- Header/Home -->
                        <header class="header-home">
                            <img src="https://brand.utm.my/files/2016/08/LOGO-UTM.png" style="width:30%"><br>
                            <br><p>FACULTY OF BUILT ENVIRONMENT, UNIVERSITI TEKNOLOGI MALAYSIA</p>
                        </header>

                        <div class="table-responsive delete-user-container">
                            <table class="table table-striped table-light custom-shadow">
                                <thead class="thead-dark">
                                    <tr>
                                        <th>USER ID</th>
                                        <th>NAME</th>
                                        <th>EMAIL</th>
                                        <th>PHONE NUMBER</th>
                                        <th>ROLE</th>
                                        <th>DELETE</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                    int index=0;

                                    for(int i=0;i<users.size();i++){
                                        User mp =(User)users.get(i);

                                        if(mp.getUserID().equals(user.getUserID())) {
                                            continue;
                                        }

                                        index++;
                                    %>

                                    <tr >
                                        <td><%= mp.getUserID() %></td>
                                        <td><%= mp.getName() %></td>
                                        <td><%= mp.getEmail()%></td>
                                        <td><%= mp.getPhoneNum()%></td> 
                                        <td><%= mp.getRole()%></td> 
                                        <td><center><a href="ManageUserController?option=delete&id=<%= mp.getUserID() %>" class="btn btn-danger">DELETE <i class="fas fa-user-minus"></i></a></center></td>
                                    </tr>
                                    <% 
                                    }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                                
        <jsp:include page="../../allModules/footer.jsp" />
    </body>
</html>
