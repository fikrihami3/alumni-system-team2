<%-- 
    Document   : LoginPage
    Created on : Dec 31, 2020, 10:18:05 PM
    Author     : nurfa
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <title>LOGIN ACCOUNT</title>

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
        }
        .center {
            position: absolute;
            top: 50%;
            width: 100%;
            text-align: center;
            font-size: 14px;
            
            margin-top: 50px;
            padding-left: 20px;
            padding-right: 20px;
        }
        .custom-shadow {
            box-shadow: 
                rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, 
                rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, 
                rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;
        }
        .form-login {
            width: 50%;
            display: block;
            margin-right: auto;
            margin-left: auto;
            padding-top: 20px;
            padding-bottom: 20px;
        }
        .header-home {
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="center">
            <nav class="navbar navbar-dark bg-dark">
                <div style="height:36px">
                    <p class="navbar-brand"><i class="fa fa-key"></i> LOGIN</p>
                </div>
            </nav>
            <div class="jumbotron" style="padding-top:25px;">
                <!-- Header/Home -->
                <header class="header-home">
                    <img src="https://brand.utm.my/files/2016/08/LOGO-UTM.png" style="width:30%"><br>
                    <br><p>FACULTY OF BUILT ENVIRONMENT, UNIVERSITI TEKNOLOGI MALAYSIA</p>
                </header>

                <div class="table-responsive">
                    <form name="form" action="ManageUserController" method="post" class="form-login">
                        <table class="table table-striped table-light custom-shadow" style="background-color:white;">
                            <thead class="thead-dark">
                                <tr>    
                                    <th>LOGIN</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="col">
                                        <div class="form-group row">
                                            <label for="email" class="col-sm-2 col-form-label" style="font-weight: bolder;">EMAIL</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" name="email" id="email" required size = "100%">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="col">
                                        <div class="form-group row">
                                            <label for="email" class="col-sm-2 col-form-label" style="font-weight: bolder;">PASSWORD</label>
                                            <div class="col-sm-10">
                                                <input type="password" class="form-control" name="password" id="password" required size = "100%">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="col">
                                        <center>
                                            <span style="color:red; font-weight: bold; align-content: center;">
                                                <br><%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%><br>
                                            </span>

                                            <p>Don't have an account? <a href="ManageUserController?option=viewRegisterPage">Sign up now</a>.</p>
                                            <label>
                                                <input type="text" name="option" id="option" value = "login" hidden>
                                                <button type="submit" class="btn btn-primary custom-shadow" name="button" id="button"><i class="fas fa-sign-in-alt"></i> LOGIN</button>
                                            </label>
                                        </center>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>