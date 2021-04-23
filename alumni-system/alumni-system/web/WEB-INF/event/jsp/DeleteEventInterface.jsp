<%-- 
    Document   : DeleteEventInterface
    Created on : Dec 29, 2020, 5:51:17 PM
    Author     : Amir Syafiq
--%>
<%@page import="java.util.Base64"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.controllers.event.*"%>
<%@page import="com.models.event.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! ManageEventControl MEC = new ManageEventControl(); %>
<%! Event event = new Event(); %>
<%-- MEC.fetchAllSavedEvent(request, response); --%> 
<%--  event.searchAllSavedEvent(request, response); --%>
<%!public interface DeleteEventInterface {

	public void deleteEventID();

	public void eventDeleteConfirmation();

	public void eventDeleteFailed();
 
        public void displayAllSavedEvent();
}%>

            
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update & Delete Event</title>
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
                width: 95%;
                padding: 10px 0 10px 200px;
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
                    <p class="navbar-brand">UPDATE AND DELETE EVENT</p>
                </div>
            </nav>
            
            <div class="jumbotron" style="padding-top:25px;padding-bottom: 10px;">
                <!-- Header/Home -->
                <header class="header-home">
                    <img src="https://brand.utm.my/files/2016/08/LOGO-UTM.png" style="width:30%"><br>
                    <br><p>FACULTY OF BUILT ENVIRONMENT, UNIVERSITI TEKNOLOGI MALAYSIA</p>
                </header>

                <% String message = (String)session.getAttribute("alertMsg");%>

                <% if(!message.equals("no")) { %>
                <script type="text/javascript">
                    var msg = "<%=message%>";
                    alert(msg);
                </script>
                <% } %>
                <div class="table-responsive">
                    <table class="table table-hover table-info table-striped">
                        <thead>
                            <tr>
                                <td><b>Title</b></td>
                                <td><b>Description</b></td>
                                <td><b>Category</b></td>
                                <td><b>Date</b></td>
                                <td><b>Time</b></td>
                                <td><b>Venue</b></td>
                                <td><b>Participant Capacity</b></td>
                                <td><b>Fee (RM)</b></td>
                                <td><b>Organizer</b></td>
                                <td><b>Image</b></td>
                                <td><b>Web Site</b></td>
                                <td><b>Sponsor</b></td>
                                <td><b>Sponsor Package </b></td>
                                <td><b>Sponsor Gathered Amount</b></td>
                                <td><b>Action</b></td>
                            </tr>
                        </thead>
                        <tbody>
                    <%
                        //Event event = new Event();
                        //event=(Event)session.getAttribute("event");
                        ArrayList<Event> eventlist = (ArrayList<Event>)session.getAttribute("eventlist");
                        for(int i=0; i<eventlist.size();i++)
                        {
                    %>
                            <tr>
                                <td><%=((Event)eventlist.get(i)).getEventTitle()%></td>
                                <td><%=((Event)eventlist.get(i)).getEventDescription()%></td>
                                <td><%=((Event)eventlist.get(i)).getEventCategory()%></td>
                                <td><%=((Event)eventlist.get(i)).getEventDate()%></td>
                                <td><%=((Event)eventlist.get(i)).getEventTime()%></td>
                                <td><%=((Event)eventlist.get(i)).getEventVenue()%></td>
                                <td><%=((Event)eventlist.get(i)).getEventCapacity()%></td>
                                <td><%=((Event)eventlist.get(i)).getEventFee()%></td>
                                <td><%=((Event)eventlist.get(i)).getEventOrganizer()%></td>
                                <td>
                                    <%
                                        byte eventImage2[] =((Event)eventlist.get(i)).getEventImage2();
                                        String imgDataBase64=new String(Base64.getEncoder().encode(eventImage2));
                                    %>
                                    <img src="data:image/gif;base64,<%= imgDataBase64 %>" alt="No images" width="100px" height="100px"/>
                                </td>
                                <td><a href="<%=((Event)eventlist.get(i)).getEventWebsite()%>"><%=((Event)eventlist.get(i)).getEventWebsite()%></a></td>
                                <td><%=((Event)eventlist.get(i)).isEventSponsor()%></td>
                                <td><%=((Event)eventlist.get(i)).getEventSponsorPackageAmt()%></td>
                                <td><%=((Event)eventlist.get(i)).getEventSponsorGatheredAmt()%></td>

                                <% int eventID =((Event)eventlist.get(i)).getEventID(); %>
                                <td> 
                                    <form  name="DeleteEventForm" action="${pageContext.request.contextPath}/ManageEventControl" method="post">
                                        <label>       
                                            <input type="hidden" name="eventID" value=<%=eventID %> >
                                            <input class="btn btn-primary btn-sm" type="submit" name="button5" id="update" value="Update">
                                        </label> 
                                        <label>
                                            <input class="btn btn-danger btn-sm" type="submit" name="button6" id="delete" value="Delete">
                                        </label>
                                    </form>
                                </td>    
                            </tr>
                        <%  } %>
                        </tbody>            
                    </table> 
                </div>

                <table border="0" align="center" style="margin-top:10px;">
                    <tr>
                        <td>
                            <a href="ManageEventControl?option=Event Menu" class="btn btn-success">Event Menu</a>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    <jsp:include page="../../allModules/footer.jsp" />
<%  } %>   
    </body>
</html>
