<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Access Handle - Criminal Records</title>
        <!--<link rel="stylesheet" href="css/style.css" type="text/css">-->
        <link href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css" rel="stylesheet">
        <script src = "https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src = "https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <style type="text/css">
            
            .header{
                background-color: #FFFFFF;
            }
            .footer{
                width: 1024px;
            }

        </style>
    </head>
    <body>
        
        <%

            HttpSession tempSession = request.getSession();
            if (tempSession.getAttribute("loggedInOrNot") != "1") {

                out.println("<script type=\"text/javascript\">");
                out.println("alert('You must log in to access this site');");
                out.println("location='index.jsp';");
                out.println("</script>");
                //   response.sendRedirect("index.jsp");

            }
            else{
            

            
            if (tempSession.getAttribute("accountType") != "1") {

                out.println("<script type=\"text/javascript\">");
                out.println("alert('This Option is reserved for Admin');");
                out.println("location='homePage.jsp';");
                out.println("</script>");
               

            }
            }


        %>



        
        
        
        
        
        
        
        
        
        
        
        
        <div class="page page-contact">
            <div class="header">
                <div>
                    <a href="homePage.jsp" id="logo"><img src="images/logo.png" alt="log"></a> <span>Discipline Security Progress</span>
                    <ul>
                        <li>
                            <a href="homePage.jsp">Home</a> <span>Basic informations</span>
                        </li>
                        <li>
                            <a href="searchResult.jsp">Search</a> <span>Search with necessary field</span>
                        </li>
                        <li>
                            <a href="newCrime.jsp">New Crime</a> <span>Add new report</span>
                        </li>
                        <li class="selected">
                            <a href="accessHandle.jsp">Access Handle</a> <span>Define access level</span>
                        </li>
                        
                         <li>
                             <a href="allCriminals.jsp">All Criminals</a> <span>Full List</span> 
                        </li>
                        <li>
                            <a href="allCrimes.jsp">All Crimes</a> <span>Crime Based List</span> 
                        </li>
                        
                        <li>
                            <a href="loginPage">Log Out</a>  
                        </li>
                    </ul>
                </div>
                <!--</div>-->






                <!--<div class="body">-->

                <div class ="withImage">
                    <br>
                    <br>
                    <form action = "Processing" method="get">
                        Add New User: 
                        <br>
                        <input type="text" name="newName" placeholder="Users Name" size="25">
                        <br>
                        <input type="text" name="newEmail" placeholder="Email ID" size="25">
                        <br>
                        <input type="text" name="newPost" placeholder="Post" size="25">
                        <br>
                        <input type="text" name="newThana" placeholder="Thana" size="25">
                        <br>
                        <input type="text" name="newDistrict" placeholder="District" size="25">
                        <br>
                        <br>
                        <select name="newAuth" style="width:250;">
                            <option value="admin">Administration</option>
                            <option value="analytic">Analytic</option>
                            <option value="inputter">Inputer</option>      
                        </select>
                        <br>
                        <br>
                        <input type="submit" value="Add" style="width:  250;">
                    </form>
                    <br>
                    <br>

                </div>
                

                <%

                    try {
                        String connectionURL = "jdbc:mysql://localhost:3306/criminalrecords";
                        Connection connection = null;

                        Statement statement = null, st2 = null, st3 = null;

                        ResultSet rs = null, rs2 = null, rs3 = null;

                        System.out.println("line 1");
                        Class.forName("com.mysql.jdbc.Driver").newInstance();

                        System.out.println("line 2");
                        connection = DriverManager.getConnection(connectionURL, "root", "123456");
                        System.out.println("line 3");
                        statement = connection.createStatement();

                        String QueryString = "SELECT * FROM administration_login";
                        String Q2 = "SELECT * FROM analytic_login";
                        String Q3 = "SELECT * FROM inputter_login";
                        rs = statement.executeQuery(QueryString);
                        System.out.println("chacking 1");

                %>





                <table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Email ID</th>
                            <th>Authentication Level</th>
                            <th>Post</th>
                            <th>Thana</th>
                            <th>District</th>
                            <th>Delete</th>
                        </tr>
                    </thead>

                    <tbody>
                        <%                    while (rs.next()) {
                                String del1 = rs.getString(6);
                                String del2 = "1";
                                String del = del2 + del1;
                        %>
                        <tr>
                            <td><%=rs.getString(2)%></td>
                            <td><%=rs.getString(6)%></td>
                            <td>Administration</td>
                            <td><%=rs.getString(3)%></td>
                            <td><%=rs.getString(4)%></td>
                            <td><%=rs.getString(5)%></td>

                            <td><form action="DeletingUser" method="get">
                                    <input type="hidden" name="key" value = "<%=del%>">
                                    <input type="submit" class="btn btn-danger" value="Delete">
                                </form>
                            </td>
                            <!--<td><button class="btn btn-danger" >Delete</button></td>-->
                        </tr>
                        <% }
                            rs.close();
                            statement.close();


                        %>
                        <%                    st2 = connection.createStatement();
                            rs2 = st2.executeQuery(Q2);

                            while (rs2.next()) {
                                String del1 = rs2.getString(6);
                                String del2 = "2";
                                String del = del2 + del1;
                        %>
                        <tr>
                            <td><%=rs2.getString(2)%></td>
                            <td><%=rs2.getString(6)%></td>
                            <td>Analytic</td>
                            <td><%=rs2.getString(3)%></td>
                            <td><%=rs2.getString(4)%></td>
                            <td><%=rs2.getString(5)%></td>
                            <td><form action="DeletingUser" method="get">
                                    <input type="hidden" name="key" value = "<%=del%>">
                                    <input type="submit" class="btn btn-danger" value="Delete">
                                </form>
                            </td>
                        </tr>
                        <% }

                            rs2.close();
                            st2.close();

                        %>
                        <%                    st3 = connection.createStatement();
                            rs3 = st3.executeQuery(Q3);
                            while (rs3.next()) {
                                String del1 = rs3.getString(6);
                                String del2 = "3";
                                String del = del2 + del1;
                        %>
                        <tr>
                            <td><%=rs3.getString(2)%></td>
                            <td><%=rs3.getString(6)%></td>
                            <td>Inputter</td>
                            <td><%=rs3.getString(3)%></td>
                            <td><%=rs3.getString(4)%></td>
                            <td><%=rs3.getString(5)%></td>
                            <td><form action="DeletingUser" method="get">
                                    <input type="hidden" name="key" value = "<%=del%>">
                                    <input type="submit" class="btn btn-danger" value="Delete">
                                </form>
                            </td>
                        </tr>
                        <% } %>

                    </tbody>
                    <%

                        rs3.close();
                        st3.close();
                        connection.close();

                    } catch (Exception ex) {
                    %>

                    <font size="+3" color="red"></b>
                    <%
                            ex.printStackTrace();
                            out.println("Unable to connect to database.");
                        }
                    %>


                </table>
                <script>
                    $(document).ready(function () {
                        $('#example').DataTable();
                    });
                </script>



                <!--               <h4>Approved IDs</h4>
                              <div class="contact">
                                  <div>
                                      <h4>Approved IDs</h4>
                                  </div>
                                                              <form action="homePage.html">
                                                                          
                                                                          <input type="text" id="name" onclick="this.value='';" onfocus="this.select()" onblur="this.value=!this.value?'Full Name':this.value;" value="Full Name">
                                                                          <input type="text" id="email" onclick="this.value='';" onfocus="this.select()" onblur="this.value=!this.value?'Email Address':this.value;" value="Email Address">
                                                                          <input type="text" id="subject" onclick="this.value='';" onfocus="this.select()" onblur="this.value=!this.value?'Subject':this.value;" value="Subject">
                                                                          <textarea name="message" id="message" cols="30" rows="10" onclick="this.value='';" onfocus="this.select()" onblur="this.value=!this.value?'Message':this.value;">Message</textarea>
                                                                          <label for="subscribe" class="subscribe">
                                                                                  <input type="checkbox" id="subscribe">
                                                                                  Subscribe to newsletter</label>
                                                                          <label for="agree" class="agree">
                                                                                  <input type="checkbox" id="agree">
                                                                                  I agree to the Terms and Conditions</label>
                                                                          <input type="submit" value="" id="submit">
                                                                  </form>
                                                                  <p>
                                                                          Please feel free to remove some or all the text and links of this page and replace it with your own About content.
                                                                  </p>
                              </div>
                              <div class="sidebar">
                                  <h4>Featured Records</h4>
                                  <ul>
                                      <li>
                                          <a href="newCrime.html"><img src="images/fireman1.jpg" alt=""></a>
                                          <div>
                                              <h3>Tag: ISIS</h3>
                                              <p>
                                                  Crime: Terror attack on hotel radison<br>Name: Faraaz Hossain<br>Age: 26
                                              </p>
                                              <a href="newCrime.html">Read more&#62;&#62;</a>
                                              <a>Read more&#62;&#62;</a>
                                          </div>
                                      </li>
                                      <li>
                                          <a href="newCrime.html"><img src="images/fireman5.jpg" alt=""></a>
                                          <div>
                                              <h3>Tag-BDR Revolt</h3>
                                              <p>
                                                  Crime: Revolt soldier<br>Name: Aminul Islam<br>Age: 34
                                              </p>
                                                                              <a href="newCrime.html">Read more&#62;&#62;</a>
                                              <a>Read more&#62;&#62;</a>
                                          </div>
                                      </li>
                                  </ul>
                                  <h4>Sign-up For Updates</h4>
              
                              </div>
                                                      <div class="section">
                                                              <div>
                                                                      <h4>Gallery</h4>
                                                                      <ul>
                                                                              <li>
                                                                                      <a href="gallery.html"><img src="images/fireman1.jpg" alt=""></a>
                                                                              </li>
                                                                              <li>
                                                                                      <a href="gallery.html"><img src="images/fireman2.jpg" alt=""></a>
                                                                              </li>
                                                                              <li>
                                                                                      <a href="gallery.html"><img src="images/fireman3.jpg" alt=""></a>
                                                                              </li>
                                                                      </ul>
                                                              </div>
                                                              <div class="connect">
                                                                      <h4>Social</h4>
                                                                      <a href="http://freewebsitetemplates.com/go/twitter/" id="twitter">twitter</a> <a href="http://freewebsitetemplates.com/go/facebook/" id="fb">fb</a> <a href="http://freewebsitetemplates.com/go/googleplus/" id="googleplus">google+</a> <a href="http://freewebsitetemplates.com/go/youtube/" id="vimeo">vimeo</a>
                                                              </div>
                                                      </div>-->
            </div>
            <div class="footer">
                <div>
                        <p>
                            <a href="devoloper.html">About</a>
                            &#169; Copyright &#169: SUST-CSE all rights reserved.
                        </p>
                </div>
            </div>
        </div>
    </body>
</html>