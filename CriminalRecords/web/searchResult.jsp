
<%@page import="javax.naming.directory.SearchResult"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Website template by freewebsitetemplates.com -->
<html>
    <head>
        <meta charset="UTF-8">
        <title>SearchResult - Criminal Records</title>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <style>
            /*@import url(http://fonts.googleapis.com/css?family=Cabin:400);*/

            .webdesigntuts-workshop {
                background: none;
                height: 100%;
                position: relative;
                text-align: center;
                width: 100%;

            }

            .webdesigntuts-workshop:before,
            .webdesigntuts-workshop:after {
                content: '';


                display: block;	
                height: 1px;
                left: 50%;
                margin: 0 0 0 -400px;
                position: absolute;
                width: 800px;

            }

            .webdesigntuts-workshop:before {
                background: #444;
                background: -webkit-linear-gradient(left, #fff, #fff, #fff);
                background: -moz-linear-gradient(left, #fff, #fff, #fff);
                background: -o-linear-gradient(left, #151515, #444, #151515);
                background: -ms-linear-gradient(left, #151515, #444, #151515);
                background: linear-gradient(left, #151515, #444, #151515);
                top: 192px;
            }

            .webdesigntuts-workshop:after {
                background: #000;
                background: -webkit-linear-gradient(left, #151515, #000, #151515);	
                background: -moz-linear-gradient(left, #151515, #000, #151515);	
                background: -o-linear-gradient(left, #151515, #000, #151515);	
                background: -ms-linear-gradient(left, #151515, #000, #151515);	
                background: linear-gradient(left, #151515, #000, #151515);	
                top: 191px;
            }

            .webdesigntuts-workshop form {
                background: #111;
                background: -webkit-linear-gradient(#1b1b1b, #111);
                background: -moz-linear-gradient(#1b1b1b, #111);
                background: -o-linear-gradient(#1b1b1b, #111);
                background: -ms-linear-gradient(#1b1b1b, #111);
                background: linear-gradient(#1b1b1b, #111);
                border: 1px solid #000;
                border-radius: 5px;
                box-shadow: inset 0 0 0 1px #fff;
                display: inline-block;
                font-size: 0px;
                margin: 150px auto 0;
                padding: 20px;
                position: relative;
                z-index: 1;
            }

            .webdesigntuts-workshop input {
                background: #222;
                background: -webkit-linear-gradient(#333, #222);	
                background: -moz-linear-gradient(#333, #222);	
                background: -o-linear-gradient(#333, #222);	
                background: -ms-linear-gradient(#333, #222);	
                background: linear-gradient(#333, #222);	
                border: 1px solid #444;
                border-radius: 5px 0 0 5px;
                box-shadow: 0 2px 0 #000;
                color: #888;
                display: block;
                float: left;
                font-family: 'Cabin', helvetica, arial, sans-serif;
                font-size: 13px;
                font-weight: 400;
                height: 40px;
                margin: 0;
                padding: 0 10px;
                text-shadow: 0 -1px 0 #000;
                width: 200px;
            }

            .ie .webdesigntuts-workshop input {
                line-height: 40px;
            }

            .webdesigntuts-workshop input::-webkit-input-placeholder {
                color: #888;
            }

            .webdesigntuts-workshop input:-moz-placeholder {
                color: #888;
            }

            .webdesigntuts-workshop input:focus {
                -webkit-animation: glow 800ms ease-out infinite alternate;
                -moz-animation: glow 800ms ease-out infinite alternate;
                -o-animation: glow 800ms ease-out infinite alternate;
                -ms-animation: glow 800ms ease-out infinite alternate;
                animation: glow 800ms ease-out infinite alternate;
                background: #222922;
                background: -webkit-linear-gradient(#333933, #222922);
                background: -moz-linear-gradient(#333933, #222922);
                background: -o-linear-gradient(#333933, #222922);
                background: -ms-linear-gradient(#333933, #222922);
                background: linear-gradient(#333933, #222922);
                border-color: #393;
                box-shadow: 0 0 5px rgba(0,255,0,.2), inset 0 0 5px rgba(0,255,0,.1), 0 2px 0 #000;
                color: #efe;
                outline: none;
            }

            .webdesigntuts-workshop input:focus::-webkit-input-placeholder { 
                color: #efe;
            }

            .webdesigntuts-workshop input:focus:-moz-placeholder {
                color: #efe;
            }

            .webdesigntuts-workshop button {
                background: #222;
                background: -webkit-linear-gradient(#333, #222);
                background: -moz-linear-gradient(#333, #222);
                background: -o-linear-gradient(#333, #222);
                background: -ms-linear-gradient(#333, #222);
                background: linear-gradient(#333, #222);
                -webkit-box-sizing: content-box;
                -moz-box-sizing: content-box;
                -o-box-sizing: content-box;
                -ms-box-sizing: content-box;
                box-sizing: content-box;
                border: 1px solid #444;
                border-left-color: #000;
                border-radius: 0 5px 5px 0;
                box-shadow: 0 2px 0 #000;
                color: #fff;
                display: block;
                float: left;
                font-family: 'Cabin', helvetica, arial, sans-serif;
                font-size: 13px;
                font-weight: 400;
                height: 40px;
                line-height: 40px;
                margin: 0;
                padding: 0;
                position: relative;
                text-shadow: 0 -1px 0 #000;
                width: 80px;
            }	

            .webdesigntuts-workshop button:hover,
            .webdesigntuts-workshop button:focus {
                background: #292929;
                background: -webkit-linear-gradient(#393939, #292929);	
                background: -moz-linear-gradient(#393939, #292929);	
                background: -o-linear-gradient(#393939, #292929);	
                background: -ms-linear-gradient(#393939, #292929);	
                background: linear-gradient(#393939, #292929);
                color: #5f5;
                outline: none;
            }

            .webdesigntuts-workshop button:active {
                background: #292929;
                background: -webkit-linear-gradient(#393939, #292929);
                background: -moz-linear-gradient(#393939, #292929);
                background: -o-linear-gradient(#393939, #292929);
                background: -ms-linear-gradient(#393939, #292929);
                background: linear-gradient(#393939, #292929);
                box-shadow: 0 1px 0 #000, inset 1px 0 1px #222;
                top: 1px;
            }

            @-webkit-keyframes glow {
                0% {
                    border-color: #393;
                    box-shadow: 0 0 5px rgba(0,255,0,.2), inset 0 0 5px rgba(0,255,0,.1), 0 2px 0 #000;
                }	
                100% {
                    border-color: #6f6;
                    box-shadow: 0 0 20px rgba(0,255,0,.6), inset 0 0 10px rgba(0,255,0,.4), 0 2px 0 #000;
                }
            }

            @-moz-keyframes glow {
                0% {
                    border-color: #393;
                    box-shadow: 0 0 5px rgba(0,255,0,.2), inset 0 0 5px rgba(0,255,0,.1), 0 2px 0 #000;
                }	
                100% {
                    border-color: #6f6;
                    box-shadow: 0 0 20px rgba(0,255,0,.6), inset 0 0 10px rgba(0,255,0,.4), 0 2px 0 #000;
                }
            }

            @-o-keyframes glow {
                0% {
                    border-color: #393;
                    box-shadow: 0 0 5px rgba(0,255,0,.2), inset 0 0 5px rgba(0,255,0,.1), 0 2px 0 #000;
                }	
                100% {
                    border-color: #6f6;
                    box-shadow: 0 0 20px rgba(0,255,0,.6), inset 0 0 10px rgba(0,255,0,.4), 0 2px 0 #000;
                }
            }

            @-ms-keyframes glow {
                0% {
                    border-color: #393;
                    box-shadow: 0 0 5px rgba(0,255,0,.2), inset 0 0 5px rgba(0,255,0,.1), 0 2px 0 #000;
                }	
                100% {
                    border-color: #6f6;
                    box-shadow: 0 0 20px rgba(0,255,0,.6), inset 0 0 10px rgba(0,255,0,.4), 0 2px 0 #000;
                }
            }

            @keyframes glow {
                0% {
                    border-color: #393;
                    box-shadow: 0 0 5px rgba(0,255,0,.2), inset 0 0 5px rgba(0,255,0,.1), 0 2px 0 #000;
                }	
                100% {
                    border-color: #6f6;
                    box-shadow: 0 0 20px rgba(0,255,0,.6), inset 0 0 10px rgba(0,255,0,.4), 0 2px 0 #000;
                }
            }







        </style>
    </head>
    <body>
        <div class="page page-about">
            <div class="header">
                <div>
                    <a href="homePage.jsp" id="logo"><img src="images/logo.png" alt="log"></a> <span>Discipline Security Progress</span>
                    <ul>
                        <li>
                            <a href="homePage.jsp">Home</a> <span>Basic informations</span>
                        </li>
                        <li class="selected">
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
                    <!--                    <div class="featured">
                                            <h3>This Website Template is FREE.</h3>
                                            <p>
                                                This Website Template is free.
                                            </p>
                                            <a href="newCrime.html">Read more&#62;&#62;</a>
                                        </div>-->
                </div>
                <div class="finding">
                    <section class="webdesigntuts-workshop">
                        <form action="SearchResult" method="get">

                            <input type="search" placeholder="key word to find..." name="topic">		    	
                            <button style="height:38px;">Search</button>
                        </form>
                    </section>
                </div>
            </div>
            <div class="body" style="margin-top:-150px;">

                <%
                    try {
                        HttpServletRequest requ = request;
                        System.out.println("Despatico " + requ.getParameter("topic"));
                        String sub = requ.getParameter("topic");
                        ResultSet rssheet = null;
                        Connection connection = null;

                        Statement statement = null;

//                        String topic = DefultMethods.sub;
//                        boolean ckhInt = DefultMethods.ckhint;
//                        System.out.println(topic + "    " + ckhInt);
                        String connectionURL = "jdbc:mysql://localhost:3306/criminalrecords";

                        System.out.println("line 1");
                        Class.forName("com.mysql.jdbc.Driver").newInstance();

                        System.out.println("line 2");
                        connection = DriverManager.getConnection(connectionURL, "root", "123456");
                        System.out.println("line 3");
                        statement = connection.createStatement();

                        String QueryString = "SELECT * FROM criminal WHERE name LIKE '%" + sub + "%' ORDER BY marking DESC;";

                        rssheet = statement.executeQuery(QueryString);

                        System.out.println("Query done ");

                        while (rssheet.next()) {

                            int id = rssheet.getInt(1);
                            String name = rssheet.getString(2);
                            String nid = rssheet.getString(3);
                            int status = rssheet.getInt(6);
                            int engaged = rssheet.getInt(8);

                            String image1 = String.valueOf(id);
                            image1 += "001.jpg";
                            String head1 = "criminal_";
                            String number = image1;
                            image1 = head1 + number;

                            String image = "images/" + image1;
                            String recent_status = "";
                            if (status == 1) {
                                recent_status = "Hideaway";
                            } else if (status == 2) {
                                recent_status = "In Jail";
                            } else {
                                recent_status = "In Bail";
                            }
                            System.out.println(image + "     " + id);
                            String val = String.valueOf(id);

                %>          



                <div class="search_rst">

                    <div  style="margin-left: 70px;margin-right: 70px;margin-bottom: 10px;height:100px;border: 2px solid #fff; background-color: #060606" onclick="window.open('http://localhost:8080/CriminalRecords/details.jsp', '_blank');">
                        <!-- -->
                        <img src="<%= image%>" style="float:left; margin: 0px; height:100px; width: 80px;">

                        <a style="float:left; margin-top: 20px;margin-left: 10px; color: #fff">Name: <%=name%> &emsp;</a>

                        <a style="float:left; margin-top: 20px;margin-left: 10px; color: #fff">NID: <%=nid%></a>

                        <br>
                        <br>
                        <a style="float:left; margin-top: 20px;margin-left: 10px; color: #fff">Number of Crimes: <%=engaged%> &emsp; </a>
                        <a style="float:left; margin-top: 20px;margin-left: 10px; color: #fff">Status: <%=recent_status%></a>

                    </div>  
                </div>

                <%                            }

                        rssheet.close();
                        statement.close();
                        connection.close();
                    } catch (Exception tt) {

                        System.out.println("Hello little brother");
                    }
                %>






            </div>
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