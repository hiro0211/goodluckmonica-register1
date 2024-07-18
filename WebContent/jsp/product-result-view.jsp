<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>オンラインショップ - 商品一覧</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
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
            max-width: 800px;
            margin: 20px auto;
        }
        h1, h2 {
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
            background-color: #d3d3d3;
            font-weight: bold;
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
        <h1><c:out value="${productlist[0].category.categoryName}" /></h1>
        <div id="target">
            <c:out value="${message}" />
        </div>

        <c:if test="${!empty productlist}">
            <h2>検索結果 <c:out value="${productlist.size()}" />件</h2>
            <form method="get" action="${pageContext.request.contextPath}/mserv">
                <table>
                    <tr>
                        <th>商品ID</th>
                        <th>商品名</th>
                        <th>価格</th>
                        <th>在庫数</th>
                        <th>詳細</th>
                        <th>カート</th>
                    </tr>
                    <c:forEach var="product" items="${productlist}">
                        <tr>
                            <td><c:out value="${product.productId}" /></td>
                            <td><c:out value="${product.productName}" /></td>
                            <td><c:out value="${product.price}" />円</td>
                            <td><c:out value="${product.stock.quantity}" />個</td>
                            <td><a href='${pageContext.request.contextPath}/mserv?flag=B0101ShowProduct&productId=<c:out value="${product.productId}"/>'>詳細を見る</a></td>
                            <td>
                                <a href='${pageContext.request.contextPath}/mserv?flag=B0101AddToCart&productId=<c:out value="${product.productId}"/>'>
                                    <img src="${pageContext.request.contextPath}/img/cart.gif" alt="カートに追加">
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
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