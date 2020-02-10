<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Shiro Home Page</title>
</head>
<body>
    <h1>Hi!
    <shiro:guest>Guest <a href="${pageContext.request.contextPath}/login"><button>Login</button></a><br/>
    </shiro:guest>
    <shiro:user>
<%--        <%--%>
<%--            request.setAttribute("subject", SecurityUtils.getSubject().getPrincipal());--%>
<%--        %>--%>
        <c:out value="${subject.principal}"/> <a href="/logout"><button>Logout</button></a> </shiro:user>
    </h1>

    <shiro:hasRole name="Administration">
        <a href="${pageContext.request.contextPath}/users">User List</a>
    </shiro:hasRole>
    <br/>
    <shiro:authenticated>
        <a href="${pageContext.request.contextPath}/account-info"><button>Account Info</button></a>
    </shiro:authenticated>

</body>
</html>