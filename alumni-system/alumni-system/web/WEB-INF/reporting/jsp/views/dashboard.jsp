<%-- 
    Document   : dashboard
    Created on : Dec 28, 2020, 2:37:40 PM
    Author     : hafizul
--%>

<%@page import="com.models.user.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
        
        <style>
            .custom-shadow {
                box-shadow: rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;
            }
            .center {
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .container-custom {
                display: block;
                margin-right: auto;
                margin-left: auto;
                width: 80%;
                padding: 10px 0 10px 150px;
            }
            .header-home {
                margin-top: -25px;
                text-align: center;
            }
            @media only screen and (max-width: 600px) {.container-custom {padding-left: 10px; padding-top: 110px;}}
        </style>
    </script>
    </head>
        <body>
            <%  if(session.getAttribute("user") != null) { %>
            
            <jsp:include page="../../../allModules/sideNavigationBar.jsp" />
            
            <%  String userRole = ((User)session.getAttribute("user")).getRole(); %>
            <div class="container-custom">
                <nav class="navbar navbar-dark bg-dark">
                    <div style="height:36px">
                        <p class="navbar-brand"><i class="fas fa-chart-line"></i> DASHBOARD</p>
                    </div>
                </nav>
                
                <div class="jumbotron">
                    <!-- Header/Home -->
                    <header class="header-home">
                        <img src="https://brand.utm.my/files/2016/08/LOGO-UTM.png" style="width:30%"><br>
                        <br><p>FACULTY OF BUILT ENVIRONMENT, UNIVERSITI TEKNOLOGI MALAYSIA</p>
                    </header>

                    <div class="table-responsive">
                        <table class="table table-light custom-shadow">
                            <tr>
                                <td><jsp:include page="../components/graphNumberAlumniGraduatePerYearDiploma.jsp" /></td>
                                <td><jsp:include page="../components/graphNumberAlumniGraduatePerYearBachelor.jsp" /></td>
                            </tr>
                            <tr>
                                <td><jsp:include page="../components/graphNumberAlumniGraduatePerYearMaster.jsp" /></td>
                                <td><jsp:include page="../components/graphAlumniQualification.jsp" /></td>
                            </tr>
                            <tr>
                                <% if(!userRole.equalsIgnoreCase("alumni")) { %>
                                <td><jsp:include page="../components/graphAlumniNationality.jsp" /></td>
                                <td><jsp:include page="../components/graphAlumniSponsorship.jsp" /></td>
                                <%  } %>
                            </tr>
                            <tr>
                                <% if(!userRole.equalsIgnoreCase("alumni")) { %>
                                <td><jsp:include page="../components/graphAlumniStatus.jsp" /></td>
                                <%  } %>
                                <td><jsp:include page="../components/graphNumberEventPerYear.jsp" /></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <jsp:include page="../../../allModules/footer.jsp" />
            <%  } %>
      </body>
</html>


</html>