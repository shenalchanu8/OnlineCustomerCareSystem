<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Data Display</title>
</head>
<body>
    <h1>Display Data from the Database</h1>
    <table>
        <tr>
            <th>fID</th>
            <th>Name</th>
            <th>email</th>
            <th>feedback</th>
            <th>review</th>
            
           
        </tr>
        <c:forEach var="row" items="${requestScope.data}">
            <tr>
                <td>${row.fID}</td>
                <td>${row.name}</td>
                <td>${row.email}</td>
                <td>${row.feedback}</td>
                <td>${row.review}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
