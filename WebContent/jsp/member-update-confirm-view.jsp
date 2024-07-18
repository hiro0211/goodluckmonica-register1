<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>会員情報更新確認</title>
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
            max-width: 600px;
            margin: 20px auto;
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
    </style>
</head>
<body>
    <jsp:include page="/jsp/header.jsp" />
    <div id="mainArea">
        <h1>会員情報更新確認</h1>
        <div id="target" style="color: red;">
            <c:forEach var="errorMessage" items="${errorMessageList}" varStatus="status">
                <p><c:out value="${errorMessage}" /></p>
            </c:forEach>
        </div>
        <div class="result-message">
            <p>以下の内容で更新を行います。よろしければ「更新」ボタンをクリックしてください。</p>
        </div>
        <form method="post" action="${pageContext.request.contextPath}/mserv" id="confirmForm">
            <table>
                <tr>
                    <th>名前</th>
                    <td><c:out value="${CommonLoginMember.memberName}" /></td>
                </tr>
                <tr>
                    <th>性別</th>
                    <td><c:out value="${CommonLoginMember.gender}" /></td>
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
            <input type="hidden" name="flag" value="B0203UpdateMember">
            <div class="button-group">
                <input type="submit" value="更新" class="button update-button">
                <input type="button" value="戻る" onclick="history.back()" class="button back-button">
            </div>
        </form>
        <div class="top-link">
            <a href="${pageContext.request.contextPath}/mserv">トップへ戻る</a>
        </div>
    </div>
    <div id="footerArea">
        <small>Copyright YYYY FUJITSU LEARNING MEDIA LIMITED</small>
    </div>
</body>
</html>