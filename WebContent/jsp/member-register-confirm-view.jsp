<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>会員登録確認</title>
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
        <h1>会員登録確認</h1>
        <%-- contents start --%>
        <div id="target" style="color: red;">
            <c:forEach var="errorMessage" items="${errorMessageList}" varStatus="status">
                <p>
                    <c:out value="${errorMessage}" />
                </p>
            </c:forEach>
        </div>
        <div class="result-message">
            <p>以下の内容で登録を行います。よろしければ「登録」ボタンをクリックしてください。</p>
        </div>
        <form method="post" action="${pageContext.request.contextPath}/mserv" id="confirmForm">
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
            <input type="hidden" name="flag" value="B0201RegisterMemberAction">
            <input type="submit" value="登録">
            <input type="button" value="修正" onclick="history.back()">
        </form>
        <p>
            <a href="${pageContext.request.contextPath}/mserv">[トップに戻る]</a>
        </p>
        <%-- contents end --%>
    </div>
    <div id="footerArea">
        <small>Copyright YYYY FUJITSU LEARNING MEDIA LIMITED</small>
    </div>
</body>
</html>