<%-- 
    Document   : index
    Created on : Feb 9, 2017, 1:53:54 PM
    Author     : Abdur_Razzak_Rana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    Document   : index
    Created on : Feb 13, 2017, 3:15:02 PM
    Author     : Abdur_Razzak_Rana
--%>


<!DOCTYPE html>
<html >
    <head>
        <title>Criminal Records</title>
        <meta charset="UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>




        <style>
            /* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */
            @import url(http://fonts.googleapis.com/css?family=Exo:100,200,400);
            @import url(http://fonts.googleapis.com/css?family=Source+Sans+Pro:700,400,300);





            body{

                overflow-x: hidden; 
                overflow-y: hidden;

                margin: 0;
                padding: 0;
                background: #fff;

                color: #fff;
                font-family: Arial;
                font-size: 12px;
            }

            .body{
                position: absolute;
                top: -20px;
                left: -20px;
                right: -40px;
                bottom: -40px;
                width: auto;
                height: auto;

                background-size: cover;
                -webkit-filter: blur(5px);
                z-index: 0;
            }

            .grad{
                position: absolute;
                top: -20px;
                left: -20px;
                right: -40px;
                bottom: -40px;
                width: auto;
                height: auto;
                background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(0,0,0,0)), color-stop(100%,rgba(0,0,0,0.65))); /* Chrome,Safari4+ */
                z-index: 1;
                opacity: 0.7;
            }

            .header{
                position: absolute;
                top: calc(10% - 35px);
                left: calc(50% - 255px);
                z-index: 2;
                padding: 60px;
                align: top;
            }

            .header div{

                float: left;
                color: #fff;
                font-family: 'Exo', sans-serif;
                font-size: 35px;
                font-weight: 200;

            }

            .header div span{
                color: #5379fa !important;
            }

            .login{
                position: absolute;
                top: calc(50% - 75px);
                left: calc(50% - 75px);
                height: 150px;
                width: 350px;
                padding: 10px;
                z-index: 2;
                align: top;
            }

            .login input[type=text]{
                width: 330px;
                height: 30px;
                background: transparent;
                border: 1px solid rgba(255,255,255,0.6);
                border-radius: 2px;
                color: #fff;
                font-family: 'Exo', sans-serif;
                font-size: 16px;
                font-weight: 400;
                padding: 4px;
            }
            .login radio[type=text]{
                width: 330px;
                height: 30px;
                background: transparent;
                border: 1px solid rgba(255,255,255,0.6);
                border-radius: 2px;
                color: #fff;
                font-family: 'Exo', sans-serif;
                font-size: 16px;
                font-weight: 400;
                padding: 4px;
            }
            .login input[type=password]{
                width: 330px;
                height: 30px;
                background: transparent;
                border: 1px solid rgba(255,255,255,0.6);
                border-radius: 2px;
                color: #fff;
                font-family: 'Exo', sans-serif;
                font-size: 16px;
                font-weight: 400;
                padding: 4px;
                margin-top: 10px;
            }

            .login input[type=button]{
                width: 260px;
                height: 35px;
                background: #fff;
                border: 1px solid #fff;
                cursor: pointer;
                border-radius: 2px;
                color: #a18d6c;
                font-family: 'Exo', sans-serif;
                font-size: 16px;
                font-weight: 400;
                padding: 6px;
                margin-top: 10px;
            }

            .login input[type=button]:hover{
                opacity: 0.8;
            }

            .login input[type=button]:active{
                opacity: 0.6;
            }

            .login input[type=text]:focus{
                outline: none;
                border: 1px solid rgba(255,255,255,0.9);
            }

            .login input[type=password]:focus{
                outline: none;
                border: 1px solid rgba(255,255,255,0.9);
            }

            .login input[type=button]:focus{
                outline: none;
            }
            .login span{
                color: #ffffff !important;
                font-family: "Times New Roman", Times,red-serif;
                font-size: 18px;
            }
            .login .button{
                width: 260px;
                height: 35px;
                background: #fff;
                border: 1px solid #fff;
                cursor: pointer;
                border-radius: 2px;
                color: #a18d6c;
                font-family: 'Exo', sans-serif;
                font-size: 16px;
                font-weight: 400;
                padding: 6px;
                margin-top: 10px;
            }
            .login.button:hover{
                opacity: 0.8;
            }
            .login.button:active{
                opacity: 0.6;
            }
            .login.button:focus{
                outline: none
            }
            ::-webkit-input-placeholder{
                color: rgba(255,255,255,0.6);
            }

            ::-moz-input-placeholder{
                color: rgba(255,255,255,0.6);
            }
        </style>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>


    </head>

    <body >

        <div class="body"></div>
        <div>
            <img src="images/Opening.jpg" style='height: 100%; width: 100%; object-fit: contain'/> 
        </div>

        <div class="grad"></div>
        <div class="login">

            <form action="homePage" method="post">

                <input type="radio" name="authLevel" value="Administration">
                <span>Administration</span>
                <!--<div>Administration<br>--> 
                <input type="radio" name="authLevel" value="Analytics">
                <span>Analytics</span>
                <!--Analytics<br>-->
                <input type="radio" name="authLevel" value="Inputter">
                <span>Inputter</span>
                <!--Inputter<br>-->
                <br>
                <br>
                <br>
                <input type="text" placeholder="Gmail-ID" name="user" ><br>
                <input type="password" placeholder="Password" name="password"><br>
                <br>
                <!--<input onClick="window.location.href='newhtml.html'" type="submit" Value="Go">-->
                <!--<input type="button" value="Login" <a href="newhtml.html"> </a>>-->
                <br>


                <!--<a  class="btn btn-primary btn-block" role="button">Login</a>-->
                <!--<button type="button" class="btn btn-primary btn-block" >Login</button>-->
                <input type="submit"  value="Login" style="  
                       /*width: 330px;*/
                       /*height: 34px;*/
                       /*background: #4169E1;*/
                       /*border: 1px solid #fff;*/
                       cursor: pointer;
                       /*border-radius: 2px;*/
                       color: #ffffff;
                       font-family: 'Exo', sans-serif;
                       font-size: 16px;
                       font-weight: 400;
                       padding: 6px;
                       margin-top: 10px;
                       " class="btn btn-primary btn-block" > 

            </form>
        </div>
        <br>
        <br>
        <br>
        <div class="header"  >
            <!--<marquee behavior="scroll" direction="left"><img src="../jix/img_nat.png" width="120" height="80" alt="Natural" /></marquee>-->
            <marquee direction="right"> <img src="images/logo.png" alt="log" ></marquee>
            <div>Criminal<span>Records</span></div>

        </div>
        <br>

        <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>


    </body>
</html>
