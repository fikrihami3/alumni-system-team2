<%-- 
    Document   : RegisterPage
    Created on : Dec 31, 2020, 10:19:08 PM
    Author     : nurfa
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>REGISTER ACCOUNT</title>
        
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

        <style type="text/css">
            body{ 
                font: 14px sans-serif; 
                background-image: url('');
                background-repeat: no-repeat;
                background-attachment: fixed;  
                background-size: cover;
                }
            .wrapper{ width: 350px; padding: 20px; }
            .container {
                position: relative;
                padding-top: 100px;
            }
            .center {
                position: absolute;
                top: 50%;
                width: 100%;
                text-align: center;
                font-size: 14px;
            }
            .ridge {border-style: ridge;}
            .register-container {
                width: 80%;
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
                text-align: center;
            }
        </style>
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
                else if(phoneNum.length<10) { 
                    alert("Invalid Phone Number length."); 
                    return false; 
                } 
                else if(password.length<8) { 
                    alert("Password must be at least 8 characters long."); 
                    return false; 
                } 
                else if (password!==conpassword) { 
                    alert("Confirm Password should match with the Password"); 
                    return false; 
                } 
                else if (role===null || role==="") { 
                    alert("Please choose your role"); 
                    return false; 
                } 
            } 
        </script> 
    </head>
    <body>
        <!-- Page Content -->
        <div class="container">
            <div class="center">
                <nav class="navbar navbar-dark bg-dark">
                    <div style="height:36px">
                        <p class="navbar-brand"><i class="fas fa-user-plus"></i> REGISTER</p>
                    </div>
                </nav>
                <div class="jumbotron" style="padding-top:25px;padding-bottom:5px;">

                    <!-- Header/Home -->
                    <header class="header-home">
                        <img src="https://brand.utm.my/files/2016/08/LOGO-UTM.png" style="width:30%"><br>
                        <br><p>FACULTY OF BUILT ENVIRONMENT, UNIVERSITI TEKNOLOGI MALAYSIA</p>
                    </header>

                    <div class="register-container">
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
                                                <div class="col-sm-8">
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
                                                <div class="col-sm-8">
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
                                                <div class="col-sm">
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

                                                <p>Already have an account? <a href="ManageUserController?option=viewLoginPage">Login here</a>.</p>
                                                <input type="text" name="option" id="option" value = "register" hidden>
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
        <!-- END PAGE CONTENT -->
    </body>
</html>