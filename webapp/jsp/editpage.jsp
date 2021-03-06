<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Edit user</title>
</head>
<body>
    <h1>Edit user</h1>
        <table>
            <tr>
                <td><form:label path="id">ID:</form:label></td>
                <td><form:input path="id" disabled="true"/></td>
            </tr>

            <tr>
                <td><form:label path="title">Title:</form:label></td>
                <td><form:input path="title"/></td>
            </tr>

            <tr>
                <td><form:label path="description">Description:</form:label></td>
                <td><form:input path="description"/></td>
            </tr>

            <tr>
                <td><form:label path="author">Author:</form:label></td>
                <td><form:input path="author"/></td>
            </tr>

            <tr>
                <td><form:label path="isbn">ISBN:</form:label></td>
                <td><form:input path="isbn"/></td>
            </tr>

            <tr>
                <td><form:label path="printYear">Print Year:</form:label></td>
                <td><form:input path="printYear"/></td>
            </tr>

            <tr>
                <td><form:label path="readAlready">Is read:</form:label></td>
                <td><form:input path="readAlready"/></td>
            </tr>
        </table>

        <input type="submit" value="Save" />
    <img src="${pageContext.request.contextPath}/jrtest.png"/>
</body>
</html>
