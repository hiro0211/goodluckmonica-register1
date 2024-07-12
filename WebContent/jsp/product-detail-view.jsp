<!DOCTYPE html>
<!-- All Rights Reserved, Copyright(c) Fujitsu Learning Media Limited -->
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<%--
<style>
table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}

th {
  background-color: #4CAF50;
  color: white;
}

.product-image {
  width: 300px;
  height: 300px;
  object-fit: cover;
}
</style> --%>
<head>
<title>オンラインショップ</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
	<jsp:include page="/jsp/header.jsp" />
	<div id="mainArea">
		<%-- contents start --%>
<h1><a href="B0101ShowCategoryAction?categoryId=${param.categoryId}">＜<c:out value="${product.category.categoryName}" />
</a>
</h1>
		<div id="target" style="color: red;">
			<c:out value="${message}" />
		</div>

		<c:if test="${!empty product}">
 <table border="1">
        <thead>
            <tr>
                <th>商品画像</th>
                <th>商品ID</th>
                <th>商品名</th>
                <th>価格</th>
                <th>在庫数</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="product" items="${productlist}">
                <tr>
                    <td><img src="${product.picture}" alt="${product.productName}" width="100" height="100"></td>
                    <td>${product.productId}</td>
                    <td>${product.productName}</td>
                    <td>${product.price}</td>
                    <td>${product.stock.stockQuantity}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

<p>
  <a href="shopping-cart-view.jsp?productId=<c:out value="${product.productId}"/>">カートに入れる</a>
</p>
</c:if>
				<p>
			<a href="${pageContext.request.contextPath}/mserv">[トップに戻る]</a>
		</p>
		<%-- contents end --%>
	</div>
	<div id="footerArea">
		<small> Copyright YYYY FUJITSU LEARNING MEDIA LIMITED </small>
	</div>
</body>
</html>