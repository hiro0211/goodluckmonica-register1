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
            max-width: 95%;
            margin: 20px auto;
            overflow-x: auto; /* 横スクロールを可能にする */
        }
        h1 {
            color: #333;
            border-bottom: 2px solid #0056b3;
            padding-bottom: 10px;
        }
        .result-message {
            margin-bottom: 20px;
            font-weight: bold;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            writing-mode: horizontal-tb;
    		text-orientation: mixed;
   	 		white-space: nowrap;
        }
        th {
            background-color: #d3d3d3;
            font-weight: bold;
            text-align: left;
            width: 30%;
        }
        .button-group {
            text-align: center;
            margin-top: 20px;
        }
        .button {
            padding: 10px 20px;
            margin: 0 10px;
            font-size: 16px;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 4px;
        }
        .update-button {
            background-color: #0056b3;
        }
        .back-button {
            background-color: #6c757d;
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
        @media screen and (max-width: 600px) {
    	table {
        font-size: 14px; /* 小さな画面でフォントサイズを小さくする */
    	}

    	th, td {
        padding: 5px; /* さらにパディングを小さくする */
    	}
    </style>
</head>
<body>
	<jsp:include page="/jsp/header.jsp" />
	<div id="mainArea">
		<h1>会員情報照会</h1>
		<%-- contents start --%>
		いつもご利用いただきありがとうございます。<br> 現在のポイント数は
		<c:out value="${CommonLoginMember.memberPoint}" />
		ポイントです。

		<h2>会員情報</h2>
		<table border="1">
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

		<h2>注文情報</h2>

		<c:if test="${empty orderList}">
			<c:out value="${message}" />
		</c:if>

		<c:if test="${!empty orderList}">
			<table border="1">
				<tr bgcolor="#9999ff">
					<th>注文番号</th>
					<th>日付</th>
					<th>商品ID</th>
					<th>商品名</th>
					<th>単価</th>
					<th>数量</th>
					<th>ポイント</th>
					<th>小計金額</th>
				</tr>
				<c:forEach var="order" items="${orderList}" varStatus="status">
					<tr>
						<td><c:out value="${order.orderId}" /></td>
						<td><c:out value="${order.orderDate}" /></td>
						<td><c:out value="${order.product.productId}" /></td>
						<td><c:out value="${order.product.productName}" /></td>
						<td style="text-align: right;"><c:out
								value="${order.product.price}" /></td>
						<td style="text-align: right;"><c:out
								value="${order.quantity}" /></td>
						<td style="text-align: right;"><c:out
								value="${order.subTotalPoint}" /></td>
						<td style="text-align: right;"><c:out
								value="${order.subTotal}" /></td>
					</tr>
					<c:set var="total" value="${total + order.subTotal}" />
				</c:forEach>
				<tr>
					<th colspan="7">合計金額</th>
					<td style="text-align: right;"><c:out value="${total}" /></td>
				</tr>
			</table>
		</c:if>

		<br> <br> <a
			href="${pageContext.request.contextPath}/mserv?flag=B0203UpdateMember">[会員情報更新]</a>&nbsp;&nbsp;
		<a href="${pageContext.request.contextPath}/mserv">[トップに戻る]</a>

		<%-- contents end --%>
	</div>
	<div id="footerArea">
		<small>Copyright YYYY FUJITSU LEARNING MEDIA LIMITED</small>
	</div>
</body>
</html>