<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Form</title>
</head>
<body>
    <form:form modelAttribute="user" method="post" action="/registration">
        <form:label path="username">Username: </form:label>
        <form:input type="text" path="username" id="username" placeholder="Username"/>
        <br/>
        <form:label path="password">Password: </form:label>
        <form:input type="password" path="password" id="password" placeholder="Password"/>
        <br/>
        <input type="submit" value="Submit">
    </form:form>
    <a href="${pageContext.request.contextPath}/login"><button>Back</button></a><br/>

</body>
</html>