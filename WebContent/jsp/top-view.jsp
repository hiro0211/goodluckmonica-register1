<!DOCTYPE html>
<!-- All Rights Reserved, Copyright(c) Fujitsu Learning Media Limited -->
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<%--
<style>
.category-container {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
}

.category-item {
  margin: 10px;
  width: 200px;
  text-align: center;
}

.category-image {
  width: 100%;
  height: 150px;
  object-fit: cover;
}

.category-name {
  font-size: 1.2em;
  font-weight: bold;
}
</style> --%>
<head>
<meta charset="UTF-8">
<title>オンラインショップ</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
	<jsp:include page="/jsp/header.jsp" />
	<div id="mainArea">
		<h1>商品検索</h1>

		<%-- contents start --%>
		<p>
			<input type="hidden" name="flag" value="">
		</p>
		<c:if test="${not empty categoryList}">
		<c:forEach var="category" items="${categoryList}">
        <a href='${pageContext.request.contextPath}/mserv?flag=TOP&categoryId=
        <c:out value="${category.categoryId}"/>'>
            <img src="${category.picture}" alt="${category.categoryName}" width="100" height="100">
        </a>
    </c:forEach>
    </c:if>
	</div>
		<%-- contents end --%>
	<div id="footerArea">
		<small> Copyright YYYY FUJITSU LEARNING MEDIA LIMITED </small>
	</div>
</body>
</html>