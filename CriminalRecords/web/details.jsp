<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Details - Criminal Records</title>
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
            .button {
                background-color: #4CAF50;
                border: none;
                color: white;
                padding: 15px 32px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                cursor: pointer;
            }

        </style>
    </head>
    <body>
        <div class="page page-contact">
            <div class="heade">
                <div>
                    <a href="homePage.jsp" id="logo"><img src="images/logo.png" alt="log"></a> <span>Discipline Security Progress</span>




                    <%
                        ArrayList<String> filenames = new ArrayList();
                        HttpSession tempSession = request.getSession();
                        String idTemp = (String) tempSession.getAttribute("viewId");

                        String tableTemp = (String) tempSession.getAttribute("viewTable");
                        System.out.println("inside Deails.jsp " + idTemp + "    " + tableTemp);
                        int id = Integer.valueOf(idTemp);
                        int table = Integer.valueOf(tableTemp);
                        


                    %>



                    <div  style="margin-left: 450px;margin-right: 219.5px;margin-top: 42px;height:1000px; width: 1000px; border: 2px solid #fff; background-color: #060606; position: relative; border: 1px solid #ccc;">
                        <div>

                            <%    try {

                                    if (table == 2) {
                                        Connection connection = null;

                                        Statement statement = null;
                                        ResultSet rssheet = null;

                                        String connectionURL = "jdbc:mysql://localhost:3306/criminalrecords";

                                        Class.forName("com.mysql.jdbc.Driver").newInstance();

                                        connection = DriverManager.getConnection(connectionURL, "root", "123456");

                                        statement = connection.createStatement();

                                        String QueryString = "SELECT home, village, upozila, district FROM address WHERE criminal_id='" + id + "'";
                                        rssheet = statement.executeQuery(QueryString);
                                        String address = "";
                                        while (rssheet.next()) {
                                            address = rssheet.getString(1) + ", " + rssheet.getString(2) + ", " + rssheet.getString(3) + ", " + rssheet.getString(4);
                                        }
                                        rssheet.close();
                                        statement.close();

                                        statement = connection.createStatement();
                                        QueryString = "SELECT criminal_image_jpg FROM criminal_image WHERE criminal_id='" + id + "'";
                                        System.out.println("Query processing ");
                                        rssheet = statement.executeQuery(QueryString);

                                        System.out.println("Query done ");
                                        int i = 0;
                                        while (rssheet.next()) {

                                            String number = rssheet.getString(1);

                                            String image1 = "";

                                            String head1 = "criminal_";

                                            image1 = head1 + number;

                                            String image = "images/" + image1;
                                            filenames.add(image);
                                            System.out.println(filenames.get(i));
                                            i++;

                            %>


                            <img src="<%= image%>" style="float:left; margin-right:  20px; height:200px; width: 160px;">


                            <%
                                    System.out.println(image);

                                }
                                if (i == 0) {
                                    String image = "images/criminal_0001.jpg";
                            %>

                            <img src="<%= image%>" style="float:left; margin: 0px; height:200px; width: 160px;">


                            <%}

                                rssheet.close();
                                statement.close();
                                statement = connection.createStatement();


                            %>
                        </div>
                        <br>
                        <div class="dataSet" style=" margin-top: 220px; font-size: 20;">
                            <%                                    QueryString = "SELECT * FROM criminal WHERE criminal_id='" + id + "'";
                                System.out.println("Query processing 2");
                                rssheet = statement.executeQuery(QueryString);
                                System.out.println("Query complete 2");
                                int crime_number = 0;
                                while (rssheet.next()) {
                                    String criminalId = rssheet.getString(1);

                                    String cName = rssheet.getString(2);
                                    String cNid = rssheet.getString(3);
                                    String cAge = rssheet.getString(4) + " years";
                                    String cHeight = rssheet.getString(5) + " inches";
                                    int cStatus = rssheet.getInt(6);
                                    String recent_status = "";
                                    if (cStatus == 1) {
                                        recent_status = "Hide Away";
                                    } else if (cStatus == 2) {
                                        recent_status = "In Jail";
                                    } else {
                                        recent_status = "In Bail";
                                    }
                                    crime_number = rssheet.getInt(8);
                                    int profile_searched = rssheet.getInt(7);
                                    int rating = rssheet.getInt(9);
                                    System.out.println(criminalId + "   " + cName + "  " + crime_number);

                            %>

                            <h3 style=" background-color: #fff; opacity: 0.8; margin-left: 200px; margin-right: 200px">Id:&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<%=criminalId%></h3>

                            <h3 style=" background-color: #fff; opacity: 0.8; margin-left: 200px; margin-right: 200px">Name:&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<%=cName%></h3>
                            <h3 style=" background-color: #fff; opacity: 0.8; margin-left: 200px; margin-right: 200px">NID:&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<%=cNid%></h3>

                            <h3 style=" background-color: #fff; opacity: 0.8; margin-left: 200px; margin-right: 200px">Age:&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;<%=cAge%></h3>
                            <h3 style=" background-color: #fff; opacity: 0.8; margin-left: 200px; margin-right: 200px">Height:&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;<%=cHeight%></h3>
                            <h3 style=" background-color: #fff; opacity: 0.8; margin-left: 200px; margin-right: 200px">Address:&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;<%=address%></h3>

                            <h3 style=" background-color: #fff; opacity: 0.8; margin-left: 200px; margin-right: 200px">Status:&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;<%=recent_status%></h3>
                            <h3 style=" background-color: #fff; opacity: 0.8; margin-left: 200px; margin-right: 200px">Number of Crimes:&emsp;&emsp;<%=crime_number%></h3>
                            <h3 style=" background-color: #fff; opacity: 0.8; margin-left: 200px; margin-right: 200px">Profile Viewed:&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;<%=profile_searched%></h3>
                            <h3 style=" background-color: #fff; opacity: 0.8; margin-left: 200px; margin-right: 200px">Rating:&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;<%=rating%></h3>
                        </div>
                        <div>
                            <%  }

                                rssheet.close();
                                statement.close();
                                statement = connection.createStatement();
                                ArrayList<Integer> crime_list = new ArrayList();
                                QueryString = "SELECT crime_id,Heading FROM crime WHERE crime_id IN( SELECT join_table.crime_id FROM join_table WHERE join_table.criminal_id='" + id + "')";

                                rssheet = statement.executeQuery(QueryString);
                                System.out.println("Query processing 3");
                                String heading = "";
                                int crime_id = 1;
                                while (rssheet.next()) {
                                    heading = rssheet.getString(2);
                                    crime_id = rssheet.getInt(1);
                            %>
                            <form action="ViewingDetails" method="get" target="_blank">
                                <input type="hidden" name="criminal_id" value = "<%=crime_id%>">
                                <input type="hidden" name="type" value = "<%=1%>">
                                <input type="submit" class="button" value="<%=heading%>">
                            </form>



                            <%

                                }

                                rssheet.close();
                                statement.close();
                                connection.close();


                            %>


                        </div>


                        <%                                    } else if (table == 1) {
                            Connection connection = null;

                            Statement statement = null;
                            ResultSet rssheet = null;

                            String connectionURL = "jdbc:mysql://localhost:3306/criminalrecords";

                            Class.forName("com.mysql.jdbc.Driver").newInstance();

                            connection = DriverManager.getConnection(connectionURL, "root", "123456");

                            statement = connection.createStatement();

                            String QueryString = "SELECT crime_image_jpg FROM crime_image WHERE crime_id='" + id + "'";
                            System.out.println("Query processing ");
                            rssheet = statement.executeQuery(QueryString);

                            System.out.println("Query done ");
                            int i = 0;
                            while (rssheet.next()) {

                                String number = rssheet.getString(1);

                                String image1 = "";

                                String head1 = "crime_";

                                image1 = head1 + number;

                                String image = "images/" + image1;
                                filenames.add(image);
                                System.out.println(filenames.get(i));
                                i++;

                        %>


                        <img src="<%= image%>" style="float:left; margin-right:  20px; height:200px; width: 160px;">


                        <%
                                System.out.println(image);

                            }
                            if (i == 0) {
                                String image = "images/criminal_0001.jpg";
                        %>

                        <img src="<%= image%>" style="float:left; margin: 0px; height:200px; width: 160px;">


                        <%}

                            rssheet.close();
                            statement.close();
                            statement = connection.createStatement();


                        %>
                    </div>
                    <br>
                    <div class="dataSet" style=" margin-top: 220px; font-size: 20;">
                        <%                                    QueryString = "SELECT * FROM crime WHERE crime_id='" + id + "'";
                            System.out.println("Query processing 2");
                            rssheet = statement.executeQuery(QueryString);
                            System.out.println("Query complete 2");
                            int crime_number = 0;
                            while (rssheet.next()) {
                                String crimeId = rssheet.getString(1);

                                String cHeading = rssheet.getString(2);
                                String cType = rssheet.getString(3);

                                String crime_type = "";
                                if (cType.contains("1")) {
                                    crime_type = "Antisocial Behavior";
                                } else if (cType.contains("2")) {
                                    crime_type = "Arson";
                                } else if (cType.contains("3")) {
                                    crime_type = "Burglary";
                                } else if (cType.contains("4")) {
                                    crime_type = "Childhood Abuse";
                                } else if (cType.contains("5")) {
                                    crime_type = "Crime Abroad";
                                } else if (cType.contains("6")) {
                                    crime_type = "Domestic Abuse";
                                } else if (cType.contains("7")) {
                                    crime_type = "Fraud";
                                } else if (cType.contains("8")) {
                                    crime_type = "Hate Crime";
                                } else if (cType.contains("9")) {
                                    crime_type = "Murder or Manslaughter";
                                } else if (cType.contains("10")) {
                                    crime_type = "Organized Crime";
                                } else if (cType.contains("11")) {
                                    crime_type = "Property Crime";
                                } else if (cType.contains("12")) {
                                    crime_type = "Rape, Sexual Assault & Sexual Harassment";
                                } else if (cType.contains("13")) {
                                    crime_type = "Robbery";
                                } else if (cType.contains("14")) {
                                    crime_type = "Stalking, Offenses & Harassment";
                                } else if (cType.contains("15")) {
                                    crime_type = "Terror Attack";
                                } else if (cType.contains("16")) {
                                    crime_type = "Violent Crime";
                                } else if (cType.contains("17")) {
                                    crime_type = "Others";
                                }

                                String cDes = rssheet.getString(4);
                                String cLocation = rssheet.getString(5);
                                String cOccuringTime = rssheet.getString(6);

                                int cDead = rssheet.getInt(7);

                                int cinjured = rssheet.getInt(8);
                                int cAffected = rssheet.getInt(9);
                                String cVictim = rssheet.getString(10);
                                int criminal_number = rssheet.getInt(11);


                        %>
                        <h3 style=" background-color: #fff; opacity: 0.8; margin-left: 200px; margin-right: 200px">Id:&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<%=crimeId%></h3>

                        <h3 style=" background-color: #fff; opacity: 0.8; margin-left: 200px; margin-right: 200px">Head Line:&emsp;&emsp;&nbsp;<%=cHeading%></h3>
                        <h3 style=" background-color: #fff; opacity: 0.8; margin-left: 200px; margin-right: 200px">Type:&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;<%=crime_type%></h3>
                        <h3 style=" background-color: #fff; opacity: 0.8; margin-left: 200px; margin-right: 200px">Description:&emsp;&nbsp;&nbsp;<%=cDes%></h3>
                        <h3 style=" background-color: #fff; opacity: 0.8; margin-left: 200px; margin-right: 200px">Location:&emsp;&emsp;&emsp;<%=cLocation%></h3>
                        <h3 style=" background-color: #fff; opacity: 0.8; margin-left: 200px; margin-right: 200px">Time:&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;<%=cOccuringTime%></h3>
                        <h3 style=" background-color: #fff; opacity: 0.8; margin-left: 200px; margin-right: 200px">Dead:&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;<%=cDead%></h3>
                        <h3 style=" background-color: #fff; opacity: 0.8; margin-left: 200px; margin-right: 200px">Injured:&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=cinjured%></h3>
                        <h3 style=" background-color: #fff; opacity: 0.8; margin-left: 200px; margin-right: 200px">Affected:&emsp;&emsp;&emsp;<%=cAffected%></h3>
                        <h3 style=" background-color: #fff; opacity: 0.8; margin-left: 200px; margin-right: 200px">Victim:&emsp;&emsp;&emsp;&emsp;&nbsp;<%=cVictim%></h3>
                        <h3 style=" background-color: #fff; opacity: 0.8; margin-left: 200px; margin-right: 200px">Criminals:&emsp;&emsp;&emsp;<%=criminal_number%></h3>
                    </div>
                    <div>
                        <%  }

                            rssheet.close();
                            statement.close();
                            statement = connection.createStatement();
                            ArrayList<Integer> crime_list = new ArrayList();
                            QueryString = "SELECT criminal_id,name FROM criminal WHERE criminal_id IN( SELECT join_table.criminal_id FROM join_table WHERE join_table.crime_id='" + id + "')";

                            rssheet = statement.executeQuery(QueryString);
                            System.out.println("Query processing 3");
                            String name = "";
                            int criminal_id = 1;
                            while (rssheet.next()) {
                                name = rssheet.getString(2);
                                criminal_id = rssheet.getInt(1);
                        %>
                        <form action="ViewingDetails" method="get" target="_blank">
                            <input type="hidden" name="criminal_id" value = "<%=criminal_id%>">
                            <input type="hidden" name="type" value = "<%=2%>">
                            <input type="submit" class="button" value="<%=name%>">
                        </form>



                        <%

                            }

                            rssheet.close();
                            statement.close();
                            connection.close();


                        %>


                    </div>











                    <%        }
                        } catch (Exception pt) {

                        }
                    %>          








                </div>

                <!--    top: 50%;
                    left: 50%;
                    width:30em;
                    height:18em;
                    margin-top: -9em; /*set to a negative number 1/2 of your height*/
                    margin-left: -15em; /*set to a negative number 1/2 of your width*/
                    border: 1px solid #ccc;
                    background-color: #f3f3f3;
                    background-color: #060606-->

            </div>

        </div>


        <!--</div>-->


















    </div>
    <div class="footer">
        <div>
            <p>
                <a href="devoloper.html">About</a>
                &#169; Copyright &#169: SUST-CSE all rights reserved.
            </p>
        </div>
    </div>



</body>
</html>