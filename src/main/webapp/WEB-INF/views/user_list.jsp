<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>List of Users</title>
</head>
<body>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Role</th>
                <th>Permission</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${users}" var="user">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.username}</td>
                    <td><c:forEach items="${user.roles}" var="role">
                        ${role.roleName},
                    </c:forEach> </td>
                    <td><c:forEach items="${user.roles}" var="role">
                        <c:forEach items="${role.permission}" var="permission">
                            ${permission},
                        </c:forEach>
                    </c:forEach> </td>

                    <td>
                        <a href="${pageContext.request.contextPath}/update?id=${user.id}">Edit</a>
                        <a href="${pageContext.request.contextPath}/delete?id=${user.id}">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <a href="${pageContext.request.contextPath}/"><button>Back</button></a>

</body>
</html>