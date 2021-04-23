<%-- 
    Document   : Homepage
    Created on : Dec 31, 2020, 10:17:14 PM
    Author     : nurfa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.models.user.User" %>
<!DOCTYPE html>
<html>
    <head>
        <title>HOMEPAGE</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

        <style>
            body, h1,h2,h3,h4,h5,h6 {font-family: "Montserrat", sans-serif}
            @media only screen and (max-width: 600px) {#main {margin-left: 0}}
            #outer
            {
                width:100%;
                text-align: center;
            }
            .inner
            {
                display: inline-block;
            }
            .center-container {
                width: 80%;
                display: block;
                margin-right: auto;
                margin-left: auto;
                padding-top: 1%;
            }
            .header-home {
                text-align: center;
            }
            .custom-shadow {
                box-shadow: 
                    rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, 
                    rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, 
                    rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;
            }
            .profile-container {
                width: 60%;
                display:block;
                margin-right:auto;
                margin-left:auto;
            }
            .container-custom {
                display: block;
                margin-right: auto;
                margin-left: auto;
                width: 80%;
                padding: 10px 0 10px 150px;
            }
            @media only screen and (max-width: 600px) {.container-custom {padding-left: 10px; padding-top: 110px;}}
            
        </style>
    </head>
    
    <jsp:useBean id="user" type="com.models.user.User" scope="session" />
    <body>
        <div class="row">
            <div class="col-1">
                <jsp:include page="../../allModules/sideNavigationBar.jsp" />
            </div>
            <div class="col">
                <!-- Page Content -->
                <div class="container-custom">
                    <nav class="navbar navbar-dark bg-dark">
                        <div style="height:36px">
                            <p class="navbar-brand"><i class="fa fa-home"></i> HOME</p>
                        </div>
                    </nav>
                    
                    <div class="jumbotron" style="min-height:50vh;">
                        <!-- Header/Home -->
                        <header class="header-home">
                            <br><img src="https://brand.utm.my/files/2016/08/LOGO-UTM.png" style="width:30%"><br><br>
                            <br><p>FACULTY OF BUILT ENVIRONMENT, UNIVERSITI TEKNOLOGI MALAYSIA</p>
                        </header>
                        
                        <div class="profile-container">
                            <table class="table table-striped table-light custom-shadow">
                                <thead class="thead-dark">
                                    <tr>
                                        <th colspan="2"><div align="middle">Profile Information</div></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row"><div align="left">USER ID</div></th>
                                        <td><label><div align="left"><jsp:getProperty name="user" property="userID"/></div></label></td>
                                    </tr>
                                    <tr>
                                        <th width="30%" scope="row"><div align="left">NAME</div></th>
                                        <td width="80%"><label><div align="left"><jsp:getProperty name="user" property="name"/></div></label></td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><div align="left">EMAIL</div></th>
                                        <td><label><div align="left"><jsp:getProperty name="user" property="email"/></div></label></td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><div align="left">PHONE NUMBER</div></th>
                                        <td><label><div align="left"><jsp:getProperty name="user" property="phoneNum"/></div></label></td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><div align="left">ROLE</div></th>
                                        <td><label><div align="left"><jsp:getProperty name="user" property="role"/></div></label></td>
                                    </tr>
                                </tbody>                                
                            </table>  
                        </div>
                    </div>
                </div>
                <!-- END PAGE CONTENT -->
            </div>
        </div>
                                    
        <jsp:include page="../../allModules/footer.jsp" />
    </body>
</html>

