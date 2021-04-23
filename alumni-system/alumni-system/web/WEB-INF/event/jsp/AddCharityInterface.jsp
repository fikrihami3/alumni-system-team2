<%-- 
    Document   : AddCharityInterface
    Created on : Dec 29, 2020, 5:42:40 PM
    Author     : Amir Syafiq
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%!public interface AddCharityInterface {

	/**
	 * 
	 * @param charityTitle
	 * @param charityDescription
	 * @param charityDateline
	 * @param charityTargetAmt
	 * @param charityImage
	 * @param charityAccBank
	 * @param charityAccNumber
	 * @param charityAccName
	 */
	public void addCharityData(String charityTitle, String charityDescription, String charityDateline, double charityTargetAmt, String charityImage, String charityAccBank, String charityAccNumber, String charityAccName);

	public void charityAddedConfirmation();

	public void charityAddedFailed();

}%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Charity</title>
        <link rel='stylesheet' href='style.css'/>
        
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="assets/css/main.css">
        <script src="assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
        
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
                    <p class="navbar-brand">ADD NEW CHARITY</p>
                </div>
            </nav>
            
            <div class="jumbotron" style="padding-top:25px;padding-bottom: 0;">
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
        <form  name="AddCharityform" method="post" action="ManageCharityControl" enctype="multipart/form-data">
            
        <div class="container pb-5" style="margin-top:-30px;">
            <div class="row align-items-start justify-content-center"></div>
            <div class="row align-items-center pt-4">
                <div class="col">
                    <div class="card mb-2 bg-light text-dark" style="width: auto;">
                        <div class="card-body">
                            <div class="row g-2 p-2">
                                <div class="col">
                                  <div class="form-floating">
                                    <label for="floatingInput">Charity Title</label>
                                    <input type="text" class="form-control" id="floatingInput" placeholder="Title of Charity" name="charityTitle" size="100" required>                                    
                                  </div>
                                </div>
                                <div class="col-md">
                                  <div class="form-floating">
                                    <label for="floatingInput">Charity Dateline</label>
                                    <input type="date" class="form-control" id="floatingInput" placeholder="Dateline of Charity" name="charityDateline" size="100" required>                                    
                                  </div>
                                </div>
                            </div>
                            <div class="row g-2 p-2">
                                <div class="col">
                                  <div class="form-floating">
                                    <label for="floatingInput">Charity Description</label>
                                    <input type="text" class="form-control" id="floatingInput" placeholder="Description of Charity" name="charityDescription" size="100" required>                                    
                                  </div>
                                </div>
                            </div>
                            <div class="row g-2 p-2">
                                <div class="col">
                                  <div class="form-floating">
                                    <label for="floatingInput">Bank Account</label>
                                    <input type="text" class="form-control" id="floatingInput" placeholder="Type of Bank Account" name="charityAccBank" size="100" required>                                    
                                  </div>
                                </div>
                                <div class="col-md">
                                  <div class="form-floating">
                                    <label for="floatingInput">Account Number</label>
                                    <input type="int" class="form-control" id="floatingInput" placeholder="Bank Account's Number" name="charityAccNumber" size="100" required>                                    
                                  </div>
                                </div>
                            </div>
                            <div class="row g-2 p-2">
                                <div class="col">
                                  <div class="form-floating">
                                    <label for="floatingInput">Account Name</label>
                                    <input type="text" class="form-control" id="floatingInput" placeholder="The Account's Name" name="charityAccName" size="100" required>                                    
                                  </div>
                                </div>
                            </div>
                            <div class="row g-2 p-2">
                                <div class="col">
                                  <div class="form-floating">
                                    <label for="floatingInput">Charity Targeted Amount</label>
                                    <input type="text" class="form-control" style="height:42px;" id="floatingInput" placeholder="The Targeted Amount of the Charity" name="charityTargetAmt" size="100" required>                                    
                                  </div>
                                </div>
                                <div class="col-md">
                                  <div class="form-floating">
                                    <label for="floatingInput">Charity Image</label>
                                    <input type="file" class="form-control" id="floatingInput" style="height:42px;" placeholder="Image of the Charity" name="charityImage" size="100" value="0.00" required>                                    
                                  </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="d-grid gap-2 mx-auto pt-2" style="width:250px;display: block;margin-right: auto;margin-left: auto;">
                        <input class="btn btn-warning" type="reset" id="buttonreset" name="buttonreset" value="Reset Form">
                        <input class=" btn btn-primary" type="submit" id="button4" name="button4" value="Add Charity">                                            
                    </div>
                    <div class="d-grid gap-2 mx-auto pt-2" style="width:150px;display: block;margin-right: auto;margin-left: auto;">
                        <a href="ManageCharityControl?option=Charity Menu" class="btn btn-success">Charity Menu</a>       
                    </div>
                </div>
            </div>
        </div>
    </form>
  </div>       
</div>
        
            
<%--        <table align="center" width="500" border="5" cellspacing="5" cellpadding="5">

          <tr>
            <th width="72" scope="row">
                <div align="left">Charity Title</div></th>
            <td width="240">
                <label>
                    <input type="text" name="charityTitle" id="charityTitle" size="100">
                </label>
            </td>
          </tr>

          <tr>
            <th scope="row">
                <div align="left">Charity Description</div>
            </th>
            <td>
                <label>
                    <input type="text" name="charityDescription" id="charityDescription" size="100" required>
                </label>
            </td>
          </tr>

          <tr>
            <th scope="row">
                <div align="left">Charity Dateline</div>
            </th>
            <td>
                <label>
                    <input type="date" name="charityDateline" id="charityDateline" size="100" required>
                </label>
            </td>
          </tr>

          <tr>
            <th scope="row">
                <div align="left">Account Bank</div>
            </th>
            <td>
                <label>
                    <input type="text" name="charityAccBank" id="charityAccBank" size="100" required required>
                </label>
            </td>
          </tr>

          <tr>
            <th scope="row">
                <div align="left">Account Number</div>
            </th>
            <td>
                <label>
                    <input type="int" name="charityAccNumber" id="charityAccNumber" size="100" required>
                </label>
            </td>
          </tr>

          <tr>
            <th scope="row">
                <div align="left">Account Name</div>
            </th>
            <td>
                <label>
                    <input type="text" name="charityAccName" id="charityBankName" size="100" required>
                </label>
            </td>
          </tr>

          <tr>
            <th scope="row">
                <div align="left">Charity Image</div>
            </th>
            <td>
                <label>
                    <input type="file" name="charityImage" id="charityImage">
                </label>
            </td>
          </tr>


          <tr>
            <th scope="row">
                <div align="left">Charity Target Amount (RM)</div>
            </th>
            <td>
                <label>
                    <input type="text" name="charityTargetAmt" id="charityTargetAmt" size="100" value="0.00" required>
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

              <input type="submit" name="button4" id="button4" value="Add">
              <input type="reset" name="buttonreset" id="buttonreset" value="Reset">
            </label></td>
          </tr>

        </table>--%>
      
    
    <div class="fixed p-3 mb-0 bg-light text-dark">
        <div class="container">
            <div class="row">
                <div class="col-sm-9">
                    <p><b>Faculty of Built Environment and Surveying,
                    <br>Universiti Teknologi Malaysia,
                    <br>UTM Skudai, 81310 Johor,
                    <br>Malaysia.</b></p>
                </div>
                <div class="col-sm-3">
                    <p><b>Tel: +6075557351
                    <br>Fax: +6075566155
                    <br>Email: fabu@utm.my</b></p>                                             
                <div class="logo">
                    <a href="https://www.facebook.com/built.surveyUTM/"><img class="sizelogo" src="assets/images\facebook.png" width="35px" height="35px"></a>
                    <a href="https://www.flickr.com/photos/126408255@N08/"><img class="sizelogo" src="assets/images\flickr.png" width="35px" height="35px"></a>
                    <a href="https://www.pinterest.com/fabutm/"><img class="sizelogo" src="assets/images\Pinterest.png" width="35px" height="35px"></a>
                    <a href="http://www.youtube.com/user/fabutmskudai"><img class="sizelogo" src="assets/images\Youtube.png" width="35px" height="35px"></a>
                </div>
                </div>
            </div>
        </div>              
    </div>
<%  } %>
    </body>
</html>
