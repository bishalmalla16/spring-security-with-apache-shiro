<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Form</title>
</head>
<body>
<form:form modelAttribute="role" method="post" action="/register-role">
    <form:label path="roleName">Role: </form:label>
    <form:input type="text" path="roleName" placeholder="Role Name"/>
    <br/>

    <form:label path="permission">Permissions: </form:label>
    <form:checkbox path="permission" value="user:read"/>user:read
    <form:checkbox path="permission" value="user:*"/>user:*
    <form:checkbox path="permission" value="book:read"/>book:read
    <form:checkbox path="permission" value="book:*"/>book:*
    <br/>

    <input type="submit" value="Submit">
</form:form>
</body>
</html>