<%-- 
    Document   : ManageNewsInterface
    Created on : Dec 29, 2020, 5:53:34 PM
    Author     : Amir Syafiq
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%!public interface ManageNewsInterface {

	/**
	 * 
	 * @param newsAction
	 */
	public void selectNewsAction(String newsAction);

}%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage News</title>
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
        
        
        <%--<form action="\ManageNewsControl" method="post">--%>
            
            <div class="container pb-5">
            <div class="row align-items-center pt-4">
                <div class="col">
                    <div class="card p-3 mb-2 bg-light text-dark" style="width: 18rem;">
                        <img src="assets/images/forest1.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Adding News</h5>
                            <p class="card-text">Add and create any latest news.</p>
                            <a href="ManageNewsControl?option=AddNews" class="btn btn-outline-primary">                           
                                Add News
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card p-3 mb-2 bg-light text-dark" style="width: 18rem;">
                        <img src="assets/images/forest1.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Deleting News</h5>
                            <p class="card-text">Delete and remove any past or canceled news.</p>
                            <a href="ManageNewsControl?option=DeleteNews" class="btn btn-outline-danger">                           
                                Delete News
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card p-3 mb-2 bg-light text-dark" style="width: 18rem;">
                        <img src="assets/images/forest1.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Updating News</h5>
                            <p class="card-text">Update or modify any latest news.</p>
                            <a href="ManageNewsControl?option=UpdateNews" class="btn btn-outline-warning">                           
                                Update News
                            </a>
                         </div>
                    </div>
                </div>
            </div>
            <div class="row align-items-end">
                <div class="d-grid gap-2 col-2 mx-auto pt-2">
                    <a class="btn btn-success btn-lg" href="ManageNewsControl?option=Manage Menu">Main Menu</a>                                           
                </div>
            </div>
            </div>
        </div>
</div>   
        <%--</form>--%>
        <jsp:include page="../../allModules/footer.jsp" />
<%  } %>        
    </body>
</html>
