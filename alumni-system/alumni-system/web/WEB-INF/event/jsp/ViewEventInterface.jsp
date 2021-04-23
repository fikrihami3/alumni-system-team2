<%-- 
    Document   : ViewEventInterface
    Created on : Dec 29, 2020, 5:54:51 PM
    Author     : Amir Syafiq
--%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Base64"%>
<%@page import="com.controllers.event.*"%>
<%@page import="com.models.event.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! ManageEventControl MEC = new ManageEventControl(); %>
<%! Event event = new Event(); %>


<%!public interface ViewEventInterface {

	public void returnAllSavedEvent();

	public void selectEvent();

	public void returnSavedEvent();

}%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' href='style.css'/>
        <title>View Event</title>
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
                    <p class="navbar-brand">EVENT DETAILS</p>
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
            <%ArrayList<Event> eventlist = (ArrayList<Event>)session.getAttribute("eventlistupdate");%>
            
        <%
            int i=0;
        %>
            
        <form  name="ViewEventInterface" action="${pageContext.request.contextPath}/ViewPageControl" method="post">
        <div class="container pb-5">
            <div class="row align-items-center pt-4">
                <div class="col">
                    <div class="card p-3 mb-2 bg-light text-dark" style="width: 25rem;">
                        <%
                            byte eventImage2[] =((Event)eventlist.get(i)).getEventImage2();
                            String imgDataBase64=new String(Base64.getEncoder().encode(eventImage2));
                            if(imgDataBase64!=null)
                            {
                        %>
                                <img src="data:image/gif;base64,<%= imgDataBase64 %>" alt="No images" class="card-img-top"/>
                        <%
                            }
                            else
                            {   
                        %>
                                 <img src="assets/images\No_Image_Available.jpg" alt="No images2" class="card-img-top"/>
                        <%}%>
                    </div>
                </div>
                <div class="col">
                    <div class="card p-3 mb-2 bg-light text-dark" style="width: 40rem;">
                        <div class="card-body">
                            <h5 class="card-title" style="color: blue"><b><%=((Event)eventlist.get(i)).getEventTitle()%></b></h5>
                            <p class="card-text"><b>Category:</b> <%=((Event)eventlist.get(i)).getEventCategory()%></p>
                            <p class="card-text"><b>Date:</b> <%=((Event)eventlist.get(i)).getEventDate()%></p>
                            <p class="card-text"><b>Time:</b> <%=((Event)eventlist.get(i)).getEventTime()%></p>
                            <p class="card-text"><b>Venue:</b> <%=((Event)eventlist.get(i)).getEventVenue()%></p>
                            <p class="card-text"><b>Fee:</b> RM<%=((Event)eventlist.get(i)).getEventFee()%></p>
                            <p class="card-text"><b>Organizer:</b> <%=((Event)eventlist.get(i)).getEventOrganizer()%></p>
                            <p class="card-text"><b>Website:</b> <a href="<%=((Event)eventlist.get(i)).getEventWebsite()%>"><%=((Event)eventlist.get(i)).getEventWebsite()%></a></p>
                            <p class="card-text"><b>Capacity:</b> <%=((Event)eventlist.get(i)).getEventCapacity()%></p>
                            <p class="card-text"><b>Description: </b><%=((Event)eventlist.get(i)).getEventDescription()%></p>
                            <% int eventID =((Event)eventlist.get(i)).getEventID(); %>
                            <%if(((Event)eventlist.get(i)).getEventCapacity()>0){%>
                                <input type="hidden" name="eventID" value=<%=eventID %> >
                                <input type="submit" class="btn btn-outline-primary" name="buttonJoin" id="Join" value="Join Event">
                            <%}%>
                            <%if(((Event)eventlist.get(i)).isEventSponsor()){%>
                                <input type="hidden" name="eventID" value=<%=eventID %> >
                                <input type="submit" class="btn btn-outline-primary" name="buttonSponsor" id="Sponsor" value="Sponsor Event">
                            <%}%>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row align-items-end">
                <div class="d-grid gap-2 col-2 mx-auto pt-2">
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
                <form  name="ViewEventInterface" action="${pageContext.request.contextPath}/ViewPageControl" method="post">
                    <div class="viewEvent4">
                        <h1><%=((Event)eventlist.get(i)).getEventTitle()%></h1><br>
                    </div>
                    <div style="display: flex; justify-content: center;">
                        <%
                            byte eventImage2[] =((Event)eventlist.get(i)).getEventImage2();
                            String imgDataBase64=new String(Base64.getEncoder().encode(eventImage2));
                            if(imgDataBase64!=null)
                            {
                        %>
                                <img src="data:image/gif;base64,<%= imgDataBase64 %>" alt="No images" max-width="200px" max-height="500px"/><br>
                        <%
                            }
                            else
                            {   
                        %>
                                 <img src="images\No_Image_Available.jpg" alt="No images2" max-width="200px" max-height="500px"/><br>
                        <%}%>
                    </div>

                    <div class="viewEvent4">
                        <p style="color: blue;">Category: <%=((Event)eventlist.get(i)).getEventCategory()%></p><br>
                    </div>
                    <div class="viewEvent4">
                        <div style="margin-right: 20px;">
                            <b>Date:</b> <%=((Event)eventlist.get(i)).getEventDate()%><br>
                            <b>Time:</b> <%=((Event)eventlist.get(i)).getEventTime()%><br>
                            <b>Venue:</b> <%=((Event)eventlist.get(i)).getEventVenue()%><br>
                            <b>Fee:</b>RM<%=((Event)eventlist.get(i)).getEventFee()%><br>
                        </div>
                        <div>
                            <b>Organizer</b> <%=((Event)eventlist.get(i)).getEventOrganizer()%><br>
                            <b>Website:</b> <a href="<%=((Event)eventlist.get(i)).getEventWebsite()%>"><%=((Event)eventlist.get(i)).getEventWebsite()%></a><br>
                            <b>Capacity:</b> <%=((Event)eventlist.get(i)).getEventCapacity()%><br>
                        </div>
                    </div>
                   
                    <div class="viewEvent4">
                        <p><%=((Event)eventlist.get(i)).getEventDescription()%></p><br>
                    </div>
                
                
                
                            <% int eventID =((Event)eventlist.get(i)).getEventID(); %>
                    <div class="viewEvent5"> 
                        <div style="margin-right: 20px;"> 
                            <label>  
                                 <%if(((Event)eventlist.get(i)).getEventCapacity()>0){%>
                                <input type="hidden" name="eventID" value=<%=eventID %> >
                                <input type="submit" name="buttonJoin" id="Join" value="Join Event">
                                <%}%>  
                            </label>
                        </div>
                        <div> 
                            <label>
                                <%if(((Event)eventlist.get(i)).isEventSponsor()){%> 
                                
                                <input type="hidden" name="eventID" value=<%=eventID %> >
                                <input type="submit" name="buttonSponsor" id="Sponsor" value="Sponsor">
                                <%}%>  
                            </label>
                        </div>
                    </div>
        </form>
            
            </div>--%>
<%--            <div>
                <form action="ViewPageInterface.jsp">
                <table border="0" align="center">
                  <tr>
                    <td><input type="submit" value="Main Menu" /></td>
                  </tr>
                </table>
                </form>
            </div>--%>
        <jsp:include page="../../allModules/footer.jsp" />
<%  } %>
    </body>
</html>