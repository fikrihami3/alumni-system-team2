<%-- 
    Document   : UpdateEventInterface
    Created on : Dec 29, 2020, 5:54:14 PM
    Author     : Amir Syafiq
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.models.event.*"%>
<%@page import="com.controllers.event.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! ManageEventControl MEC = new ManageEventControl(); %>
<%! Event event = new Event(); %>

<%!public interface UpdateEventInterface {

	public void eventUpdateConfirmation();

	public void eventUpdateFailed();

	/**
	 * 
	 * @param eventCapacity
	 * @param eventCategory
	 * @param eventDate
	 * @param eventDescription
	 * @param eventFee
	 * @param eventImage
	 * @param eventOrganizer
	 * @param eventTime
	 * @param eventTitle
	 * @param eventSponsor
	 * @param eventVenue
	 * @param eventSponsorPackageAmt
	 * @param eventWebsite
	 * @param eventSponsorGatheredAmt
	 */
	public void updateSavedEventData(int eventCapacity, String eventCategory, String eventDate, String eventDescription, double eventFee, String eventImage, String eventOrganizer, String eventTime, String eventTitle, boolean eventSponsor, String eventVenue, double eventSponsorPackageAmt, String eventWebsite, double eventSponsorGatheredAmt);

	public void updateEventID();

	public void returnSavedEventData();

}%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Event</title>
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
                    <p class="navbar-brand">UPDATE EVENT</p>
                </div>
            </nav>
            
            <div class="jumbotron" style="padding-top:25px;padding-bottom: 0;">
                <!-- Header/Home -->
                <header class="header-home">
                    <img src="https://brand.utm.my/files/2016/08/LOGO-UTM.png" style="width:30%"><br>
                    <br><p>FACULTY OF BUILT ENVIRONMENT, UNIVERSITI TEKNOLOGI MALAYSIA</p>
                </header>
        
        <table align="center" cellpadding="5" cellspacing="5" border="1">
        <%ArrayList<Event> eventlist = (ArrayList<Event>)session.getAttribute("eventlistupdate");      
            int i=0;
        %>        
        <form  name="UpdateEventform" method="post" action="ManageEventControl" enctype="multipart/form-data">
        <div class="container pb-5">
            <div class="row align-items-start justify-content-center"></div>
            <div class="row align-items-center pt-4">
                <div class="col">
                    <div class="card mb-2 bg-light text-dark" style="width: auto;">
                        <div class="card-body">
                            <div class="row g-2 p-2">
                                <div class="col">
                                  <div class="form-floating">
                                    <label for="floatingInput">Event Title</label>
                                    <input type="text" class="form-control" id="floatingInput" placeholder="Title of Event" name="eventTitle" value=" <%=((Event)eventlist.get(i)).getEventTitle()%>" size="100" required>                                    
                                  </div>
                                </div>
                                <div class="col-md">
                                  <div class="form-floating">
                                    <label for="floatingInput">Event Category</label>
                                    <input type="text" class="form-control" id="floatingInput" placeholder="Category of Event" name="eventCategory" value="<%=((Event)eventlist.get(i)).getEventCategory()%>" size="100" required>                                    
                                  </div>
                                </div>
                            </div>
                            <div class="row g-2 p-2">
                                <div class="col">
                                  <div class="form-floating">
                                    <label for="floatingInput">Event Description</label>
                                    <input type="text" class="form-control" id="floatingInput" placeholder="Description of Event" name="eventDescription" value="<%=((Event)eventlist.get(i)).getEventDescription()%>" size="100" required>                                    
                                  </div>
                                </div>
                            </div>
                            <div class="row g-2 p-2">
                                <div class="col">
                                  <div class="form-floating">
                                    <label for="floatingInput">Event Date</label>
                                    <input type="date" class="form-control" id="floatingInput" placeholder="Date of Event" name="eventDate" value="<%=((Event)eventlist.get(i)).getEventDate()%>" size="100" required>                                    
                                  </div>
                                </div>
                                <div class="col-md">
                                  <div class="form-floating">
                                    <label for="floatingInput">Event Time</label>
                                    <input type="time" class="form-control" id="floatingInput" placeholder="Time of Event" name="eventTime" value="<%=((Event)eventlist.get(i)).getEventTime()%>" size="100" required>                                    
                                  </div>
                                </div>
                                <div class="col-md">
                                  <div class="form-floating">
                                    <label for="floatingSelect">Event Venue</label>
                                    <input type="text" class="form-control" id="floatingInput" placeholder="Venue of Event" name="eventVenue" value="<%=((Event)eventlist.get(i)).getEventVenue()%>" size="100" required>                                    
                                  </div>
                                </div>
                            </div>
                            <div class="row g-2 p-2">
                                <div class="col">
                                  <div class="form-floating">
                                    <label for="floatingInput">Event Capacity</label>
                                    <input type="int" class="form-control" id="floatingInput" placeholder="Maximum Number of Participant" name="eventCapacity" value="<%=((Event)eventlist.get(i)).getEventCapacity()%>" size="100" required>                                    
                                  </div>
                                </div>
                                <div class="col-md">
                                  <div class="form-floating">
                                    <label for="floatingInput">Event Fee</label>
                                    <input type="text" class="form-control" id="floatingInput" placeholder="Fee of Event" name="eventFee" value="<%=((Event)eventlist.get(i)).getEventFee()%>" size="100" required>                                    
                                  </div>
                                </div>
                            </div>
                            <div class="row g-2 p-2">
                                <div class="col">
                                  <div class="form-floating">
                                    <label for="floatingInput">Event Organizer</label>
                                    <input type="text" class="form-control" style="height:42px;" id="floatingInput" placeholder="Organizer of the Event" name="eventOrganizer" value="<%=((Event)eventlist.get(i)).getEventOrganizer()%>" size="100" required>                                    
                                  </div>
                                </div>
                                <div class="col-md">
                                  <div class="form-floating">
                                    <label for="floatingInput">Event Website</label>
                                    <input type="text" class="form-control" style="height:42px;" id="floatingInput" placeholder="Website Link of the Event" name="eventWebsite" value="<%=((Event)eventlist.get(i)).getEventWebsite()%>" size="100" required>                                    
                                  </div>
                                </div>
                                <div class="col-md">
                                  <div class="form-floating">
                                    <label for="floatingSelect">Event Image</label>
                                    <input type="file" class="form-control" style="height:42px;" id="floatingInput" placeholder="Image of the Event" name="eventImage" value="<%=((Event)eventlist.get(i)).getEventImage()%>" size="100" required>                                    
                                  </div>
                                </div>
                            </div>
                            <div class="row g-2 p-2">
                                <div class="col">
                                  <div class="form-floating">
                                    <label for="floatingInput">Event Sponsor</label>
                                    <% if(((Event)eventlist.get(i)).isEventSponsor()){%>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="eventSponsor" value="1" id="flexRadioDefault1" checked>
                                        <label class="form-check-label" for="flexRadioDefault1">
                                            Yes
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="eventSponsor" value="0" id="flexRadioDefault2">
                                        <label class="form-check-label" for="flexRadioDefault2">
                                            No
                                        </label>
                                    </div>
                                    <%}else{%>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="eventSponsor" value="1" id="flexRadioDefault1">
                                        <label class="form-check-label" for="flexRadioDefault1">
                                            Yes
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="eventSponsor" value="0" id="flexRadioDefault2" checked>
                                        <label class="form-check-label" for="flexRadioDefault2">
                                            No
                                        </label>
                                    </div>
                                    <%}%>
                                  </div>
                                </div>
                                <div class="col">
                                  <div class="form-floating">
                                    <label for="floatingInput">Event Sponsor Package Amount</label>
                                    <input type="text" class="form-control" id="floatingInput" placeholder="Sponsor Package Amount of Event" name="eventSponsorPackageAmt" value="<%=((Event)eventlist.get(i)).getEventSponsorPackageAmt()%>" size="100" value="0.00" required>                                    
                                  </div>
                                </div>
                            </div>
                        </div>
                    </div>
                                  
                    <div class="d-grid gap-2 mx-auto pt-1" style="width:260px;display: block;margin-right: auto;margin-left: auto;">
                        <% int eventID =((Event)eventlist.get(i)).getEventID(); %>
                        <input type="hidden" name="eventID" value=<%=eventID %> >
                        <input class="btn btn-warning" type="reset" id="buttonreset" style="width:125px" name="buttonreset" value="Reset Form">
                        <input class=" btn btn-primary" type="submit" id="button7" style="width:125px" name="button7" value="Update Event">                            
                    </div>
                    <div class="d-grid gap-2 mx-auto pt-2" style="width:150px;display: block;margin-right: auto;margin-left: auto;">
                        <a href="ManageEventControl?option=Event Menu" style="width:100%" class="btn btn-success">Event Menu</a>       
                    </div>
                </div>
            </div>
            <div class="row align-items-end"></div>
        </div>  
      </form>
     </table>
   </div>
</div>   
<%--        <%ArrayList<Event> eventlist = (ArrayList<Event>)session.getAttribute("eventlistupdate");
        
            int i=0;
        %>
        
              
      <table align="center" width="500" border="5" cellspacing="5" cellpadding="5">
          
        <tr>
          <th width="72" scope="row">
              <div align="left">Event Title</div></th>
          <td width="240">
              <label>
                  <input type="text" name="eventTitle" id="eventTitle" value=" <%=((Event)eventlist.get(i)).getEventTitle()%>" size="100">
              </label>
          </td>
        </tr>
        
        <tr>
          <th scope="row">
              <div align="left">Event Description</div>
          </th>
          <td>
              <label>
                  <input type="text" name="eventDescription" id="eventDescription" value="<%=((Event)eventlist.get(i)).getEventDescription()%>" size="100" required>
              </label>
          </td>
        </tr>
        
        <tr>
          <th scope="row">
              <div align="left">Event Category</div>
          </th>
          <td>
              <label>
                  <input type="text" name="eventCategory" id="eventCategory" value="<%=((Event)eventlist.get(i)).getEventCategory()%>" size="100" required>
              </label>
          </td>
        </tr>
        
        <tr>
          <th scope="row">
              <div align="left">Event Date</div>
          </th>
          <td>
              <label>
                  <input type="date" name="eventDate" id="eventDate" value="<%=((Event)eventlist.get(i)).getEventDate()%>" size="100" required>
              </label>
          </td>
        </tr>
        
        <tr>
          <th scope="row">
              <div align="left">Event Time</div>
          </th>
          <td>
              <label>
                  <input type="time" name="eventTime" id="eventTime" value="<%=((Event)eventlist.get(i)).getEventTime()%>" size="100" required>
              </label>
          </td>
        </tr>
        
        <tr>
          <th scope="row">
              <div align="left">Event Venue</div>
          </th>
          <td>
              <label>
                  <input type="text" name="eventVenue" id="eventVenue" value="<%=((Event)eventlist.get(i)).getEventVenue()%>" size="100" required>
              </label>
          </td>
        </tr>
        
        <tr>
          <th scope="row">
              <div align="left">Event Participant Capacity</div>
          </th>
          <td>
              <label>
                  <input type="int" name="eventCapacity" id="eventCapacity" value="<%=((Event)eventlist.get(i)).getEventCapacity()%>" vsize="100">
              </label>
          </td>
        </tr>
        
        <tr>
          <th scope="row">
              <div align="left">Event Fee</div>
          </th>
          <td>
              <label>
                  <input type="text" name="eventFee" id="eventFee" value="<%=((Event)eventlist.get(i)).getEventFee()%>" size="100">
              </label>
          </td>
        </tr>
        
        <tr>
          <th scope="row">
              <div align="left">Event Organizer</div>
          </th>
          <td>
              <label>
                  <input type="text" name="eventOrganizer" id="eventOrganizer" value="<%=((Event)eventlist.get(i)).getEventOrganizer()%>" size="100" required>
              </label>
          </td>
        </tr>
        
        <tr>
          <th scope="row">
              <div align="left">Event Image</div>
          </th>
          <td>
              <label>
                  <input type="file" name="eventImage" value="<%=((Event)eventlist.get(i)).getEventImage()%>" id="eventImage">
              </label>
          </td>
        </tr>
        
        <tr>
          <th scope="row">
              <div align="left">Event Website</div>
          </th>
          <td>
              <label>
                  <input type="text" name="eventWebsite" value="<%=((Event)eventlist.get(i)).getEventWebsite()%>" id="eventWebsite" size="100">
              </label>
          </td>
        </tr>
        
        <tr>
          <th scope="row">
              <div align="left">Event Sponsor</div>
          </th>
          <td>
              <label>
                  <% if(((Event)eventlist.get(i)).isEventSponsor()){%>
                        <input type="radio" name="eventSponsor" checked value="1">Yes
                        <br>
                        <input type="radio" name="eventSponsor" value="0">No
                  <%}
                    else{%>
                        <input type="radio" name="eventSponsor" value="1">Yes
                        <br>
                        <input type="radio" name="eventSponsor" checked value="0">No
                  <%}%>
                  
              </label>
          </td>
        </tr>
      
        <tr>
          <th scope="row">
              <div align="left">Sponsor Package Amount (RM)</div>
          </th>
          <td>
              <label>
                  <input type="text" name="eventSponsorPackageAmt" id="eventSponsorPackageAmt" value="<%=((Event)eventlist.get(i)).getEventSponsorPackageAmt()%>" size="100" value="0.00">
              </label>
          </td>
        </tr>
      
        <tr>
          <th scope="row"><div align="left"></div></th>
          <td>&nbsp;</td>
        </tr>
        
        <tr>
          <th scope="row"><div align="left"></div></th>
          <td><label>
                  
            <input type="submit" name="button7" id="button1" value="Update">
            <input type="reset" name="buttonreset" id="button2" value="Reset">
          </label></td>
        </tr>
        
      </table>--%>
    
    <jsp:include page="../../allModules/footer.jsp" />
<%  } %>
    </body>
</html>
