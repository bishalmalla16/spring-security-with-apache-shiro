<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>List of Users</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        a{
            margin: 5px 2px;
        }
    </style>
</head>
<body>
<a href="${pageContext.request.contextPath}/register-role" class="btn btn-success">Add Role </a>

<div class="card">
        <table id="deviceTable" class="table table-hover display">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Username</th>
                    <th scope="col">Role</th>
                    <th scope="col">Permission</th>
                    <th scope="col">Actions</th>
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
                        <a href="${pageContext.request.contextPath}/update?id=${user.id}" class="btn btn-sm btn-primary">Edit</a>
                        <a href="${pageContext.request.contextPath}/delete?id=${user.id}" class="btn btn-sm btn-danger">Delete</a>
                    </td>
                </tr>
            </c:forEach>

            </tbody>
        </table>

    </div>

    <a href="${pageContext.request.contextPath}/" class="btn btn-primary">Back to Home Page</a>

</body>
</html>