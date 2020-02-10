<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
<head>
    <title>Account Details</title>
</head>
<body>
    <h1>Your Account Information</h1>
    <div>
        <h3>You have following roles: </h3>
        <shiro:hasRole name="Administration">Admin role</shiro:hasRole>
        <br/>
        <shiro:hasRole name="User">User Role</shiro:hasRole>
    </div>
    <div>
        <h3>You dont have following roles: </h3>
        <shiro:lacksRole name="Administration">Admin role</shiro:lacksRole>
        <br/>
        <shiro:lacksRole name="User">User Role</shiro:lacksRole>
    </div>

    <div>
        <h3>List of Permissions: </h3>
        <p>
            You can
            <shiro:lacksPermission name="book:read">
                NOT
            </shiro:lacksPermission>
            read a book here.
        </p>
        <p>
            You can
            <shiro:lacksPermission name="book:write">
                NOT
            </shiro:lacksPermission>
            write a book here.
        </p>
        <p>
            You can
            <shiro:lacksPermission name="user:view">
                NOT
            </shiro:lacksPermission>
            view a user here.
        </p>
        <p>
            You can
            <shiro:lacksPermission name="user:update">
                NOT
            </shiro:lacksPermission>
            update a user here.
        </p>
        <p>
            You can
            <shiro:lacksPermission name="user:delete">
                NOT
            </shiro:lacksPermission>
            delete a user here.
        </p>
    </div>

    <a href="<c:url value="/"/>"><button>Back to Home Page</button></a>
    <br/>
    <a href="${pageContext.request.contextPath}/logout"><button>Logout</button></a>
</body>

</html>
