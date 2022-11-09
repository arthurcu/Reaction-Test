<%--
  Created by IntelliJ IDEA.
  User: Arthur
  Date: 2022/11/07
  Time: 0:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="DAO.gameDAO" %>
<%@page import="bean.Game" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Reaction time homepage</title>
  <link rel="stylesheet" href="css/home.css">
  <script src="js/easeljs-0.6.1.min.js"></script>
  <script src="js/tweenjs-0.6.0.min.js"></script>
  <script src="js/bootstrap/bootstrap.bundle.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <style type="text/css">
    body{
      margin: 0;
      padding: 0;
      font-family: "Artifakt Element Light";
    }
  </style>
</head>
<body data-bs-target=".navbar" data-bs-popper="50">
<!---------------------------------head menu---------------------------->
<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top" style="box-shadow: 0px 0px 3px 1px #000000;">
  <div class="container-fluid">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="#app">START</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#data">DATA</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#about">TIPS</a>
      </li>
    </ul>
  </div>
</nav>
<div style="width: 100%;height: 550px" id="app">
  <canvas id="gameView" width="600px" height="550px"></canvas>
</div>
<!---------------------------------------------------------->


<!--------------------DATA------------------------>
<div class="about" id="data">
  <div class="about-top">
    <div class="con-style">
      <div class="con-style-title">
        <div>DATA</div>
        <div class="con-style-line"> </div>
      </div>
      <div class="con-style-desc">
        Here are some information returned by the tester</div>
    </div>
    <div class="about-top-part2">
      <div class="list1" style="background-color: #ffffff">
        <p style="text-align:left;font-size:30px"> <br>RANK</p>
        <!-------------javabean---------------->
        <%
          int mintime= 0;
          gameDAO gamedao = new gameDAO();
          ArrayList gamelist=gamedao.queryallgame();
          String name=request.getParameter("name");
          session.setAttribute("name",name);
          ArrayList gamelistper=gamedao.besttime(name);
          if(!gamelistper.isEmpty()){
            Game game1=(Game)gamelistper.get(0);
            mintime=game1.getReactiontime();
          }
        %>
        <!-------------------------------------->

        <div class="list1-item" >
          <table border="3" width="500"style="border-color:seagreen;text-align: center;background-color: #e0ffe6">
            <tr>
              <td>Rank</td>
              <td>Username</td>
              <td>Reaction time</td>
            </tr>
              <%
        for(int i=0;i<gamelist.size()&&i<9;i++){
            Game game=(Game)gamelist.get(i);
    %>
            <tr>
              <td><%=i+1%></td>
              <td><%=game.getName()%></td>
              <td><%=game.getReactiontime()+"ms"%></td>
            </tr>
              <%
        }
    %>
          </table>
        </div>
      </div>





      <div class="list2">
        <!--IMAGE-->
      </div>
      <div class="list3">
        <div class="list3-item1">
          <div class="item-fram">
            <div class="item-title">
              <div style="margin-bottom:10px" id="name"><%=session.getAttribute("name")%></div>
              <div class="item-line"> </div>
              <div style="margin-top:5px;font-size:23px;font-weight: normal;">Username</div>
            </div>
          </div>
        </div>
        <div class="list3-item2">
          <div class="item-fram">
            <div class="item-title">
              <div style="margin-bottom:10px" id="besttime"><%=mintime%> </div>
              <div class="item-line"> </div>
              <div style="margin-top:5px;font-size:23px;font-weight: normal;">Personal best</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>


<!----------------------------------TIPS------------------------------------->

  <div class="about-bottom" id="about">
    <div class="con-style">
      <div class="con-style-title">
        <div>TIPS</div>
        <div class="con-style-line"> </div>
      </div>
      <div class="con-style-desc">
        If you want to improve your quick respond time, then follow the below tips:</div>
    </div>
    <div class="bottom-part">
      <div class="bottom-item"><img src="images/sport.png"></div>
      <div class="bottom-item">
        <div class="item-word">
          <br><br>
          <p style="font-size:25px;">FOR SPORTPERSON 2:</p>
          <p style="font-size:20px;">Stay Calm<br><p>Meditation and calmness can be beneficial to improve your reaction time. Meditating and staying calm help increase the brain's focus, and you react quickly to tiny little things. <br></p>
          <p style="font-size:20px;">Hence, keeping yourself quiet can enhance your reaction time & makes a massive impact.<br></p>
        </div>
      </div>
      <div class="bottom-item"><img src="images/diet.png"></div>
      <div class="bottom-item">
        <div class="item-word">
          <br><br>
          <p style="font-size:25px;">FOR PROFESSIONAL GAMERS:</p>
          <p style="font-size:20px;">Consistency In Practice<br><p>The best & efficient way to improve your quick response is to practice more & more!! We can't achieve this without doing daily practice. <br></p>
          <p style="font-size:20px;">Take the test and practice it regularly, boost your responding time score result and become a professional at your favorite game.<br>
        </div>
      </div>
    </div>
    <div class="bottom-part">
      <div class="bottom-item">
        <div class="item-word">
          <br><br>
          <p style="font-size:25px;">FOR SPORTPERSON 1:</p>
          <p style="font-size:20px;">Physical Training<br><p>The best way to improve reaction times is by doing physical exercises for your body. <br></p>
          <p style="font-size:20px;">There are many ways to train your body physically to react to time. Pick any sport and practice.<br>
        </div>
      </div>
      <div class="bottom-item"><img src="images/calm.png"></div>
      <div class="bottom-item">
        <div class="item-word">
          <br>
          <p style="font-size:25px;">FOR SPORTPERSON 3:</p>
          <p style="font-size:20px;">Maintain Your Diet</p>
          <p style="font-size:20px;">Researchers at Leiden University & the University of Amsterdam found things like those who had recently eaten tyrosine, an essential component for producing some necessary brain chemicals called neurotransmitters, which are found in spinach & eggs to improve reaction time.<br></p>
        </div>
      </div>
      <div class="bottom-item"><img src="images/gamer.png"></div>
    </div>
  </div>
  <!---------------------------------------------------------------------------->





  <div class="navbar-expand-sm bg-dark navbar-dark">
    <div class="footer-info">HCI design</div>
  </div>
</div>
<script src="js/Rect.js"></script>
<script src="js/app.js"></script>
</body>
</html>