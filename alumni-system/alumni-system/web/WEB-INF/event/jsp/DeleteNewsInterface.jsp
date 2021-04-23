<%-- 
    Document   : DeleteNewsInterface
    Created on : Dec 29, 2020, 5:51:32 PM
    Author     : Amir Syafiq
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.controllers.event.*"%>
<%@page import="com.models.event.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! ManageNewsControl MNC = new ManageNewsControl(); %>
<%! News news = new News(); %>

<%!public interface DeleteNewsInterface {

	public void deleteNewsID();

	public void newsDeleteConfirmation();

	public void newsDeleteFailed();

}%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update & Delete News</title>
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
                    <p class="navbar-brand">UPDATE AND DELETE NEWS</p>
                </div>
            </nav>
            
            <div class="jumbotron" style="padding-top:25px;padding-bottom: 10px;">
                <!-- Header/Home -->
                <header class="header-home">
                    <img src="https://brand.utm.my/files/2016/08/LOGO-UTM.png" style="width:30%"><br>
                    <br><p>FACULTY OF BUILT ENVIRONMENT, UNIVERSITI TEKNOLOGI MALAYSIA</p>
                </header>
            <% String message = (String)session.getAttribute("alertMsg");%>

            <% if(!message.equals("no")){ %>
                <script type="text/javascript">
                    var msg = "<%=message%>";
                    alert(msg);
                </script>
            <%}%>
                <div class="table-responsive">
                    <table class="table table-hover table-info table-striped">

                    <tr>
                        <td><b>Title</b></td>
                        <td><b>Category</b></td>
                        <td><b>Description</b></td>
                        <td><b>Web Site</b></td>
                        <td colspan="2"><b>Action</b></td>

                    </tr>

                        <%
                            //Event event = new Event();
                            //event=(Event)session.getAttribute("event");
                        %>
                        <%ArrayList<News> newslist = (ArrayList<News>)session.getAttribute("newslist");%>

                        <%--<jsp:useBean id="event" class="Model.Event" scope="session" />
                        <td><% event.getEventTitle();%></td>
                        <td><jsp:getProperty name="event" property="eventTitle"/></td>
                        <td><jsp:getProperty name="event" property="eventDescription"/></td>
                        <td><jsp:getProperty name="event" property="eventCategory"/></td>
                        <td><jsp:getProperty name="event" property="eventDate"/></td>
                        <td><jsp:getProperty name="event" property="eventTime"/></td>
                        <td><jsp:getProperty name="event" property="eventVenue"/></td>
                        <td><jsp:getProperty name="event" property="eventCapacity"/></td>
                        <td><jsp:getProperty name="event" property="eventFee"/></td>
                        <td><jsp:getProperty name="event" property="eventOrganizer"/></td>
                        <td><jsp:getProperty name="event" property="eventImage"/></td>
                        <td><a href="<jsp:getProperty name="event" property="eventWebsite"/>">Link</a></td>
                        <td><jsp:getProperty name="event" property="eventSponsor"/></td>
                        <td><jsp:getProperty name="event" property="eventSponsorPackageAmt"/></td>
                        <td><jsp:getProperty name="event" property="eventSponsorGatheredAmt"/></td>--%>

                        <%
                            for(int i=0; i<newslist.size();i++)
                            {
                        %>
                    <form  name="DeleteNewstInterface" action="${pageContext.request.contextPath}/ManageNewsControl" method="post">
                            <tr>
                            <td><%=((News)newslist.get(i)).getNewsTitle()%></td>      
                            <td><%=((News)newslist.get(i)).getNewsCategory()%></td>
                            <td><%=((News)newslist.get(i)).getNewsArticle()%></td>
                            <td><a href="<%=((News)newslist.get(i)).getNewsWebsite()%>"><%=((News)newslist.get(i)).getNewsWebsite()%></a></td>

                            <% int newsID =((News)newslist.get(i)).getNewsID(); %>

                        <td> <label>       
                            <input type="hidden" name="newsID" value=<%=newsID %> >
                            <input class="btn btn-primary btn-sm" type="submit" name="button5" id="update" value="Update">
                        </label></td>    
                        <td> <label>
                         <%--untuk sponsor nnti--%>
                         <%-- if(((Event)eventlist.get(i)).isEventSponsor()){--%> 

                            <input type="hidden" name="newsID" value=<%=newsID %> >
                            <input class="btn btn-danger btn-sm" type="submit" name="button6" id="delete" value="Delete">


                        </label></td></tr>
                    </form>
                        <%--}--%>  
                        <%

                            }
                        %>
                    </table>
                </div>

                <table border="0" align="center">
                    <div class="d-grid gap-2 col-2 mx-auto pb-4">
                        <a href="ManageNewsControl?option=News Menu" class="btn btn-success">                           
                            News Menu
                        </a>       
                    </div>
                </table>
            </div>
        </div>
        <jsp:include page="../../allModules/footer.jsp" />
<%  } %>            
    </body>
</html>
