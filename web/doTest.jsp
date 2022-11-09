<%--
  Created by IntelliJ IDEA.
  User: ZhangZilong
  Date: 2022/11/05
  Time: 13:30
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="DAO.gameDAO" %>
<%@page import="bean.Game" %>
<%@page import="java.util.ArrayList" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    gameDAO gamedao = new gameDAO();
    ArrayList gamelist=gamedao.queryallgame();
    ArrayList list=gamedao.besttime("12333");
%>

<%=gamedao.besttime("sasa")%>
</table>
</body>
</html>
