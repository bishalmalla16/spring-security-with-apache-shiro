<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Shiro Home Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
    <div class="container col-md-4 text-center">
        <h1>Hi!
            <shiro:guest>Guest <a href="${pageContext.request.contextPath}/login" class="btn btn-primary">Login</a><br/>
            </shiro:guest>
            <shiro:user>
                <%--        <%--%>
                <%--            request.setAttribute("subject", SecurityUtils.getSubject().getPrincipal());--%>
                <%--        %>--%>
                <c:out value="${subject.principal}"/> <a href="/logout" class="btn btn-danger">Logout</a> </shiro:user>
        </h1>

        <shiro:hasRole name="Administration">
            <a href="${pageContext.request.contextPath}/users"><h3>List of Users</h3></a>
        </shiro:hasRole>
        <br/>
        <shiro:authenticated>
            <a href="${pageContext.request.contextPath}/account-info" class="btn btn-info">Account Info</a>
        </shiro:authenticated>

    </div>

</body>
</html>