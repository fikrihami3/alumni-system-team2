<%-- 
    Document   : AddUserPage
    Created on : Dec 31, 2020, 10:16:06 PM
    Author     : nurfa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.models.user.User" %>
<!DOCTYPE html>
<html>
    <head>
        <title>ADD USER</title>
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
                padding-top: 5px;
            }
            .add-new-user-container {
                width: 100%;
                display:block;
                margin-right:auto;
                margin-left:auto;
            }
            td {
                text-align: left;
            }
            .td-custom {
                height: 20px;
            }
            .custom-shadow {
                box-shadow: 
                    rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, 
                    rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, 
                    rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;
            }
            .header-home {
                margin-top: -25px;
                text-align: center;
            }
        </style>
    </head>
    
    <body>
        <div class="row">
            <div class="col-1">
                <jsp:include page="../../allModules/sideNavigationBar.jsp" />
            </div>
            <div class="col">
                <div class="center-container">
                    <nav class="navbar navbar-dark bg-dark">
                        <div style="height:36px;">
                            <p class="navbar-brand"><i class="fa fa-user-plus"></i> ADD NEW USER</p>
                        </div>
                    </nav>

                    <div class="jumbotron">
                        <!-- Header/Home -->
                        <header class="header-home">
                            <img src="https://brand.utm.my/files/2016/08/LOGO-UTM.png" style="width:30%"><br>
                            <br><p>FACULTY OF BUILT ENVIRONMENT, UNIVERSITI TEKNOLOGI MALAYSIA</p>
                        </header>

                        <!-- Page Content -->
                        <div class="add-new-user-container">
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
                                                    <label for="name" class="col-sm-4 col-form-label" style="font-weight: bolder;">NAME</label>
                                                    <div class="col-sm">
                                                        <input type="text" class="form-control" name="name" id="name" required>
                                                    </div>
                                                </div>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="form-group row td-custom">
                                                    <label for="email" class="col-sm-4 col-form-label" style="font-weight: bolder;">EMAIL</label>
                                                    <div class="col-sm">
                                                        <input type="email" class="form-control" name="email" id="email" required>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-group row td-custom">
                                                    <label for="phoneNum" class="col-sm-5 col-form-label" style="font-weight: bolder;">PHONE NUMBER</label>
                                                    <div class="col-sm">
                                                        <input type="text" class="form-control" name="phoneNum" id="phoneNum" required>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="form-group row td-custom">
                                                    <label for="password" class="col-sm-4 col-form-label" style="font-weight: bolder;">PASSWORD</label>
                                                    <div class="col-sm-8">
                                                        <input type="password" class="form-control" name="password" id="password" required>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-group row td-custom">
                                                    <label for="password2" class="col-sm-5 col-form-label" style="font-weight: bolder;">CONFIRM PASSWORD</label>
                                                    <div class="col-sm">
                                                        <input type="password" class="form-control" name="password2" id="password2" required>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="form-group row td-custom">
                                                    <label for="role" class="col-sm-4 col-form-label" style="font-weight: bolder;">ROLE</label>                                            
                                                    <div class="form-check form-check-inline" style="padding-left: 20px;">
                                                        <input class="form-check-input" type="radio" name="role" id="role" value="ALUMNI" checked>
                                                        <label class="form-check-label" for="role">ALUMNI</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="role" id="role" value="STAFF">
                                                        <label class="form-check-label" for="role">STAFF</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="role" id="role" value="ADMIN">
                                                        <label class="form-check-label" for="role">ADMIN</label>
                                                    </div>
                                                </div>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <div class="form-group" align="middle" >
                                                    <span style="color:red; font-weight: bold; align-content: center;">
                                                        <br><%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%><br>
                                                    </span>

                                                    <input type="text" name="option" id="option" value = "submitNewUser" hidden>
                                                    <button type="submit" class="btn btn-success" name="button"><i class="fas fa-user-edit"></i> Submit</button>
                                                    <button type="reset" class="btn btn-danger" name="button2"><i class="fas fa-eraser"></i> Reset</button>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>                                
                                </table>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

       <script>
            function validate() { 
                var name = document.form.name.value;
                var email = document.form.email.value;
                var phoneNum = document.form.phoneNum.value; 
                var password = document.form.password.value;
                var conpassword= document.form.password2.value;
                var role= document.form.role.value;

                if (name==null || name=="") { 
                    alert("Name can't be blank"); 
                    return false; 
                }
                else if (email==null || email=="") { 
                    alert("Email can't be blank"); 
                    return false; 
                }
                else if (phoneNum==null || phoneNum=="") { 
                    alert("Phone Number can't be blank"); 
                    return false; 
                }
                else if(phoneNum.length<10) { 
                    alert("Invalid Phone Number length."); 
                    return false; 
                } 
                else if(password.length<8) { 
                    alert("Password must be at least 8 characters long."); 
                    return false; 
                } 
                else if (password!=conpassword) { 
                    alert("Confirm Password should match with the Password"); 
                    return false; 
                } 
                else if (role==null || role=="") { 
                    alert("Please choose your role"); 
                    return false; 
                } 
            } 
        </script> 
        
        <jsp:include page="../../allModules/footer.jsp" />

    </body>
</html>

