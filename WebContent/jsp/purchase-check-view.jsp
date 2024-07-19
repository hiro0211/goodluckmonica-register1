<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>商品購入確認</title>
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
            margin-bottom: 20px;
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
        .button-group {
            text-align: center;
            margin-top: 20px;
        }
        .button {
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
    </style>
</head>
<body>
    <jsp:include page="/jsp/header-non-menu.jsp" />
    <div id="mainArea">
        <h1>商品購入確認</h1>

        <h2>会員情報</h2>
        <table>
            <tr>
                <th>会員ID</th>
                <td><c:out value="${CommonLoginMember.memberId}" /></td>
            </tr>
            <tr>
                <th>名前</th>
                <td><c:out value="${CommonLoginMember.memberName}" /></td>
            </tr>
            <tr>
                <th>クレジットカード番号</th>
                <td>************<c:out value="${B01ShoppingCart[0].creditCardId}" /></td>
            </tr>
        </table>

        <h2>購入内容</h2>
        <form method="get" action="${pageContext.request.contextPath}/mserv">
            <table id="cart">
                <tr>
                    <th>商品ID</th>
                    <th>商品名</th>
                    <th>単価</th>
                    <th>在庫</th>
                    <th>数量</th>
                    <th>ポイント</th>
                    <th>小計金額</th>
                </tr>
                <c:forEach var="order" items="${B01ShoppingCart}" varStatus="status">
                    <tr>
                        <td><c:out value="${order.product.productId}" /></td>
                        <td><c:out value="${order.product.productName}" /></td>
                        <td style="text-align: right;"><c:out value="${order.product.price}" /></td>
                        <td style="text-align: right;"><c:out value="${order.product.stock.quantity}" /></td>
                        <td style="text-align: right;"><c:out value="${order.quantity}" /></td>
                        <td style="text-align: right;"><c:out value="${order.subTotalPoint}" /></td>
                        <td style="text-align: right;"><c:out value="${order.subTotal}" /></td>
                    </tr>
                    <c:set var="totalPoint" value="${totalPoint + order.subTotalPoint}" />
                    <c:set var="total" value="${total + order.subTotal}" />
                </c:forEach>
                <tr>
                    <th colspan="5">合計金額</th>
                    <td style="text-align: right;"><c:out value="${totalPoint}" /></td>
                    <td style="text-align: right;"><c:out value="${total}" /></td>
                </tr>
            </table>

            <div class="button-group">
                <input type="hidden" name="flag" value="B0103PurchaseCheck">
                <input type="submit" value="確定" class="button">
            </div>
        </form>

        <div class="top-link">
            <a href="${pageContext.request.contextPath}/mserv?flag=B0103PurchaseProductsReturn">戻る</a>
            <br><br>
            <a href="${pageContext.request.contextPath}/mserv">トップに戻る</a>
        </div>
    </div>
    <div id="footerArea">
        <small>Copyright YYYY FUJITSU LEARNING MEDIA LIMITED</small>
    </div>
</body>
</html>