<%-- 
    Document   : ViewNewsInterface
    Created on : Dec 29, 2020, 5:55:07 PM
    Author     : Amir Syafiq
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Base64"%>
<%@page import="com.models.event.*"%>
<%@page import="com.controllers.event.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! ManageNewsControl MCC = new ManageNewsControl(); %>
<%! News news = new News(); %>

<%!public interface ViewNewsInterface {

	public void returnAllSavedNews();

	public void selectNews();

	public void returnSavedNews();

}%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' href='style.css'/>
        <title>View News</title>
        <link rel='stylesheet' href='style.css'/>
        
        <jsp:include page="../../allModules/bootstrap4.jsp" />
        
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
                text-align: center;
            }
            @media only screen and (max-width: 600px) {.container-custom {padding-left: 10px; padding-top: 110px;}}
        </style>
    </head>
    <body>
        <%  if(session.getAttribute("user") != null) { %>

        <jsp:include page="../../allModules/sideNavigationBar.jsp" />
        
        <div class="container-custom">
            
            <nav class="navbar navbar-dark bg-dark">
                <div style="height:36px">
                    <p class="navbar-brand">READ NEWS</p>
                </div>
            </nav>
            
            <div class="jumbotron" style="padding-top:25px;padding-bottom: 10px;">
                <!-- Header/Home -->
                <header class="header-home">
                    <img src="https://brand.utm.my/files/2016/08/LOGO-UTM.png" style="width:30%"><br>
                    <br><p>FACULTY OF BUILT ENVIRONMENT, UNIVERSITI TEKNOLOGI MALAYSIA</p>
                </header>
        
        <% 
        String message = (String)session.getAttribute("alertMsg");
        %>

        <% if(!message.equals("no")){ %>
            <script type="text/javascript">
            var msg = "<%=message%>";
            alert(msg);
        </script>
        <%}%>
            <%ArrayList<News> newslist = (ArrayList<News>)session.getAttribute("newslistupdate");%>
            
            <%
                int i=0;
            %>
            
        <form  name="ViewNewsInterface" action="${pageContext.request.contextPath}/ViewPageControl" method="post">
        <div class="container pb-5">
            <div class="row align-items-center pt-4 justify-content-center">
                <div class="col">
                    <div class="card p-3 mb-2 bg-light text-dark justify-content-center" style="width: auto;">
                        <div class="card-body">
                            <h5 class="card-title" style="color: blue"><b><%=((News)newslist.get(i)).getNewsTitle()%></b></h5>
                            <p class="card-text"><b>Category:</b> <%=((News)newslist.get(i)).getNewsCategory()%></p>
                            <p class="card-text"><b>Article:</b> <%=((News)newslist.get(i)).getNewsArticle()%></p>
                            <p class="card-text"><b>Website:</b> <a href="<%=((News)newslist.get(i)).getNewsWebsite()%>" >Go to Website</a></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row align-items-end">
                <div class="d-grid gap-2 col-1 mx-auto pt-2">
                    <form action="${pageContext.request.contextPath}/ViewPageControl" method="post">
                        <input type="submit" class="btn btn-success btn-lg" name="button" value="Main Menu" />
                    </form>                                         
                </div>
            </div>
        </div>
        </form>
    </div>
</div>      
<%--            <div class="viewEvent3">
            <%
                int i=0;
            %>
                <form  name="ViewNewsInterface" action="${pageContext.request.contextPath}/ViewPageControl" method="post">
                    <div class="viewEvent4">
                        <h1><%=((News)newslist.get(i)).getNewsTitle()%></h1><br>
                    </div>
                    <div class="viewEvent4">
                        <b>Category</b> <%=((News)newslist.get(i)).getNewsCategory()%><br>
                    </div>
                    <div class="viewEvent4">
                        <p><%=((News)newslist.get(i)).getNewsArticle()%></p><br>
                    </div>
                    <div class="viewEvent4">
                        <p>Website:<p> <a href="<%=((News)newslist.get(i)).getNewsWebsite()%>" >Go to website</a><br>
                    </div>

                     
                   
        </form>
            
            </div>--%>
<%--            <div>
                <form action="${pageContext.request.contextPath}/ViewPageControl" method="post">
                <table border="0" align="center">
                  <tr>
                    <td><input type="submit" name="button" value="Main Menu" /></td>
                  </tr>
                </table>
                </form>
            </div>--%>
            
        <jsp:include page="../../allModules/footer.jsp" />
<%  } %>
    </body>
</html>