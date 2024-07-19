<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>オンラインショップ - ログアウト</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/style.css">
<style>
body {
	font-family: Arial, sans-serif;
	background-color: white;
}

#mainArea {
	background-color: white;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	max-width: 800px;
	margin: 20px auto;
}

h1, h2 {
	color: #333;
	border-bottom: 2px solid #0056b3;
	padding-bottom: 10px;
}

.message {
	text-align: center;
	margin: 40px 0;
	font-size: 1.2em;
}

.top-link {
	margin-top: 20px;
	text-align: center;
}

.top-link a {
	color: #0056b3;
	text-decoration: none;
}
</style>
</head>
<body>
	<jsp:include page="/jsp/header.jsp" />
	<div id="mainArea">
		<h1>ログアウト</h1>

		<%-- contents start --%>
		<div id="target" style="color: red;">
			<c:out value="${message}" />
		</div>
		<div class="message">
			<h2>ご来店ありがとうございました！</h2>
		</div>
		<div class="top-link">
			<a href="${pageContext.request.contextPath}/mserv">トップに戻る</a>
		</div>
		<%-- contents end --%>
	</div>
	<div id="footerArea">
		<small>Copyright YYYY FUJITSU LEARNING MEDIA LIMITED</small>
	</div>
</body>
</html>
