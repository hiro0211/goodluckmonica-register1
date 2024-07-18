<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>オンラインショップ - 商品詳細</title>
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
        h1 {
            color: #333;
            border-bottom: 2px solid #0056b3;
            padding-bottom: 10px;
        }
        .product-container {
            display: flex;
            align-items: flex-start;
            margin-top: 20px;
        }
        .product-image-container {
            background-color: #E5E5E5;
            padding: 20px;
            border-radius: 5px;
            margin-right: 20px;
        }
        .product-details {
            flex-grow: 1;
        }
        .blue-line {
            border-top: 2px solid #0099ff;
            margin: 10px 0;
            width: 40%;
        }
        .product-info p {
            margin: 10px 0;
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
        p {
        	text-align: left;
        }
    </style>
</head>
<body>
    <jsp:include page="/jsp/header.jsp" />
    <div id="mainArea">
        <h1>
            <a href="${pageContext.request.contextPath}/mserv?flag=B0101ShowCategory&categoryId=<c:out value="${product.category.categoryId}"/>">
                <c:out value="${product.category.categoryName}" />
            </a>
        </h1>
        <div id="target">
            <c:out value="${message}" />
        </div>

        <c:if test="${not empty product}">
            <div class="product-container">
                <div class="product-image-container">
                    <img src='${pageContext.request.contextPath}/img_DB/<c:out value="${product.picture}"/>'>
                </div>
                <div class="product-details">
                    <p><c:out value="${product.productId}"/> <c:out value="${product.productName}"/></p>
                    <div class="blue-line"></div>
                    <div class="product-info">
                        <p>価格：<c:out value="${product.price}"/>円</p>
                        <p>在庫数：<c:out value="${product.stock.quantity}"/>個</p>
                        <p>
                            <a href='${pageContext.request.contextPath}/mserv?flag=B0101AddToCart&productId=<c:out value="${product.productId}"/>'>
                                <img src="${pageContext.request.contextPath}/img/cart.gif" alt="カートに追加">
                            </a>
                        </p>
                    </div>
                </div>
            </div>
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