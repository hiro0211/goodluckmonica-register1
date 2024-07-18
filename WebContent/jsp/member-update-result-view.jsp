<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>会員情報更新完了</title>
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
            margin: 20px 0;
            font-size: 18px;
            text-align: center;
        }
        .button-group {
            text-align: center;
            margin-top: 20px;
        }
        .button {
            padding: 10px 20px;
            font-size: 16px;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 4px;
            text-decoration: none;
            display: inline-block;
        }
        .top-button {
            background-color: #0056b3;
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
        <h1>会員情報更新完了</h1>
        <div id="target" style="color: red;">
            <c:forEach var="errorMessage" items="${errorMessageList}" varStatus="status">
                <p><c:out value="${errorMessage}" /></p>
            </c:forEach>
        </div>
        <div class="result-message">
            <p>会員情報の更新が完了しました。</p>
        </div>
        <div class="button-group">
            <a href="${pageContext.request.contextPath}/mserv" class="button top-button">トップへ戻る</a>
        </div>
    </div>
    <div id="footerArea">
        <small>Copyright YYYY FUJITSU LEARNING MEDIA LIMITED</small>
    </div>
</body>
</html>