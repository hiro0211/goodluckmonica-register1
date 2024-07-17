<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>A社オンラインショッピング - 会員登録</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/loginInputCheck.js"></script>
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
        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 15px;
        }
        td {
            padding: 5px;
        }
        td:first-child {
            font-weight: bold;
            width: 30%;
            text-align: left; /* 左揃え */
        }
        input[type="text"], input[type="password"], .radio-group {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            text-align: left; /* 左揃え */
        }
        .radio-group {
            display: flex;
            align-items: center;
        }
        .radio-group label {
            margin-right: 15px;
        }
        .submit-button {
            margin-top: 20px;
            text-align: center;
        }
        .submit-button input[type="submit"] {
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
            margin-bottom: 20px;
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
    <jsp:include page="/jsp/header-non-menu.jsp" />
    <div id="mainArea">
        <h1>会員登録</h1>
        <div id="target">
            <c:forEach var="errorMessage" items="${errorMessageList}" varStatus="status">
                <p><c:out value="${errorMessage}" /></p>
            </c:forEach>
        </div>
        <form method="post" action="${pageContext.request.contextPath}/mserv" id="chkForm">
            <table>
                <tr>
                    <td>名前</td>
                    <td><input type="text" name="memberName" id="memberName" required></td>
                </tr>
                <tr>
                    <td>性別</td>
                    <td>
                        <div class="radio-group">
                            <input type="radio" id="male" name="gender" value="M" required>
                            <label for="male">男性</label>
                            <input type="radio" id="female" name="gender" value="F">
                            <label for="female">女性</label>
                            <input type="radio" id="other" name="gender" value="O">
                            <label for="other">その他</label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>住所</td>
                    <td><input type="text" name="address" id="address" required></td>
                </tr>
                <tr>
                    <td>電話番号</td>
                    <td><input type="text" name="phone" id="phone" required></td>
                </tr>
                <tr>
                    <td>パスワード</td>
                    <td><input type="password" name="password" id="password" required></td>
                </tr>
            </table>
            <input type="hidden" name="flag" value="B0201CheckMemberAction">
            <div class="submit-button">
                <input type="submit" value="確認">
            </div>
        </form>
        <div class="top-link">
            <a href="${pageContext.request.contextPath}/mserv">トップへ戻る</a>
        </div>
      <div id="footerArea">
        <small>Copyright YYYY FUJITSU LEARNING MEDIA LIMITED</small>
    </div>
    </div>
</body>
</html>