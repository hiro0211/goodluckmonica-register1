<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>オンラインショップ - ショッピングカート</title>
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

h1 {
	color: #333;
	border-bottom: 2px solid #0056b3;
	padding-bottom: 10px;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	padding: 10px;
	border: 1px solid #ddd;
	text-align: left;
}

th {
	background-color: #f2f2f2;
	font-weight: bold;
}

select {
	width: 100%;
	padding: 5px;
}

.button-group {
	margin-top: 20px;
	text-align: center;
}

.button-group input[type="submit"] {
	padding: 10px 20px;
	background-color: #0056b3;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 16px;
	margin-left: 10px;
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
<jsp:include page="/jsp/header.jsp" />
<div id="mainArea">
<h1>ショッピングカート</h1>
<div id="target">
<c:out value="${message}" />
<c:forEach var="errorMessage" items="${errorMessageList}" varStatus="status">
<p><c:out value="${errorMessage}" /></p>
</c:forEach>
</div>
<c:if test="${!empty B01ShoppingCart}">
<form method="get" action="${pageContext.request.contextPath}/mserv">
<table>
<tr>
<th>商品ID</th>
<th>商品名</th>
<th>単価</th>
<th>在庫</th>
<th>数量</th>
<th>ポイント</th>
<th>小計金額</th>
<th></th>
</tr>
<c:forEach var="order" items="${B01ShoppingCart}"
						varStatus="status">
<tr>
<td><c:out value="${order.product.productId}" /></td>
<td><c:out value="${order.product.productName}" /></td>
<td style="text-align: right;"><c:out
									value="${order.product.price}" /></td>
<td style="text-align: right;"><c:out
									value="${order.product.stock.quantity}" /></td>
<td><select name="productQty" id="productQty${status.index}">
<c:forEach var="count" begin="1" end="10">
<option value="${count}"
<c:if test="${order.quantity == count}">selected</c:if>>
<c:out value="${count}" />
</option>
</c:forEach>
</select></td>
<td style="text-align: right;"><c:out
									value="${order.subTotalPoint}" /></td>
<td style="text-align: right;"><c:out
									value="${order.subTotal}" /></td>
<td><a
								href='${pageContext.request.contextPath}/mserv?flag=B0102DeleteFromCart&deleteProductId=<c:out value="${order.product.productId}"/>'>
<img src="img/yameru.gif" border="0" alt="削除">
</a></td>
</tr>
<c:set var="totalPoint"
							value="${totalPoint + order.subTotalPoint}" />
<c:set var="total" value="${total + order.subTotal}" />
</c:forEach>
<tr>
<th colspan="5">合計金額</th>
<td style="text-align: right;"><c:out value="${totalPoint}" /></td>
<td style="text-align: right;"><c:out value="${total}" /></td>
<td></td>
</tr>
</table>
<input type="hidden" name="flag" value="">
<p>数量を変更する場合は、数量更新ボタンを押してください。</p>
<div class="button-group">
<input type="submit" value="数量更新"
						onclick="this.form.flag.value='B0102UpdateCart'"> <input
						type="submit" value="レジに進む"
						onclick="this.form.flag.value='B0102GoShopping'">
</div>
</form>
</c:if>
<div class="top-link">
<a href="${pageContext.request.contextPath}/mserv">トップに戻る</a>
</div>
</div>
<div id="footerArea">
<small>Copyright YYYY FUJITSU LEARNING MEDIA LIMITED</small>
</div>
</body>
</html>