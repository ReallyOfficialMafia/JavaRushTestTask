<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Filtered list of books</title>
</head>
<body>
    <h1>Filtered list of books</h1>
    <table style="border: 1px solid; width: 500px; text-align:center">
        <thead style="">
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Description</th>
            <th>Author</th>
            <th>ISBN</th>
            <th>Print Year</th>
            <th>Is read</th>
            <th colspan="4"></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${books}" var="user">
            <tr>
                <td><c:out value="${user.id}" /></td>
                <td><c:out value="${user.name}" /></td>
                <td><c:out value="${user.age}" /></td>
                <td><c:out value="${user.admin}" /></td>
                <td><c:out value="${user.date}" /></td>
                <td><a href="${editUrl}">Edit</a></td>
                <td><a href="${deleteUrl}">Delete</a></td>
                <td><a href="${addUrl}">Add</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <c>
        Return to full list of books. <a href="${mainUrl}">Return</a>
    </c>

    <br>
    </br>
    <img src="${pageContext.request.contextPath}/jrtest.png"/>

</body>
</html>
