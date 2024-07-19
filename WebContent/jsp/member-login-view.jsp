<!DOCTYPE html>
<!-- All Rights Reserved, Copyright(c) Fujitsu Learning Media Limited -->
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>オンラインショップ</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/style.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/loginInputCheck.js"></script>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: white;
    }
    #mainArea {
        background-color: white;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
        max-width: 600px;
        margin: 20px auto;
    }
    h1 {
        color: #333;
        border-bottom: 2px solid #0056b3;
        padding-bottom: 10px;
    }
    table {
        width: 100%;
        border-collapse: separate;
        border-spacing: 0 15px;
    }
    td {
        padding: 5px;
    }
    td:first-child {
        font-weight: bold;
        width: 30%;
        text-align: left;
    }
    input[type="text"], input[type="password"] {
        width: 100%;
        padding: 8px;
        border: 1px solid #ddd;
        border-radius: 4px;
    }
    .submit-button {
        margin-top: 20px;
        text-align: center;
    }
    .submit-button input[type="submit"] {
        padding: 10px 20px;
        background-color: #0056b3;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
    }
    .top-link {
        margin-top: 20px;
        text-align: center;
    }
    .top-link a {
        color: #0056b3;
        text-decoration: none;
    }
    #target {
        color: red;
        margin-bottom: 15px;
    }
</style>
</head>
<body>
	<jsp:include page="/jsp/header-non-menu.jsp" />
	<div id="mainArea">
		<h1>ログイン</h1>
		<%-- contents start --%>

		<div id="target" style="color: red;">
			<c:forEach var="errorMessage" items="${errorMessageList}" varStatus="status">
				<p>
					<c:out value="${errorMessage}" />
				</p>
			</c:forEach>
		</div>

		<form method="post" action="${pageContext.request.contextPath}/mserv" id="chkForm">
			<table>
				<tr>
					<td>会員ID</td>
					<td><input type="text" name="memberId" id="memberId" size="10"></td>
				</tr>
				<tr>
					<td>パスワード</td>
					<td><input type="password" name="password" id="password"
						size="10"></td>
				</tr>
			</table>
			<br> <input type="hidden" name="flag" value="B0202LoginMember">
		<div class="submit-button">
			<input type="submit" value="ログイン">
        </div>
		</form>

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