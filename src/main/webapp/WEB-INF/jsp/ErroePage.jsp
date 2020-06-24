<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2020/6/22
  Time: 11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录失败</title>
</head>
<body>
<input type="hidden" id="error" value="<%=request.getAttribute("error") %>">
<input type="hidden" id="pagename" value="<%=request.getAttribute("pagename") %>">
<script type="text/javascript">
    var error = document.getElementById("error").value;
    var pagename = document.getElementById("pagename").value;
    alert(error);
    window.location=("/Dispatch/"+pagename);
</script>
</body>
</html>
