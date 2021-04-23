<%-- 
    Document   : EditProfilePage
    Created on : Dec 31, 2020, 10:16:46 PM
    Author     : nurfa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.models.user.User" %>
<!DOCTYPE html>
<html>
    <head>
        <title>EDIT PROFILE</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

        <style>
            body, h1,h2,h3,h4,h5,h6 {font-family: "Montserrat", sans-serif}
            #main {margin-left: 120px}
            /* Remove margins from "page content" on small screens */
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
                padding-top: 10px;
            }
            .header-home {
                margin-top: -25px;
                text-align: center;
            }
            .custom-shadow {
                box-shadow: 
                    rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, 
                    rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, 
                    rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;
            }
            input:focus {
                outline: 0;
                outline-style:none;
                outline-width:0;
            } 
            .edit-profile-container {
                width: 100%;
                display:block;
                margin-right:auto;
                margin-left:auto;
            }
            .td-custom {
                height: 20px;
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
    
    <body>
        <jsp:useBean id="user" type="com.models.user.User" scope="session" />
        
        <!-- Page Content -->
        <div class="row">
            <div class="col-1">
                <jsp:include page="../../allModules/sideNavigationBar.jsp" />
            </div>
            <div class="col">
                <!-- Page Content -->
                <div class="container-custom">
                    <nav class="navbar navbar-dark bg-dark">
                        <div style="height:36px">
                            <p class="navbar-brand"><i class="far fa-edit"></i> EDIT PROFILE</p>
                        </div>
                    </nav>
                    <div class="jumbotron">      
                        <!-- Header/Home -->
                        <header class="header-home">
                            <img src="https://brand.utm.my/files/2016/08/LOGO-UTM.png" style="width:30%"><br>
                            <br><p>FACULTY OF BUILT ENVIRONMENT, UNIVERSITI TEKNOLOGI MALAYSIA</p>
                        </header>

                        <div class="edit-profile-container">
                            <form name="form" action="ManageUserController" method="post" onsubmit="return validate()">
                                <table class="table table-striped table-light custom-shadow">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th colspan="2"><div align="middle">Profile Information</div></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <div class="form-group row td-custom">
                                                    <label for="userID" class="col-sm-5 col-form-label" style="font-weight: bolder;">USER ID</label>
                                                    <div class="col-sm">
                                                        <input type="text" class="form-control-plaintext" name="userID" id="userID" required value="<jsp:getProperty name="user" property="userID"/>" readonly>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-group row td-custom">
                                                    <label for="role" class="col-sm-4 col-form-label" style="font-weight: bolder;">ROLE</label>
                                                    <div class="col-sm-8" style="border:none;">
                                                        <input type="text" class="form-control-plaintext" name="role" id="role" required value="<jsp:getProperty name="user" property="role"/>" readonly>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="form-group row td-custom">
                                                    <label for="name" class="col-sm-5 col-form-label" style="font-weight: bolder;">NAME</label>
                                                    <div class="col-sm">
                                                        <input type="text" class="form-control" name="name" id="name" required value="<jsp:getProperty name="user" property="name"/>">
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-group row td-custom">
                                                    <label for="phoneNum" class="col-sm-4 col-form-label" style="font-weight: bolder;">PHONE NUMBER</label>
                                                    <div class="col-sm-8">
                                                        <input type="text" class="form-control" name="phoneNum" id="phoneNum" required value="<jsp:getProperty name="user" property="phoneNum"/>">
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="form-group row td-custom">
                                                    <label for="email" class="col-sm-5 col-form-label" style="font-weight: bolder;">EMAIL</label>
                                                    <div class="col-sm">
                                                        <input type="email" class="form-control" name="email" id="email" required value="<jsp:getProperty name="user" property="email"/>">
                                                    </div>
                                                </div>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="form-group row td-custom">
                                                    <label for="password" class="col-sm-5 col-form-label" style="font-weight: bolder;">PASSWORD</label>
                                                    <div class="col-sm">
                                                        <input type="password" class="form-control" name="password" id="password" required value="<jsp:getProperty name="user" property="password"/>">
                                                    </div>
                                                </div>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="form-group row" style="height: 25px;">
                                                    <label for="password2" class="col-sm-5 col-form-label" style="font-weight: bolder;">CONFIRM PASSWORD</label>
                                                    <div class="col-sm">
                                                        <input type="password" class="form-control" name="password2" id="password2" required value="<jsp:getProperty name="user" property="password"/>">
                                                    </div>
                                                </div>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <div class="form-group td-custom" align="middle" >
                                                    <span style="color:red; font-weight: bold; align-content: center;">
                                                        <br><%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%><br>
                                                    </span><br>
                                                    <input type="hidden" name="option" id="option" value = "submitEditData">
                                                    <button type="submit" class="btn btn-success" name="button"><i class="fas fa-user-edit"></i> Submit</button>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>                                
                                </table
                            </form>
                        </div>
                    </div>
                </div>
                <!-- END PAGE CONTENT -->
            </div>
        </div> 
        <!-- END PAGE CONTENT -->
        
        <script>
            function validate() { 
                var name = document.form.name.value;
                var email = document.form.email.value;
                var phoneNum = document.form.phoneNum.value; 
                var password = document.form.password.value;
                var conpassword= document.form.password2.value;
                var role= document.form.role.value;

                if (name===null || name==="") { 
                    alert("Name can't be blank"); 
                    return false; 
                }
                else if (email===null || email==="") { 
                    alert("Email can't be blank"); 
                    return false; 
                }
                else if (phoneNum===null || phoneNum==="") { 
                    alert("Phone Number can't be blank"); 
                    return false; 
                }
                else if(password.length<8) { 
                    alert("Password must be at least 6 characters long."); 
                    return false; 
                } 
                else if (password!=conpassword) { 
                    alert("Confirm Password should match with the Password"); 
                    return false; 
                } 
            } 
        </script> 
        
        <jsp:include page="../../allModules/footer.jsp" />
    </body>
</html>

