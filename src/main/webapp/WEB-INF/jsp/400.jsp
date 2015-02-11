<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%response.setStatus(200);%>

<!DOCTYPE html>
<html>
<head>
	<title>400 - 参数传递有误，请联系管理员</title>
</head>

<body>
	<h2>400 - 参数传递有误，请联系管理员.</h2>
	<p><a href="<c:url value="/"/>">返回首页</a></p>
</body>
</html>