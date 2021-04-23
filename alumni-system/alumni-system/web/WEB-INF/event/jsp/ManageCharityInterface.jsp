<%-- 
    Document   : ManageCharityInterface
    Created on : Dec 29, 2020, 5:53:08 PM
    Author     : Amir Syafiq
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%!public interface ManageCharityInterface {

	/**
	 * 
	 * @param charityAction
	 */
	public void selectCharityAction(String charityAction);

}%>

<!DOCTYPE html>
<html>
    <head>
        <style>
            body{
                background-image: url('bangunanfabu.jpg');
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: 100% 100%;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Charity</title>
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
                    <p class="navbar-brand">MANAGE CHARITY</p>
                </div>
            </nav>
            
            <div class="jumbotron" style="padding-top:25px;padding-bottom: 10px;">
                <!-- Header/Home -->
                <header class="header-home">
                    <img src="https://brand.utm.my/files/2016/08/LOGO-UTM.png" style="width:30%"><br>
                    <br><p>FACULTY OF BUILT ENVIRONMENT, UNIVERSITI TEKNOLOGI MALAYSIA</p>
                </header>
        
        <%--<div class="divmain">
            <div class="divsub">
                <img src="images/<%=resultSet.getString("eventImage")%>" class="sizeimage"></p>
            </div>
            <div class="divsub title">
                <p>Title: <%=resultSet.getString("eventTitle") %></p>
            </div>
            <div class="divsub">
                <p>Description: <%=resultSet.getString("eventDescription") %></p>
            </div>
            <div class="divdate">
                <div class="divsub">
                    <p class="paradivsub">Date:</p><br><br> <%=resultSet.getString("eventDate") %>
                </div>
                <div class="divsub">
                    <p>Time: <%=resultSet.getString("eventTime") %></p>
                </div>
                <div class="divsub">
                    <p>Venue: <%=resultSet.getString("eventVenue") %></p>
                </div>
            </div>
            <div class="divsub">
                <p>Capacity: <%=resultSet.getString("eventCapacity") %></p>
            </div>
            <div class="divsub">
                <p>Fee: <%=resultSet.getString("eventFee") %></p>
            </div>
            <div class="divsub">
                <p>Organizer: <%=resultSet.getString("eventOrganizer") %></p>
            </div>
            <div class="divsub">
                <p>Web site: <a href="<%=resultSet.getString("eventWebsite") %>">Link</a></p>
            </div>
            <div class="divsub">
                <p>Sponsor: <%=resultSet.getString("eventSponsor") %></p>
            </div>
            <div class="divsub">
                <p>Sponsor Package Amount: <%=resultSet.getString("eventSponsorPackageAmt") %></p>
            </div>
            <div class="divsub">
                <p>eventSposnorGatheredAmt: <%=resultSet.getString("eventSponsorGatheredAmt") %></p>
            </div>
            
        </div>
    <% 
    }%>
</div >--%>
    <%--<form action="${pageContext.request.contextPath}/ManageCharityControl" method="post">--%>
        
        <div class="container pb-5">
            <div class="row align-items-center pt-4">
                <div class="col">
                    <div class="card p-3 mb-2 bg-light text-dark" style="width: 18rem;">
                        <img src="assets/images/forest1.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Adding Charity</h5>
                            <p class="card-text">Add and create any new charity.</p>
                            <a href="ManageCharityControl?option=AddCharity" class="btn btn-outline-primary">                           
                                Add Charity
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card p-3 mb-2 bg-light text-dark" style="width: 18rem;">
                        <img src="assets/images/forest1.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Deleting Charity</h5>
                            <p class="card-text">Delete and remove any past or canceled charity.</p>
                            <a href="ManageCharityControl?option=DeleteCharity" class="btn btn-outline-danger">                           
                                Delete Charity
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card p-3 mb-2 bg-light text-dark" style="width: 18rem;">
                        <img src="assets/images/forest1.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Updating Charity</h5>
                            <p class="card-text">Update or modify any latest charity.</p>
                            <a href="ManageCharityControl?option=UpdateCharity" class="btn btn-outline-warning">                           
                                Update Charity
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row align-items-end">
                <div class="d-grid gap-2 col-2 mx-auto pt-2">
                    <a class="btn btn-success btn-lg" href="ManageCharityControl?option=Manage Menu" >Main Menu</a>                                           
                </div>
            </div>
        </div>
    </div>
</div>   
    <%--</form>--%>
    <jsp:include page="../../allModules/footer.jsp" />
    
    <%--<div class="divbutton">
        <button type="button" class="buttonevent"  value="Add" onclick="document.location='MEC.compareEventAction(Add)'">Add Event</button>
    </div>--%>
<%  } %>    
    </body>
</html>
