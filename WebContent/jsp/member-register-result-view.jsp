<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>会員登録結果</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
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
            background-color: #f2f2f2;
            font-weight: bold;
            text-align: left;
            width: 30%;
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
        <h1>会員登録結果</h1>
        <div class="result-message">
            <p>以下の内容で登録を行いました！</p>
        </div>
        <table>
            <tr>
                <th>名前</th>
                <td><c:out value="${member.memberName}" /></td>
            </tr>
            <tr>
                <th>性別</th>
                <td><c:out value="${member.gender}" /></td>
            </tr>
            <tr>
                <th>住所</th>
                <td><c:out value="${member.address}" /></td>
            </tr>
            <tr>
                <th>電話番号</th>
                <td><c:out value="${member.phone}" /></td>
            </tr>
            <tr>
                <th>メールアドレス</th>
                <td><c:out value="${member.memberId}" /></td>
            </tr>
        </table>
        <div class="top-link">
            <a href="${pageContext.request.contextPath}/mserv?flag=TOP">トップへ戻る</a>
        </div>
    </div>
    <div id="footerArea">
        <small>Copyright YYYY FUJITSU LEARNING MEDIA LIMITED</small>
    </div>
</body>
</html>