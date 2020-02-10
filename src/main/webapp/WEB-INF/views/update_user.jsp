<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Form</title>
</head>
<body>
<form:form modelAttribute="user" method="post" action="/updateUser">

    <form:label path="id">Id: </form:label>
    <form:input type="number" path="id" id="username" placeholder="Id" readonly="true"/>
    <br/>
    <form:label path="username">Username: </form:label>
    <form:input type="text" path="username" id="username" placeholder="Username"/>
    <br/>
    <form:input type="hidden" path="password"/>
    <br/>
    <form:label path="roles">Roles: </form:label>
    <c:forEach items="${roleList}" var="role">
        <form:checkbox path="roles" value="${role}"/> ${role.roleName} <br/>
    </c:forEach>
<%--    <form:checkboxes path="roles" items="${roleList}"/> <br/>--%>
    <input type="submit" value="Update">
    
</form:form>
<a href="${pageContext.request.contextPath}/users"><button>Cancel</button></a>
</body>
</html>