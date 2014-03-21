<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>
    <table border="1">
    <th>First Name</th><th>Last Name</th><th>Gender</th><th>Chapter Name</th>
    <g:each in="${users}" var="user">
        <tr>
            <td>${user.firstName}</td>
            <td>${user.lastName}</td>
            <td>${user?.gender}</td>
            <td>${user?.chapter?.name}</td>
        </tr>
    </g:each>
    </table>
<body>

</body>
</html>