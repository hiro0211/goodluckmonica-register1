<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>A社オンラインショッピング</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/style.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/loginInputCheck.js"></script>
</head>

<body>

<div id="mainArea">
		<h1>会員登録</h1>
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
					<td>名前</td>
					<td><input type="text" name="membername" id="membername" size="10"></td>
				</tr>
				<tr>
					<td>性別</td>
					<td>
					<label for="male">男性</label>
    <input type="radio" id="male" name="gender" value="male">

   					 <label for="female">女性</label>
    <input type="radio" id="female" name="gender" value="female">

    				<label for="other">その他</label>
    <input type="radio" id="other" name="gender" value="other">
    				</td>
				</tr>
				<tr>
					<td>住所</td>
					<td><input type="text" name="address" id="address"
						size="10"></td>
				</tr>
				<tr>
					<td>電話番号</td>
					<td><input type="text" name="phone" id="phone"
						size="10"></td>
				</tr>
				<tr>
					<td>パスワード</td>
					<td><input type="password" name="password" id="password"
						size="10"></td>
				</tr>
			</table>
			<br> <input type="hidden" name="flag" value="B0201CheckMember">
			<input type="submit" value="確認">
</form>

			<p>
			<a href="${pageContext.request.contextPath}/mserv">[トップに戻る]</a>
			</p>
		<%-- contents end --%>
	</div>
</body>
</html>