<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>商品購入</title>
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
        input[type="text"], input[type="submit"] {
            padding: 8px;
            margin: 5px 0;
        }
        input[type="submit"] {
            background-color: #0056b3;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        #target {
            color: red;
            margin-bottom: 15px;
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
        <h1>商品購入</h1>

        <div id="target">
            <c:forEach var="errorMessage" items="${errorMessageList}" varStatus="status">
                <p><c:out value="${errorMessage}" /></p>
            </c:forEach>
        </div>

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
                <th>住所</th>
                <td><c:out value="${CommonLoginMember.address}" /></td>
            </tr>
            <tr>
                <th>電話番号</th>
                <td><c:out value="${CommonLoginMember.phone}" /></td>
            </tr>
        </table>

        <h2>クレジットカード番号入力</h2>
        <form method="post" action="${pageContext.request.contextPath}/mserv" id="chkForm">
            <table>
                <tr>
                    <td>クレジットカード番号</td>
                    <td><input type="text" name="creditCardIdfull" id="creditCardIdfull" size="20"></td>
                </tr>
            </table>
            <input type="hidden" name="flag" value="B0103PurchaseProducts">
            <input type="submit" value="決定">
        </form>

        <c:if test="${!empty B01ShoppingCart}">
            <h2>購入内容</h2>
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