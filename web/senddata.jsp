<%--
  Created by IntelliJ IDEA.
  User: ZhangZilong
  Date: 2022/11/07
  Time: 14:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="DAO.gameDAO" %>
<%@page import="bean.Game" %>
<%@page import="java.util.ArrayList" %>
<html>
<head>

    <title>Title</title>
</head>
<body>
<%
    gameDAO gameDAO = new gameDAO();
    String timestr = null;
    timestr=request.getParameter("time");
    String name1 = (String) session.getAttribute("name");
    if(timestr!=null&&name1!=null){
        name1 = "'" +name1+ "'";
        int time = Integer.parseInt(timestr);
        gameDAO.senddata(name1,time);

%>
<%=name1%>
<%=time%>
<%
    }
%>
</body>
</html>
