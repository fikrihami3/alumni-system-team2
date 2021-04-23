<%-- 
    Document   : navigationBar
    Created on : Jan 19, 2021, 11:13:18 PM
    Author     : ainal farhan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    </head>
    <body>
        <jsp:useBean id="user" type="com.models.user.User" scope="session" />
        <!-- Icon Bar (Sidebar - hidden on small screens) -->
        <nav class="w3-sidebar w3-blue w3-bar-block w3-small w3-hide-small w3-center">
            <!-- Avatar image in top left corner -->
            <a href="ManageUserController?option=viewHomepage" class="w3-bar-item w3-button w3-padding-large w3-hover-white">
                <i class="fa fa-home w3-xlarge"></i>
                <p>HOME</p>
            </a>
            
            <a href="ManageUserController?option=editProfile" class="w3-bar-item w3-button w3-padding-large w3-hover-white">
                <i class="far fa-edit w3-xlarge"></i>
                <p>EDIT PROFILE</p>
            </a>
            
            <%    if(user.getRole().equalsIgnoreCase("ALUMNI")) { %>
            <form action="AlumniController" method="POST" name="alumni-info">
                <div class="w3-bar-item w3-button w3-padding-large w3-hover-white" onClick="document.forms['alumni-info'].submit();">
                    <input type="hidden" name="requestType" value="manageAlumnusAlumnaInfo">
                    <i class="fa fa-user w3-xlarge"></i>
                    <p>ALUMNI INFO</p>
                </div>
            </form>
            <%    } %>
            
            <form action="AlumniController" method="POST" name="alumni-list">
                <div class="w3-bar-item w3-button w3-padding-large w3-hover-white" onClick="document.forms['alumni-list'].submit();">
                    <input type="hidden" name="requestType" value="viewAlumniList">
                    <i class="fas fa-users w3-xlarge"></i>
                    <p>ALUMNI LIST</p>
                </div>
            </form>
            
            <form action="ReportingController" method="POST" name="reporting-dashboard">
                <div class="w3-bar-item w3-button w3-padding-large w3-hover-white" onClick="document.forms['reporting-dashboard'].submit();">
                    <input type="hidden" name="requestType" value="viewDashboard">
                    <i class="fas fa-chart-line w3-xlarge"></i>
                    <p>DASHBOARD</p>
                </div>
            </form>
            
            <%    if(user.getRole().equalsIgnoreCase("ADMIN")) { %>
            <a id="manage" href="ManageUserController?option=viewManageUserPage" class="w3-bar-item w3-button w3-padding-large w3-hover-white">
                <i class="fa fa-user w3-xlarge"></i>
                <p>MANAGE USER</p>
            </a>
            <%    } %>
            
            <%    if((user.getRole().equalsIgnoreCase("ADMIN"))||(user.getRole().equalsIgnoreCase("STAFF"))) { %>
            <a href="ViewPageControl?option=managePage" class="w3-bar-item w3-button w3-padding-large w3-hover-white">
                <i class="fas fa-calendar-week w3-xlarge"></i>
                <p>MANAGE EVENTS</p>
            </a>
            <%    } %>
            
            <a href="ViewPageControl?option=viewPage" class="w3-bar-item w3-button w3-padding-large w3-hover-white">
                <i class="fas fa-clipboard-list w3-xlarge"></i>
                <p>VIEW EVENT</p>
            </a>
            
            <a id="manage" href="ManageUserController?option=logout" class="w3-bar-item w3-button w3-padding-large w3-hover-white">
                <i class="fa fa-key w3-xlarge"></i>
                <p>LOGOUT</p>
            </a>
            <input type="text" name="temp" id="temp" value ="<jsp:getProperty name="user" property="role"/>" hidden>
        </nav>

        <!-- Navbar on small screens (Hidden on medium and large screens) -->
        <div class="w3-top w3-hide-large w3-hide-medium" id="myNavbar">
          <div class="w3-bar w3-black w3-opacity w3-hover-opacity-off w3-center w3-small">
            <form action="ManageUserController" method="POST" name="user-home">
                <div class="w3-bar-item w3-button" style="width:25% !important" onClick="document.forms['user-home'].submit();">
                    <input type="hidden" name="option" value="viewHomepage">
                    <p>HOME</p>
                </div>
            </form>
              
            <form action="ManageUserController" method="POST" name="edit-profile-user">
                <div class="w3-bar-item w3-button" style="width:25% !important" onClick="document.forms['edit-profile-user'].submit();">
                    <input type="hidden" name="option" value="viewEditProfilePage">
                    <p>EDIT PROFILE</p>
                </div>
            </form>
            
            <form action="AlumniController" method="POST" name="alumni-list">
                <div class="w3-bar-item w3-button" style="width:25% !important" onClick="document.forms['alumni-list'].submit();">
                    <input type="hidden" name="requestType" value="viewAlumniList">
                    <p>ALUMNI LIST</p>
                </div>
            </form>
              
            <form action="ReportingController" method="POST" name="reporting-dashboard">
                <div class="w3-bar-item w3-button" style="width:25% !important" onClick="document.forms['reporting-dashboard'].submit();">
                    <input type="hidden" name="requestType" value="viewDashboard">
                    <p>DASHBOARD</p>
                </div>
            </form>
            
            <%    if(user.getRole().equalsIgnoreCase("ADMIN")) { %>
            <form action="ManageUserController" method="POST" name="manage-user">
                <div class="w3-bar-item w3-button" style="width:25% !important" onClick="document.forms['manage-user'].submit();">
                    <input type="hidden" name="option" value="viewManageUserPage">
                    <p>MANAGE USER</p>
                </div>
            </form>
            <%    } %>
            
            <form action="AlumniController" method="POST" name="alumni-info">
                <div class="w3-bar-item w3-button" style="width:25% !important" onClick="document.forms['alumni-info'].submit();">
                    <input type="hidden" name="requestType" value="manageAlumnusAlumnaInfo">
                    <p>ALUMNI INFO</p>
                </div>
            </form>
            
            <%    if((user.getRole().equalsIgnoreCase("ADMIN"))||(user.getRole().equalsIgnoreCase("STAFF"))) { %>
            <form action="ViewPageControl" method="GET" name="view-events">
                <div class="w3-bar-item w3-button" style="width:25% !important" onClick="document.forms['view-events'].submit();">
                    <input type="hidden" name="option" value="managePage">
                    <p>MANAGE EVENTS</p>
                </div>
            </form>
            <%    } %>
            
            <form action="ViewPageControl" method="GET" name="view-event">
                <div class="w3-bar-item w3-button" style="width:25% !important" onClick="document.forms['view-event'].submit();">
                    <input type="hidden" name="option" value="viewPage">
                    <p>VIEW EVENTS</p>
                </div>
            </form>
            
            <form action="ManageUserController" method="POST" name="logout-user">
                <div class="w3-bar-item w3-button" style="width:25% !important" onClick="document.forms['logout-user'].submit();">
                    <input type="hidden" name="option" value="logout">
                    <p>LOGOUT</p>
                </div>
            </form>
          </div>
        </div>
    </body>
</html>
