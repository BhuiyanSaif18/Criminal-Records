<%-- 
    Document   : homePage
    Created on : Jul 21, 2017, 2:09:58 AM
    Author     : razza
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Website template by freewebsitetemplates.com -->
<html>
    <head>
        <meta charset="UTF-8">
        <title>Criminal Records</title>
        <link rel="stylesheet" href="css/style.css" type="text/css">

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

        <!-- Optional theme -->

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

        <script src = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style type="text/css">


            .page-home.footer{
                width: 1024px;
            }
            .popup {
                position: relative;
                display: inline-block;
                cursor: pointer;
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                user-select: none;
            }

            /* The actual popup */
            .popup .popuptext {
                visibility: hidden;
                width: 160px;
                background-color: #555;
                color: #fff;
                text-align: center;
                border-radius: 6px;
                padding: 8px 0;
                position: absolute;
                z-index: 1;
                bottom: 125%;
                left: 50%;
                margin-left: -80px;
            }

            /* Popup arrow */
            .popup .popuptext::after {
                content: "";
                position: absolute;
                top: 100%;
                left: 50%;
                margin-left: -5px;
                border-width: 5px;
                border-style: solid;
                border-color: #555 transparent transparent transparent;
            }

            /* Toggle this class - hide and show the popup */
            .popup .show {
                visibility: visible;
                -webkit-animation: fadeIn 1s;
                animation: fadeIn 1s;
            }
            .bttn{

                background-color: transparent;
                border: none !important;
                color: #fff;
                cursor: pointer;

            }
            .bttn:hover{
                color: #ff0;
            }
            .bttn_criminal{
                background-color: transparent;
                border: none !important;
                color: #fff;
                cursor: pointer;

            }
            /* Add animation (fade in the popup) */
            @-webkit-keyframes fadeIn {
                from {opacity: 0;} 
                to {opacity: 1;}
            }

            @keyframes fadeIn {
                from {opacity: 0;}
                to {opacity:1 ;}
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


        %>










        <div class="page page-home">
            <div class="header">
                <div>
                    <a href="homePage.jsp" id="logo"><img src="images/logo.png" alt="log" ></a> <span>Discipline Security Progress</span>
                    <ul>
                        <li class="selected">
                            <a href="homePage.jsp">Home</a> <span>Basic informations</span>
                        </li>
                        <li>
                            <a href="searchResult.jsp">Search</a> <span>Search with necessary field</span>
                        </li>
                        <li>
                            <a href="newCrime.jsp">New Crime</a> <span>Add new report</span>
                        </li>
                        <li>
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
                    <div class="featured">
                        <h3>Criminal Records</h3>
                        <p>
                            A site for security service.
                        </p>

                        <!--<a href="newCrime.html">Read more&#62;&#62;</a>-->
                    </div>
                </div>
            </div>
            <div class="body">
                <div class="home">
                    <h4>Latest Records</h4>
                    <ul>
                        <%                        try {
                                Connection conn = null;
                                Statement stm = null;
                                ResultSet rs = null;

                                String connectionURL = "jdbc:mysql://localhost:3306/criminalrecords";

                                System.out.println("line 1");
                                Class.forName("com.mysql.jdbc.Driver").newInstance();

                                System.out.println("line 2");
                                conn = DriverManager.getConnection(connectionURL, "root", "123456");
                                System.out.println("line 3");
                                stm = conn.createStatement();
                                String Q = "SELECT Heading, type, criminals_number, crime_id FROM crime ORDER BY crime_id DESC LIMIT 6";
                                rs = stm.executeQuery(Q);
                                while (rs.next()) {
                                    String headline = rs.getString(1);

                                    String crime_type = "";
                                    if (rs.getString(2).contains("1")) {
                                        crime_type = "Antisocial Behavior";
                                    } else if (rs.getString(2).contains("2")) {
                                        crime_type = "Arson";
                                    } else if (rs.getString(2).contains("3")) {
                                        crime_type = "Burglary";
                                    } else if (rs.getString(2).contains("4")) {
                                        crime_type = "Childhood Abuse";
                                    } else if (rs.getString(2).contains("5")) {
                                        crime_type = "Crime Abroad";
                                    } else if (rs.getString(2).contains("6")) {
                                        crime_type = "Domestic Abuse";
                                    } else if (rs.getString(2).contains("7")) {
                                        crime_type = "Fraud";
                                    } else if (rs.getString(2).contains("8")) {
                                        crime_type = "Hate Crime";
                                    } else if (rs.getString(2).contains("9")) {
                                        crime_type = "Murder or Manslaughter";
                                    } else if (rs.getString(2).contains("10")) {
                                        crime_type = "Organized Crime";
                                    } else if (rs.getString(2).contains("11")) {
                                        crime_type = "Property Crime";
                                    } else if (rs.getString(2).contains("12")) {
                                        crime_type = "Rape, Sexual Assault & Sexual Harassment";
                                    } else if (rs.getString(2).contains("13")) {
                                        crime_type = "Robbery";
                                    } else if (rs.getString(2).contains("14")) {
                                        crime_type = "Stalking, Offenses & Harassment";
                                    } else if (rs.getString(2).contains("15")) {
                                        crime_type = "Terror Attack";
                                    } else if (rs.getString(2).contains("16")) {
                                        crime_type = "Violent Crime";
                                    } else if (rs.getString(2).contains("17")) {
                                        crime_type = "Others";
                                    }
                                    String criminal_numbers = rs.getString(3);

                                    String crime_id = rs.getString(4);
                                    String image = "";
                                    image = "images/crime_" + crime_id + "001.jpg";


                        %>

                        <li>
                            <a>
                                <img src="<%=image%>" style=" height: 100px; width: 80x;"></a>
                            <div>
                                <h3><%=headline%></h3>
                                <span><%=crime_type%></span>
                                <p>
                                    Number of Criminals: <%=criminal_numbers%>
                                </p>
                                <!--                                <a href="newCrime.html">Read more&#62;&#62;</a>-->

                                <a><form action="ViewingDetails" method="get">
                                        <input type="hidden" name="criminal_id" value = "<%=crime_id%>">
                                        <input type="hidden" name="type" value = "<%="1"%>">
                                        <input type="submit" class="bttn" value="Read More...">
                                    </form></a>


                            </div>
                        </li>










                        <%
                                }
                                rs.close();
                                stm.close();
                                conn.close();

                            } catch (Exception tt) {

                            }

                        %>



                    </ul>
                </div>




























                <div class="sidebar">
                    <h4>Top Criminals</h4>
                    <ul>
                        <%                            try {
                                Connection conn = null;
                                Statement stm = null;
                                ResultSet rs = null;

                                String connectionURL = "jdbc:mysql://localhost:3306/criminalrecords";

                                System.out.println("line 1");
                                Class.forName("com.mysql.jdbc.Driver").newInstance();

                                System.out.println("line 2");
                                conn = DriverManager.getConnection(connectionURL, "root", "123456");
                                System.out.println("line 3");
                                stm = conn.createStatement();
                                String Q = "SELECT criminal_id, name,age,crime_engagement FROM criminal ORDER BY marking DESC LIMIT 3";
                                rs = stm.executeQuery(Q);
                                while (rs.next()) {
                                    int criminalId = rs.getInt(1);
                                    String name = rs.getString(2);
                                    int age = rs.getInt(3);
                                    int crime_engagement = rs.getInt(4);
                                    String image = "";
                                    image = "images/criminal_" + criminalId + "001.jpg";


                        %>



                        <li>
                            <a>
                                <img src="<%=image%>" style=" height: 100px; width: 80x;"></a>
                            <div>
                                <h3><%=name%></h3>
                                <span></span>
                                <p>
                                    Number of Criminals:  <%=crime_engagement%>
                                    <br>
                                    Age:   <%=age%>
                                </p>

                                <!--                                <a href="newCrime.html">Read more&#62;&#62;</a>-->
                                <a>
                                    <form action="ViewingDetails" method="get">
                                        <input type="hidden" name="criminal_id" value = "<%=criminalId%>">
                                        <input type="hidden" name="type" value = "<%="2"%>">
                                        <input type="submit" class="bttn" value="Read More..." style="background: none;">
                                    </form>
                                </a>

                            </div>
                        </li>
                        <%
                                }
                                rs.close();
                                stm.close();
                                conn.close();
                            } catch (Exception ert) {
                                System.out.println("Error Khaice");

                            }

                        %>
                    </ul>
                    <!--<h4>Sign-up For Updates</h4>-->

                </div>
                <!--                <div class="section">
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
            <!--            <div class="footer">
                            <div>
                                <p>
                                    <a href="devoloper.html">About</a>
                                    &#169; Copyright &#169: SUST-CSE all rights reserved.
                                </p>
                            </div>
                        </div>-->
        </div>










    </body>
</html>