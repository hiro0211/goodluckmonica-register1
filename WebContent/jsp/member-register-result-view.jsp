<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>会員登録結果</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <style>
    .result-message {
        margin-bottom: 20px;
        font-weight: bold;
    }
    </style>
</head>
<body>
    <jsp:include page="/jsp/header-non-menu.jsp" />
    <div id="mainArea">
        <h1>会員登録結果</h1>
        <%-- contents start --%>
        <div class="result-message">
            <p>以下の内容で登録を行いました！</p>
        </div>
        <table>
            <tr>
                <td>名前</td>
                <td><c:out value="${member.memberName}" /></td>
            </tr>
            <tr>
                <td>性別</td>
                <td><c:out value="${member.gender}" /></td>
            </tr>
            <tr>
                <td>住所</td>
                <td><c:out value="${member.address}" /></td>
            </tr>
            <tr>
                <td>電話番号</td>
                <td><c:out value="${member.phone}" /></td>
            </tr>
            <tr>
                <td>メールアドレス</td>
                <td><c:out value="${member.memberId}" /></td>
            </tr>
        </table>
        <br>
        <p>
            <a href="${pageContext.request.contextPath}/mserv?flag=TOP">[トップに戻る]</a>
        </p>
        <%-- contents end --%>
    </div>
    <div id="footerArea">
        <small>Copyright YYYY FUJITSU LEARNING MEDIA LIMITED</small>
    </div>
</body>
</html>