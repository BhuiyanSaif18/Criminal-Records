<!--

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
 Website template by freewebsitetemplates.com 
<html>
    <head>
        <meta charset="UTF-8">
        <title>New Crime - Criminal Records</title>
        <link rel="stylesheet" href="css/style.css" type="text/css">



        <link class="jsbin" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
        <script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
        <script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.0/jquery-ui.min.js"></script>



        <style>
            article, aside, figure, footer, header, hgroup, 
            menu, nav, section { display: block; }

            .body.news {
                font-family: 'Nunito', sans-serif;
                color: #384047;
            }

            body.form {
                max-width: 300px;
                margin: 10px auto;
                padding: 10px 20px;
                background: #f4f7f8;
                border-radius: 8px;
                color: #FFF;

                background-image:  url('images/Blank_Page.jpg');
            }

            h1 {
                margin: 0 0 30px 0;
                text-align: center;

            }

            input[type="text"],
            input[type="password"],
            input[type="date"],
            input[type="datetime"],
            input[type="email"],
            input[type="number"],
            input[type="search"],
            input[type="tel"],
            input[type="time"],
            input[type="url"],
            textarea,
            select {
                background: rgba(255,255,255,0.1);
                border: none;
                font-size: 16px;
                height: auto;
                margin: 0;
                outline: 0;
                padding: 5px;
                width: 100%;
                background-color: #000;
                /*e8eeef*/
                color: #FFF;
                box-shadow: 0 1px 0 rgba(0,0,0,0.03) inset;
                margin-bottom: 30px;

            }

            input[type="radio"],
            input[type="checkbox"] {
                margin: 0 4px 8px 0;
            }

            select {
                padding: 6px;
                height: 32px;
                border-radius: 2px;
            }

            button {
                padding: 19px 39px 18px 39px;
                color: #FFF;
                background-color: #4bc970;
                font-size: 18px;
                text-align: center;
                font-style: normal;
                border-radius: 5px;
                width: 100%;
                border: 1px solid #3ac162;
                border-width: 1px 1px 3px;
                box-shadow: 0 -1px 0 rgba(255,255,255,0.1) inset;
                margin-bottom: 10px;
            }

            fieldset {
                margin-bottom: 30px;
                border: none;
            }

            legend {
                font-size: 1.4em;
                margin-bottom: 10px;
            }

            label {
                display: block;
                margin-bottom: 8px;

            }

            label.light {
                font-weight: 300;
                display: inline;
            }

            .number {
                background-color: #5fcf80;
                color: #fff;
                height: 30px;
                width: 30px;
                display: inline-block;
                font-size: 0.8em;
                margin-right: 4px;
                line-height: 30px;
                text-align: center;
                text-shadow: 0 1px 0 rgba(255,255,255,0.2);
                border-radius: 100%;
            }

            @media screen and (min-width: 480px) {

                footer{
                    background-color: #2C3539;

                }
                form {
                    max-width: 4800px;
                    background-image:  url('images/White.jpg');

                }


            }


        </style>
        <style>

            .page-news.body.button {

                position: relative;
                background-color: #ffffff;
                border: none;
                font-size: 28px;
                color: #FFFFFF;
                padding: 20px;
                width: 100px;
                height: 100px;
                text-align: center;
                -webkit-transition-duration: 0.4s; /* Safari */
                transition-duration: 0.4s;
                text-decoration: none;
                overflow: hidden;
                cursor: pointer;
            }

            .page-news.body.button:after {
                content: "";
                background: #000;
                display: block;
                position: absolute;
                padding-top: 300%;
                padding-left: 350%;
                margin-left: -20px !important;
                margin-top: -120%;
                opacity: 0;
                transition: all 0.8s
            }

            .page-news.body.button:active:after {
                padding: 0;
                margin: 0;
                opacity: 1;
                transition: 0s
            }
        </style>



        <script>
            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('#crime_photo')
                                .attr('src', e.target.result)
                                .width(100)
                                .height(100);
                    };

                    reader.readAsDataURL(input.files[0]);
                }
            }
        </script>
        <script>
            function readCriminalURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('#criminal_photo')
                                .attr('src', e.target.result)
                                .width(100)
                                .height(100);
                    };

                    reader.readAsDataURL(input.files[0]);
                }
            }
        </script>





    </head>
    <body>
        <div class="page page-news">
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
                        <li class="selected">
                            <a href="newCrime.jsp">New Crime</a> <span>Add new report</span>
                        </li>
                        <li>
                            <a href="accessHandle.jsp">Access Handle</a>
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
            </div>
            <div class="body">

                <form action="UploadFile" method="post"  >



                    <fieldset>
                        <legend><span class="number">1</span>Crime Data</legend>
                        <label for="heading">Heading:</label>
                        <textarea id="Text1"  name ="detail" ></textarea>
                        <input type="text" id="heading" name="crime_heding">

                        <label for="type">Type:</label>

                        <select id="type" name="crime_type">
                            <optgroup label="Types of Crime">
                                <option value="bntisocial_behavior">Antisocial Behavior</option>
                                <option value="arson">Arson</option>
                                <option value="burglary">Burglary</option>
                                <option value="childhood_abuse">Childhood Abuse</option>
                                <option value="crime_abroad">Crime Abroad</option>
                                <option value="domestic_abuse">Domestic Abuse</option>
                                <option value="fraud">Fraud</option>
                                <option value="hate_crime">Hate Crime</option>
                                <option value="murder_or_manslaughter">Murder or Manslaughter</option>
                                <option value="organized_crime">Organized Crime</option>
                                <option value="property_crime">Property Crime</option>
                                <option value="rape">Rape, Sexual Assault & Sexual Harassment</option>
                                <option value="robbery">Robbery</option>
                                <option value="stalking_and_harassment">Stalking, Offenses & Harassment</option>
                                <option value="terror_attack">Terror Attack</option>
                                <option value="violent_crime">Violent Crime</option>
                                <option value="others">Others</option>

                            </optgroup>

                        </select>
                        <label for="detail">Short Description:</label>
                        <textarea id="detail"  name ="crime_detail" rows="4"></textarea>

                        <label for="location">Location:</label>
                        <input type="text" id="location" name="crime_location">

                                        <label>Age:</label>
                                        <input type="radio" id="under_13" value="under_13" name="user_age"><label for="under_13" class="light">Under 13</label><br>
                                        <input type="radio" id="over_13" value="over_13" name="user_age"><label for="over_13" class="light">13 or older</label>
                        <label for="time">Occurring Time:</label>
                        <input type="text" id="time" name="crime_time">




                        <label for="crime_photo">Crime Photos:</label>

                        <input type="file" name="crime_photo" onchange="readURL(this);"   />
                        <img id="crime_photo" src="#" alt="your image" />

                        <br>
                        <br>
                        <label for="victim">Victim Data:</label>
                        <input type="text" id="victim" name="crime_victim">

                        <label for="witness">Witness Info:</label>
                        <input type="text" id="witness" name="crime_witness">





                        <div class="input_fields_wrap">
                            <button class="add_field_button">Add Criminal</button>
                             <div><input type="text" name="mytext[]"></div>  
                        </div>
                        <script>
                            $(document).ready(function () {
                                var max_fields = 2; //maximum input boxes allowed
                                var wrapper = $(".input_fields_wrap"); //Fields wrapper
                                var add_button = $(".add_field_button"); //Add button ID

                                var x = 1; //initlal text box count
                                $(add_button).click(function (e) { //on add input button click
                                    e.preventDefault();
                                    if (x < max_fields) { //max input box allowed
                                        x++; //text box increment
                                        $(wrapper).append('<div1><label for="criminal_photo">Criminal Photo:</label><input type="file" name="criminal_photo"  onchange="readCriminalURL(this);"/><div1>');
                                        $(wrapper).append('<div2> <img id="criminal_photo" src="#" alt="your image" /></div2>');
                                        $(wrapper).append('<div> <label for="Criminal_Name">Name:</label> <input type="text" name="mytext[]"/><label for="Criminal NID">NID</label> <input type="text" name="mytext[]"/><label for="Criminal_Age">Age</label> <input type="text" name="mytext[]"/><label for="Criminal_Height">Height</label> <input type="text" name="mytext[]"/> <button class="done_adding_criminal">Done</button>  </div>'); //add input box


                                    }
                                });

                                $(wrapper).on("click", ".done_adding_criminal", function (e) { //user click on remove text
                                    // $(wrapper).append('<div><img id="criminal_photo" src="#" alt="your image" /> </div>');
                                    e.preventDefault();
                                    $(this).parent('div1').remove();
                                    e.preventDefault();
                                    $(this).parent('div').remove();
                                    x--;

                                })
                            });

                        </script>






                           <button class = "button" type="button" value="Add Criminal" onclick="window.open('localhost:8080/CriminalRecords/AddCriminal.jsp')">Add Criminal</button>
                        
                    </fieldset>

                    <button type="submit">Create Record</button>
                    <button type="submit">Cancel</button>
                </form>

                <div class="sidebar">









                    <h4>Featured Records</h4>
                    <ul>
                        <li>
                            <a href="newCrime.html"><img src="images/fireman4.jpg" alt=""></a>
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

                </div>

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

    </body>

</html>
-->


<!DOCTYPE html>
<!DOCTYPE html>
<!-- Website template by freewebsitetemplates.com -->
<html>
    <head>
        <meta charset="UTF-8">
        <title>New Crime - Criminal Records</title>
        <link rel="stylesheet" href="css/style.css" type="text/css">



        <link class="jsbin" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
        <script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
        <script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.0/jquery-ui.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



        <style>
            article, aside, figure, footer, header, hgroup, 
            menu, nav, section { display: block; }
            /* saif pop up testing */
            body {
                font-family: Arial, sans-serif;
                height: 100vh;
            }

            h1 {
                text-align: center;
                font-family: Tahoma, Arial, sans-serif;
                color: #06D85F;
                margin: 80px 0;
            }

            .box {
                width: 40%;
                margin: 0 auto;
                background: rgba(255,255,255,0.2);
                padding: 35px;
                border: 2px solid #fff;
                border-radius: 20px/50px;
                background-clip: padding-box;
                text-align: center;
            }

            .button {
                font-size: 1em;
                padding: 10px;
                color: #fff;
                border: 2px solid #06D85F;
                border-radius: 20px/50px;
                text-decoration: none;
                cursor: pointer;
                transition: all 0.3s ease-out;
            }
            .button:hover {
                background: #06D85F;
            }

            .overlay {
                position: fixed;
                top: 0;
                bottom: 0;
                left: 0;
                right: 0;
                background: rgba(0, 0, 0, 0.7);
                transition: opacity 500ms;
                visibility: hidden;
                opacity: 0;
            }
            .overlay:target {
                visibility: visible;
                opacity: 1;
            }

            .popup {
                margin: 70px auto;
                padding: 20px;
                background: #fff;
                border-radius: 5px;
                width: 30%;
                position: relative;
                transition: all 5s ease-in-out;
            }

            .popup h2 {
                margin-top: 0;
                color: #333;
                font-family: Tahoma, Arial, sans-serif;
            }
            .popup .close {
                position: absolute;
                top: 20px;
                right: 30px;
                transition: all 200ms;
                font-size: 30px;
                font-weight: bold;
                text-decoration: none;
                color: #333;
            }
            .popup .close:hover {
                color: #06D85F;
            }
            .popup .close_done {
                position: absolute;
                bottom: -70px;
                left:0px;
                transition: all 200ms;
                font-size: 30px;
                font-weight: bold;
                text-decoration: none;
                color: #333;
            }
            .popup .close_done :hover {
                color: #06D85F;
            }
            .popup .content {
                max-height: 30%;
                overflow: auto;
            }

            @media screen and (max-width: 700px){
                .box{
                    width: 70%;
                }
                .popup{
                    width: 70%;
                }
            }

            /* saif test end */

            .body.news {
                font-family: 'Nunito', sans-serif;
                color: #384047;
            }

            body.form {
                max-width: 300px;
                margin: 10px auto;
                padding: 10px 20px;
                background: #f4f7f8;
                border-radius: 8px;
                color: #FFF;

                background-image:  url('images/Blank_Page.jpg');
            }

            h1 {
                margin: 0 0 30px 0;
                text-align: center;

            }

            input[type="text"],
            input[type="password"],
            input[type="date"],
            input[type="datetime"],
            input[type="email"],
            input[type="number"],
            input[type="search"],
            input[type="tel"],
            input[type="time"],
            input[type="url"],
            textarea,
            select {
                border-radius: 6px;
                background: rgba(255,255,255,0.1);
                border: none;
                font-size: 16px;
                height: auto;
                margin: 0;
                outline: 0;
                padding: 0px;
                width: 100%;
                background-color: #000;
                /*e8eeef*/
                color: #FFF;
                box-shadow: 0 1px 0 rgba(0,0,0,0.03) inset;
                margin-bottom: 30px;

            }

            input[type="radio"],
            input[type="checkbox"] {
                margin: 0 4px 8px 0;
            }

            select {
                padding: 6px;
                height: 32px;
                border-radius: 6px;
            }

            button {

                padding: 19px 39px 18px 39px;
                color: #FFF;
                background-color: #4bc970;
                font-size: 18px;
                text-align: center;
                font-style: normal;
                border-radius: 5px;
                width: 100%;
                border: 1px solid #3ac162;
                border-width: 1px 1px 3px;
                box-shadow: 0 -1px 0 rgba(255,255,255,0.1) inset;
                margin-bottom: 10px;
            }

            fieldset {

                margin-bottom: 30px;
                border: none;
            }

            legend {

                padding-top: 20px;
                font-size: 1.4em;
                margin-bottom: 10px;
            }

            label {
                display: block;
                margin-bottom: 8px;

            }

            label.light {
                font-weight: 300;
                display: inline;
            }

            .number {
                background-color: #5fcf80;
                color: #fff;
                height: 30px;
                width: 30px;
                display: inline-block;
                font-size: 0.8em;
                margin-right: 4px;
                line-height: 30px;
                text-align: center;
                text-shadow: 0 1px 0 rgba(255,255,255,0.2);
                border-radius: 100%;
            }

            @media screen and (min-width: 480px) {

                footer{
                    background-color: #2C3539;

                }
                form {

                    border-radius: 6px;
                    max-width: 4800px;
                    background-image:  url('images/White.jpg');

                }


            }


        </style>
        <style>

            .page-news.body.button {

                position: relative;
                background-color: #ffffff;
                border: none;
                font-size: 28px;
                color: #FFFFFF;
                padding: 20px;
                width: 100px;
                height: 100px;
                text-align: center;
                -webkit-transition-duration: 0.4s; /* Safari */
                transition-duration: 0.4s;
                text-decoration: none;
                overflow: hidden;
                cursor: pointer;
            }

            .page-news.body.button:after {
                content: "";
                background: #000;
                display: block;
                position: absolute;
                padding-top: 300%;
                padding-left: 350%;
                margin-left: -20px !important;
                margin-top: -120%;
                opacity: 0;
                transition: all 0.8s
            }

            .page-news.body.button:active:after {
                padding: 0;
                margin: 0;
                opacity: 1;
                transition: 0s
            }
        </style>



        <script>

            function readURL(input) {


                if (input.files && input.files[0]) {
                    console.log(this);
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('#crime_photo')
                                .attr('src', e.target.result)
                                .width(100)
                                .height(100);
                    };

                    reader.readAsDataURL(input.files[0]);



                }
            }
        </script>
        <script>
            function readCriminalURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('#criminal_photo')
                                .attr('src', e.target.result)
                                .width(100)
                                .height(100);
                    };

                    reader.readAsDataURL(input.files[0]);
                }
            }
        </script>

        <script>
// When the user clicks on <div>, open the popup
            function myFunction() {
                var popup = document.getElementById("myPopup");
                popup.classList.toggle("show");
            }
        </script>




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
        
        
        
        
        
        
        
        
        
        
        <div class="page page-news">
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
                        <li class="selected">
                            <a href="newCrime.jsp">New Crime</a> <span>Add new report</span>
                        </li>
                        <li>
                            <a href="accessHandle.jsp">Access Handle</a>
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
            </div>
            <div class="body">
                <%
                    String[][] list = new String[50][50];


                %>

                <form action="UploadFile" method="post" target="_blank">
                    <fieldset>
                        <legend><span class="number">1</span>Crime Data</legend>
                        <label for="heading">Heading:</label>
                        <!--<textarea id="Text1"  name ="detail" ></textarea>-->
                        <input type="text" id="heading" name="crime_heding">

                        <label for="type">Type:</label>

                        <select id="type" name="crime_type">
                            <optgroup label="Types of Crime">
                                <option value="bntisocial_behavior">Antisocial Behavior</option>
                                <option value="arson">Arson</option>
                                <option value="burglary">Burglary</option>
                                <option value="childhood_abuse">Childhood Abuse</option>
                                <option value="crime_abroad">Crime Abroad</option>
                                <option value="domestic_abuse">Domestic Abuse</option>
                                <option value="fraud">Fraud</option>
                                <option value="hate_crime">Hate Crime</option>
                                <option value="murder_or_manslaughter">Murder or Manslaughter</option>
                                <option value="organized_crime">Organized Crime</option>
                                <option value="property_crime">Property Crime</option>
                                <option value="rape">Rape, Sexual Assault & Sexual Harassment</option>
                                <option value="robbery">Robbery</option>
                                <option value="stalking_and_harassment">Stalking, Offenses & Harassment</option>
                                <option value="terror_attack">Terror Attack</option>
                                <option value="violent_crime">Violent Crime</option>
                                <option value="others">Others</option>

                            </optgroup>

                        </select>
                        <label for="detail">Short Description:</label>
                        <textarea id="detail"  name ="crime_detail" rows="4"></textarea>

                        <label for="location">Location:</label>
                        <input type="text" id="location" name="crime_location">

                        <!--                <label>Age:</label>
                                        <input type="radio" id="under_13" value="under_13" name="user_age"><label for="under_13" class="light">Under 13</label><br>
                                        <input type="radio" id="over_13" value="over_13" name="user_age"><label for="over_13" class="light">13 or older</label>-->
                        <label for="time">Occurring Time:</label>
                        <input type="text" id="time" name="crime_time">




                        <label for="crime_photo">Crime Photos:</label>

                        <input type="file" name="crime_photo" onchange="readURL(this);"   />
                        <img id="crime_photo" src="images/criminal_0001.jpg"  />

                        <br>
                        <br>
                        
                        <label for="dead">Dead:</label>
                        <input type="text" id="dead" name="dead">

                        <label for="injured">Injured:</label>
                        <input type="text" id="injured" name="injured">
                        
                        <label for="affected">Affected:</label>
                        <input type="text" id="affected" name="affected">

                        
                        
                        
                        <label for="victim">Victim Data:</label>
                        <input type="text" id="victim" name="crime_victim">

                        <label for="witness">Witness Info:</label>
                        <input type="text" id="witness" name="crime_witness">
                        <!-- pop up testing --> 
                        <div class="box">
                            <a class="button" href="#popup1">Add Criminal</a>


                            <div id="popup1" class="overlay">
                                <div class="popup">
                                    <h2>Criminal Data</h2>
                                    <a class="close" href="#">&times;</a>
                                    <div class="content">
                                        <!--                                        <form action="CriminalReader" method="get"></form>-->
                                        <label for="Criminal_Name">Name:</label> 
                                        <input type="text" name="Criminal_Name" id="Criminal_Name"/>
                                        <label for="Criminal_NID">NID</label> 
                                        <input type="text" name="Criminal_NID" id="Criminal_NID" />
                                        <label for="Criminal_Age">Age</label> 
                                        <input type="text" name="Criminal_Age"/>
                                        <label for="Criminal_Height">Height</label> 
                                        <input type="text" name="Criminal_Height"/> 

                                        <label for="Criminal_Status">Status</label> 
                                        <input type="radio" name="Criminal_Status" value="1" checked>Hide Away<br>
                                        <input type="radio" name="Criminal_Status" value="2">In Jail<br>
                                        <input type="radio" name="Criminal_Status" value="3">In Bail<br>
                                        <br>
                                        <label for="Criminal_Address">Address</label> 
                                        <input type="text" name="Criminal_Address"/> 

                                        <label for="criminal_photo">Criminal Photo:</label>
                                        <input type="file" name="criminal_photo"  onchange="readCriminalURL(this);"/>
                                        <img id="criminal_photo" src="#images/first.jpg"/>
                                        <br>
                                        <input type="submit" class="btn btn-primary btn-lg" id="search" name="action" value="SearchEntry">
                                        <input type="submit" class="btn btn-primary btn-lg" id= "done_adding_criminal" name="action" value="Create New Criminal"> 

                                        <script type="text/javascript">
                                            document.getElementById("done_adding_criminal").onclick = function () {
                                                var p;
                                                p = document.getElementById("New Criminal Saved !!").value;
                                                alert(p);
                                            };
                                        </script>
                                        <!--                                        </form>-->
                                    </div>
                                </div>
                            </div>
                        </div>    


                    </fieldset>

                    <button type="submit" name="action" value="create">Create Record</button>
                    <button type="submit" name="action" value="cancel">Cancel</button>
                </form>



            </div>
        </div>
        <div class="footer">
            <div>





                <form>
                    <!--
                    <input style="width: 150px; height: 50px; cursor: pointer; font-weight: bold; background:	#4169E1;
                           border-radius: 10px; border: 1px solid #999; font-size: 150%;" type="button" 
                           value="LogOut" onclick="window.location.href = 'index.jsp'" />
                    -->
                    <p>
                        <a href="devoloper.html">About</a>
                        &#169; Copyright &#169: SUST-CSE all rights reserved.
                    </p>

                </form>

            </div>
        </div>

    </body>

</html>

