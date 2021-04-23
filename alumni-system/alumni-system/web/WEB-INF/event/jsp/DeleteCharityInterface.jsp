<%-- 
    Document   : DeleteCharityInterface
    Created on : Dec 29, 2020, 5:51:05 PM
    Author     : Amir Syafiq
--%>

<%@page import="java.util.Base64"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.models.event.*"%>
<%@page import="com.controllers.event.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! ManageCharityControl MCC = new ManageCharityControl(); %>
<%! Charity charity = new Charity(); %>
<%!public interface DeleteCharityInterface {

	public void deleteCharityID();

	public void charityDeleteConfirmation();

	public void charityDeleteFailed();

}%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update & Delete Charity</title>
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
                width: 90%;
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
                    <p class="navbar-brand">UPDATE AND DELETE CHARITY</p>
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
                            <td><b>Description</b></td>
                            <td><b>Dateline</b></td>
                            <td><b>Account Bank</b></td>
                            <td><b>Account Number</b></td>
                            <td><b>Account Name</b></td>
                            <td><b>Charity Image</b></td>
                            <td><b>Charity Target Amount</b></td>
                            <td><b>Charity Gathered Amount</b></td>
                            <td colspan="2"><b>Action</b></td>
                        </tr>

                        <%
                            //Event event = new Event();
                            //event=(Event)session.getAttribute("event");
                            ArrayList<Charity> charitylist = (ArrayList<Charity>)session.getAttribute("charitylist");
                            for(int i=0; i<charitylist.size();i++)
                            {
                        %>
                        <form  name="DeleteCharityInterface" action="${pageContext.request.contextPath}/ManageCharityControl" method="post">
                                <tr>
                                <td><%=((Charity)charitylist.get(i)).getCharityTitle()%></td>
                                <td><%=((Charity)charitylist.get(i)).getCharityDescription()%></td>
                                <td><%=((Charity)charitylist.get(i)).getCharityDateline()%></td>
                                <td><%=((Charity)charitylist.get(i)).getCharityAccBank()%></td>
                                <td><%=((Charity)charitylist.get(i)).getCharityAccNumber()%></td>
                                <td><%=((Charity)charitylist.get(i)).getCharityAccName()%></td>  
                                <td>
                                    <%
                                        byte eventImage2[] =((Charity)charitylist.get(i)).getCharityImage2();
                                        String imgDataBase64=new String(Base64.getEncoder().encode(eventImage2));
                                    %>
                                    <img src="data:image/gif;base64,<%= imgDataBase64 %>" alt="No images" width="100px" height="100px"/>
                                </td>
                                <td><%=((Charity)charitylist.get(i)).getCharityTargetAmt()%></td>
                                <td><%=((Charity)charitylist.get(i)).getCharityGatheredAmt()%></td>


                                <% int charityID =((Charity)charitylist.get(i)).getCharityID(); %>

                            <td> <label>       
                                <input type="hidden" name="charityID" value=<%=charityID %> >
                                <input class="btn btn-primary btn-sm" type="submit" name="button5" id="update" value="Update">
                            </label></td>    
                            <td> <label>
                             <%--untuk sponsor nnti--%>
                             <%-- if(((Event)eventlist.get(i)).isEventSponsor()){--%> 

                                <input type="hidden" name="charityID" value=<%=charityID %> >
                                <input class="btn btn-danger btn-sm" type="submit" name="button6" id="delete" value="Delete">


                            </label></td></tr>
                        </form>
                        <%  } %>
                    </table>
                </div>
                <table border="0" align="center">
                    <div class="d-grid gap-2 col-2 mx-auto pb-4">
                        <a href="ManageCharityControl?option=Charity Menu" class="btn btn-success">                           
                            Charity Menu
                        </a>       
                    </div>
                </table>
            </div>
        </div>
        <jsp:include page="../../allModules/footer.jsp" />
<%  } %>
    </body>
</html>