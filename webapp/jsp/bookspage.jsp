<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>List of users</title>
</head>
<body>
<br>
    <h1>Users</h1>
    <table style="border: 2px solid; width: 650px; text-align:center">
        <thead style="">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Age</th>
            <th>isAdmin</th>
            <th>Created Date</th>
            <th colspan="4"></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${books}" var="book">
            <tr>
                <td><c:out value="${book.id}" /></td>
                <td><c:out value="${book.name}" /></td>
                <td><c:out value="${book.age}" /></td>
                <td><c:out value="${book.admin}" /></td>
                <td><c:out value="${book.date}" /></td>
                <td><a href="${editUrl}">Edit</a></td>
                <td><a href="${deleteUrl}">Delete</a></td>
                <td><a href="${addUrl}">Add</a></td>
            </tr>
        </c:forEach>
        </tbody>
        <tbody>
    </table>

    <c:if test="${booksfull.size() > -1}">
        <c:forEach begin="1" end="${count}" var="val">
            <a href="${pageURL}">${val}</a>-.
        </c:forEach>
    </c:if>
    <br>
    </br>

    <c:if test="${empty books}">
        List of books is empty, but you can add someone. <a href="${addUrl}">Add</a> a book.
    </c:if>
    <br>
    </br>
    <c>
        You can filter books. <a href="${filterUrl}">Filter</a>.
    </c>

    <br>
    </br>
    <img src="${pageContext.request.contextPath}/jrtest.png"/>

</body>
</html>
