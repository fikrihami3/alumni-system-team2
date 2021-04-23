<%-- 
    Document   : MainUserInterface
    Created on : Dec 29, 2020, 5:52:31 PM
    Author     : Amir Syafiq
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%!public interface MainUserInterface {

	public void viewPage();

}%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main User Interface</title>
        <link rel='stylesheet' href='style.css'/>
        
        <jsp:include page="../../allModules/bootstrap4.jsp" />
        
    </head>
    <body>
        <nav class="navbar sticky-top navbar-dark bg-primary">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">User View</a>
            </div>
        </nav>
        <div class="menu-container">
            <img class="menu-container-pic" src="images\UTMFabu.png">
        </div>
        
        <div class="container pb-5">
            <div class="row align-items-start">
                <div class="col">
                    <div class="card p-3 mb-2 bg-light text-dark" style="width: 18rem;">
                        <img src="images/forest1.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Event Page</h5>
                            <p class="card-text">View the info and details of any events.</p>
                            <form action="ViewPageInterface.jsp" method="post">
                                <input type="submit" class="btn btn-outline-primary btn-lg" name="button" value="View Event" />
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card p-3 mb-2 bg-light text-dark" style="width: 18rem;">
                        <img src="images/forest1.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">News Page</h5>
                            <p class="card-text">View the info and details of any news.</p>
                            <form action="ViewPageInterface.jsp" method="post">
                                <input type="submit" class="btn btn-outline-warning btn-lg" name="button" value="View News" />
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card p-3 mb-2 bg-light text-dark" style="width: 18rem;">
                        <img src="images/forest1.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Charity Page</h5>
                            <p class="card-text">View the info and details of any charity.</p>
                            <form action="ViewPageInterface.jsp" method="post">
                                <input type="submit" class="btn btn-outline-success btn-lg" name="button" value="View Charity" />
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row align-items-end"></div>
        </div>
        
        <div class="p-3 mb-2 bg-primary text-dark">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-9">
                            <p><b>Faculty of Built Environment and Surveying,
                            <br>Universiti Teknologi Malaysia,
                            <br>UTM Skudai, 81310 Johor,
                            <br>Malaysia.</b></p>
                        </div>
                        <div class="col-sm-2">
                            <p><b>Tel: +6075557351
                            <br>Fax: +6075566155
                            <br>Email: fabu@utm.my</b></p>                                             
                        <div class="logo">
                            <a href="https://www.facebook.com/built.surveyUTM/"><img class="sizelogo" src="images\facebook.png"></a>
                            <a href="https://www.flickr.com/photos/126408255@N08/"><img class="sizelogo" src="images\flickr.png"></a>
                            <a href="https://www.pinterest.com/fabutm/"><img class="sizelogo" src="images\Pinterest.png"></a>
                            <a href="http://www.youtube.com/user/fabutmskudai"><img class="sizelogo" src="images\Youtube.png"></a>
                        </div>
                        </div>
                    </div>
                </div>              
        </div>
    </body>
</html>
