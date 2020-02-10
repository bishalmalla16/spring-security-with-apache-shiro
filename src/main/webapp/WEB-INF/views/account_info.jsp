<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
<head>
    <title>Account Details</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        a{
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container col-md-6">
        <h1 class="text-center">Your Account Information</h1>
        <div>
            <h4>You have following roles: </h4>
            <ul class="list-group">
                <shiro:hasRole name="Administration"><li class="list-group-item">Admin role</li></shiro:hasRole>

                <shiro:hasRole name="User"><li class="list-group-item">User role</li></shiro:hasRole>

                <shiro:hasRole name="Manager"><li class="list-group-item">Manager role</li></shiro:hasRole>
            </ul>

        </div>
        <div>
            <h4>You dont have following roles: </h4>
            <ul class="list-group">
                <shiro:lacksRole name="Administration"><li class="list-group-item">Admin role</li></shiro:lacksRole>

                <shiro:lacksRole name="User"><li class="list-group-item">User role</li></shiro:lacksRole>

                <shiro:lacksRole name="Manager"><li class="list-group-item">Manager role</li></shiro:lacksRole>
            </ul>
        </div>

        <div>
            <h4>List of Permissions: </h4>
            <ul class="list-group">
                <li class="list-group-item">
                    You can
                    <shiro:lacksPermission name="book:read">
                        NOT
                    </shiro:lacksPermission>
                    read a book here.
                </li>
                <li class="list-group-item">
                    You can
                    <shiro:lacksPermission name="book:write">
                        NOT
                    </shiro:lacksPermission>
                    write a book here.
                </li>
                <li class="list-group-item">
                    You can
                    <shiro:lacksPermission name="user:view">
                        NOT
                    </shiro:lacksPermission>
                    view a user here.
                </li>
                <li class="list-group-item">
                    You can
                    <shiro:lacksPermission name="user:update">
                        NOT
                    </shiro:lacksPermission>
                    update a user here.
                </li>
                <li class="list-group-item">
                    You can
                    <shiro:lacksPermission name="user:delete">
                        NOT
                    </shiro:lacksPermission>
                    delete a user here.
                </li>
            </ul>
        </div>
        <div class="text-center">
            <a href="<c:url value="/"/>" class="btn btn-primary">Back to Home Page</a>
            <a href="${pageContext.request.contextPath}/logout" class="btn btn-danger">Logout</a>
        </div>
    </div>

</body>
</html>
