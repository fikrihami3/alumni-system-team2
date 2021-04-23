<%-- 
    Document   : ViewPageInterface
    Created on : Dec 29, 2020, 5:55:31 PM
    Author     : Amir Syafiq
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Base64"%>
<%@page import="com.models.event.*"%>
<%@page import="com.controllers.event.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! ManageEventControl MEC = new ManageEventControl(); %>
<%! Event event = new Event(); %>

<%!public interface ViewPageInterface {

	/**
	 * 
	 * @param pageAction
	 */
	public void selectPageAction(String pageAction);

}%>

<!DOCTYPE html>
<html>
    <head>
<%--        <style>
            body{
                background-image: url('bangunanfabu.jpg');
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: 100% 100%;
            }
        </style>--%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Page</title>
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
<%--        <link rel='stylesheet' href='lightslider.css'/>
        <script src="js/JQuery3.3.1.js"></script>
        <script src="js/lightslider.js"></script>--%>
    </head>
    <body>
        <%  if(session.getAttribute("user") != null) { %>

        <jsp:include page="../../allModules/sideNavigationBar.jsp" />
        
        <div class="container-custom">
            
            <nav class="navbar navbar-dark bg-dark">
                <div style="height:36px">
                    <p class="navbar-brand">LIST OF EVENTS, CHARITY AND NEWS</p>
                </div>
            </nav>
            
            <div class="jumbotron" style="padding-top:25px;padding-bottom: 10px;">
                <!-- Header/Home -->
                <header class="header-home">
                    <img src="https://brand.utm.my/files/2016/08/LOGO-UTM.png" style="width:30%"><br>
                    <br><p>FACULTY OF BUILT ENVIRONMENT, UNIVERSITI TEKNOLOGI MALAYSIA</p>
                </header>
                
        <div class="container pb-5 pt-5 pl-3 pr-3 bg-info">
            <div class="justify-content-center">
                <%ArrayList<Event> eventlist = (ArrayList<Event>)session.getAttribute("eventlist");%>
                <nav class="navbar navbar-light bg-light" style="width: 50%;display: block;margin-left: auto;margin-right: auto;">
                    <div style="height:36px">
                        <p class="navbar-brand">EVENTS</p>
                    </div>
                </nav>
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="min-height: 500px;">
                    <ol class="carousel-indicators">
                        <%  for(int i=0; i<eventlist.size();i++) { %>
                            <li data-target="#carouselExampleIndicators" data-slide-to="<%= i %>" class="<%= (i == 0)? "active" : "" %>"></li>
                        <%  } %>
                    </ol>
                    <div class="carousel-inner">
                        <%  for(int i=0; i<eventlist.size();i++) { %>
                        <div class="carousel-item <%= (i == 0)? "active" : "" %>">
                            <form  name="ViewEventInterface" action="${pageContext.request.contextPath}/ViewPageControl" method="post">
                                <div class="col">
                                    <div class="card p-3 mb-2 bg-primary text-white" style="width: 50%;display: block;margin-left: auto;margin-right: auto;">
                                        <%
                                            byte eventImage2[] =((Event)eventlist.get(i)).getEventImage2();
                                            String imgDataBase64=new String(Base64.getEncoder().encode(eventImage2));
                                            if(imgDataBase64!=null)
                                            {
                                        %>
                                        <img src="data:image/gif;base64,<%= imgDataBase64 %>" class="card-img-top" height="200" alt="No images">
                                        <%
                                            }
                                            else
                                            {   
                                        %>
                                                 <img src="../../../assets/images/no-image.png" class="card-img-topno_Image_Available" alt="No images2">
                                        <%}%>

                                        <div class="card-body">
                                            <h6 class="card-title"><b><%=((Event)eventlist.get(i)).getEventTitle()%></b></h6>
                                            <p class="card-text"><b>Category:</b> <%=((Event)eventlist.get(i)).getEventCategory()%></p>
                                            <p class="card-text"><b>Date:</b> <%=((Event)eventlist.get(i)).getEventDate()%></p>
                                            <p class="card-text"><b>Time:</b> <%=((Event)eventlist.get(i)).getEventTime()%></p>
                                            <% int eventID =((Event)eventlist.get(i)).getEventID(); %>
                                            <% int eventCapacity =((Event)eventlist.get(i)).getEventCapacity(); %>
                                            <input type="hidden" name="eventCapacity" value=<%=eventCapacity %> >
                                            <input type="hidden" name="eventID" value=<%=eventID %> >
                                            <input type="submit" class="btn btn-outline-dark btn-sm" id="See_more" name="button5" value="See More" />
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <%  } %>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
            <div class="justify-content-center">
                <%ArrayList<News> newslist = (ArrayList<News>)session.getAttribute("newslist");%>
                <nav class="navbar navbar-light bg-light" style="width: 50%;display: block;margin-left: auto;margin-right: auto;">
                    <div style="height:36px">
                        <p class="navbar-brand">NEWS</p>
                    </div>
                </nav>
                <div id="carouselExampleIndicatorsNews" class="carousel slide" data-ride="carousel" style="min-height: 350px;">
                    <ol class="carousel-indicators">
                        <%  for(int i=0; i<newslist.size();i++) { %>
                            <li data-target="#carouselExampleIndicatorsNews" data-slide-to="<%= i %>" class="<%= (i == 0)? "active" : "" %>"></li>
                        <%  } %>
                    </ol>
                    <div class="carousel-inner">
                        <%  for(int i=0; i<newslist.size();i++) { %>
                        <div class="carousel-item <%= (i == 0)? "active" : "" %>">
                            <form  name="ViewEventInterface" action="${pageContext.request.contextPath}/ViewPageControl" method="post">
                                <div class="col" style="width: 50%;display: block;margin-left: auto;margin-right: auto;">
                                    <div class="card p-3 mb-2 bg-warning text-dark" style="width: 100%;">
                                        <div class="card-body">
                                            <h6 class="card-title"><b><%=((News)newslist.get(i)).getNewsTitle()%></b></h6>
                                            <p class="card-text"><b>Category:</b> <%=((News)newslist.get(i)).getNewsCategory()%></p>
                                            <p class="card-text"><b>Link:</b> <a href="<%=((News)newslist.get(i)).getNewsWebsite()%>">Link</a></p>
                                            <p class="card-text"><b>Time:</b> <%=((Event)eventlist.get(i)).getEventTime()%></p>
                                            <% int newsID =((News)newslist.get(i)).getNewsID(); %>
                                            <input type="hidden" name="newsID" value=<%=newsID %> >
                                            <input type="submit" class="btn btn-outline-dark btn-sm" id="See_more" name="button6" value="See More" />
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <%  } %>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicatorsNews" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicatorsNews" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
            <div class="justify-content-center">
                <%ArrayList<Charity> charitylist = (ArrayList<Charity>)session.getAttribute("charitylist");%>
                <nav class="navbar navbar-light bg-light" style="width: 50%;display: block;margin-left: auto;margin-right: auto;">
                    <div style="height:36px">
                        <p class="navbar-brand">CHARITY</p>
                    </div>
                </nav>
                <div id="carouselExampleIndicatorsCHARITY" class="carousel slide" data-ride="carousel" style="min-height: 500px;">
                    <ol class="carousel-indicators">
                        <%  for(int i=0; i<charitylist.size();i++) { %>
                            <li data-target="#carouselExampleIndicatorsCHARITY" data-slide-to="<%= i %>" class="<%= (i == 0)? "active" : "" %>"></li>
                        <%  } %>
                    </ol>
                    <div class="carousel-inner">
                        <%  for(int i=0; i<charitylist.size();i++) { %>
                        <div class="carousel-item <%= (i == 0)? "active" : "" %>">
                            <form  name="ViewEventInterface" action="${pageContext.request.contextPath}/ViewPageControl" method="post">
                                <div class="col" style="width: 50%;display: block;margin-left: auto;margin-right: auto;">
                                    <div class="card p-3 mb-2 bg-success text-white" style="width: 100%;">
                                        <%
                                            byte charityImage2[] =((Charity)charitylist.get(i)).getCharityImage2();
                                            String imgDataBase64=new String(Base64.getEncoder().encode(charityImage2));
                                            if(imgDataBase64!=null)
                                            {
                                        %>
                                            <img src="data:image/gif;base64,<%= imgDataBase64 %>" height="250" class="card-img-top" alt="No images">
                                        <%
                                            }
                                            else
                                            {   
                                        %>
                                                 <img src="assets/images\No_Image_Available.jpg" class="card-img-top" alt="No images2">
                                        <%}%>
                                        <div class="card-body">
                                            <h6 class="card-title"><b><%=((Charity)charitylist.get(i)).getCharityTitle()%></b></h6>
                                            <p class="card-text"><b>Dateline:</b> <%=((Charity)charitylist.get(i)).getCharityDateline()%></p>
                                            <p class="card-text"><b>Amount Gathered:</b> RM<%=((Charity)charitylist.get(i)).getCharityGatheredAmt()%> / RM<%=((Charity)charitylist.get(i)).getCharityTargetAmt()%></p>
                                            <% int charityID =((Charity)charitylist.get(i)).getCharityID(); %>
                                            <input type="hidden" name="charityID" value=<%=charityID %> >
                                            <input type="submit" class="btn btn-outline-dark btn-sm" id="See_more" name="button7" value="See More" />
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <%  } %>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicatorsCHARITY" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicatorsCHARITY" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
        </div>                
    </div>
</div>
<%--        <div class="menu-container">
            <img class="menu-container-pic" src="images\UTMFabu.png">
        </div>
        <h1 style="text-align: center">Event</h1>
        
    
        <%ArrayList<Event> eventlist = (ArrayList<Event>)session.getAttribute("eventlist");%>
        <script type="text/javascript">
                  $(document).ready(function() {
        $('#autoWidth,#autoWidth2,#autoWidth3').lightSlider({
            autoWidth:true,
            loop:true,
            onSliderLoad: function() {
                $('#autoWidth,#autoWidth2,#autoWidth3').removeClass('cS-hidden');
            } 
        });  
      });
        </script>
         
        <div class="viewEvent1">
            <ul id="autoWidth" class="cS-hidden"> 
        <%
            for(int i=0; i<eventlist.size();i++)
            {
        %>  
        <li>
            <div class="viewEvent2">
                <form  name="ViewEventInterface" action="${pageContext.request.contextPath}/ViewPageControl" method="post">
                    <div>
                        <%
                            byte eventImage2[] =((Event)eventlist.get(i)).getEventImage2();
                            String imgDataBase64=new String(Base64.getEncoder().encode(eventImage2));
                            if(imgDataBase64!=null)
                            {
                        %>
                                <img src="data:image/gif;base64,<%= imgDataBase64 %>" alt="No images" width="100px" height="100px"/><br>
                        <%
                            }
                            else
                            {   
                        %>
                                 <img src="images\No_Image_Available.jpg" alt="No images2" width="100px" height="100px"/><br>
                        <%}%>
                    </div>
                    <div>
                        <b><%=((Event)eventlist.get(i)).getEventTitle()%></b><br>
                    </div>
                    <div>
                        Category: <%=((Event)eventlist.get(i)).getEventCategory()%><br>
                    </div>
                    <div>
                        Date: <%=((Event)eventlist.get(i)).getEventDate()%><br>
                    </div>
                    <div>
                        Time: <%=((Event)eventlist.get(i)).getEventTime()%><br>
                    </div>
                    <% int eventID =((Event)eventlist.get(i)).getEventID(); %>
                    <% int eventCapacity =((Event)eventlist.get(i)).getEventCapacity(); %>
                    <div>
                        <label>       
                            <input type="hidden" name="eventCapacity" value=<%=eventCapacity %> >
                            <input type="hidden" name="eventID" value=<%=eventID %> >
                            <input type="submit" name="button5" id="See_more" value="See more">
                        </label><br>
                    </div>
                </form>
            </div>
        </li>
        <%

            }

        %>
        </ul></div>
        
        <h1 style="text-align: center">News</h1>
        <%ArrayList<News> newslist = (ArrayList<News>)session.getAttribute("newslist");%>

          
        <div class="viewEvent1">
            <ul id="autoWidth2" class="cS-hidden">
        <%
            for(int i=0; i<newslist.size();i++)
            {
        %>
        <li>
            <div class="viewEvent2">
                <form  name="ViewEventInterface" action="${pageContext.request.contextPath}/ViewPageControl" method="post">

                <div>
                    <b><%=((News)newslist.get(i)).getNewsTitle()%></b><br>
                </div>
                <div>
                    Link: <a href="<%=((News)newslist.get(i)).getNewsWebsite()%>">Link</a><br>
                </div>
                <div>
                    Category: <%=((News)newslist.get(i)).getNewsCategory()%><br>
                </div>
                <% int newsID =((News)newslist.get(i)).getNewsID(); %>
                <div>
                    <label>       
                        <input type="hidden" name="newsID" value=<%=newsID %> >
                        <input type="submit" name="button6" id="See_more" value="See more">
                    </label><br>
                </div>
                </form>
            </div>
        </li>
        <%

            }

        %>
        </ul></div>
        
        <h1 style="text-align: center">Charity</h1>
        <%ArrayList<Charity> charitylist = (ArrayList<Charity>)session.getAttribute("charitylist");%>

          
        <div class="viewEvent1">
            <ul id="autoWidth3" class="cS-hidden">
        <%
            for(int i=0; i<charitylist.size();i++)
            {
        %>
        <li>
            <div class="viewEvent2">
                <form  name="ViewEventInterface" action="${pageContext.request.contextPath}/ViewPageControl" method="post">

                
                <div>
                        <%
                            byte charityImage2[] =((Charity)charitylist.get(i)).getCharityImage2();
                            String imgDataBase64=new String(Base64.getEncoder().encode(charityImage2));
                            if(imgDataBase64!=null)
                            {
                        %>
                                <img src="data:image/gif;base64,<%= imgDataBase64 %>" alt="No images" width="100px" height="100px"/><br>
                        <%
                            }
                            else
                            {   
                        %>
                                 <img src="images\No_Image_Available.jpg" alt="No images2" width="100px" height="100px"/><br>
                        <%}%>
                </div>
                <div>
                    <b><%=((Charity)charitylist.get(i)).getCharityTitle()%></b><br>
                </div>
                <div>
                    Date: <%=((Charity)charitylist.get(i)).getCharityDateline()%><br>
                </div>
                <div>
                    <p style="color:darkgreen;"><%=((Charity)charitylist.get(i)).getCharityGatheredAmt()%></p><b>/</b><p><%=((Charity)charitylist.get(i)).getCharityTargetAmt()%></p><br>
                </div>
                <% int charityID =((Charity)charitylist.get(i)).getCharityID(); %>
                <div>
                    <label>       
                        <input type="hidden" name="charityID" value=<%=charityID %> >
                        <input type="submit" name="button7" id="See_more" value="See more">
                    </label><br>
                </div>
                </form>
            </div>
        </li>
        <%

            }

        %>
        </ul></div>--%>

    <jsp:include page="../../allModules/footer.jsp" />
<%  } %>
    </body>
</html>