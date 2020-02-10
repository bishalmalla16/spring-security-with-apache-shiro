<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Form</title>
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap-theme.min.css">
    <style>
        body{padding-top:20px;}
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Registration Form</h3>
                </div>
                <div class="panel-body text-center">
                    <form:form modelAttribute="user" method="post" action="/updateUser">
                        <fieldset>
                            <div class="form-group">
                                <form:input class="form-control" path="id" type="number" readonly="true"/>
                            </div>
                            <div class="form-group">
                                <form:input class="form-control" placeholder="Username" path="username" type="text"/>
                            </div>

                            <form:input type="hidden" path="password"/>
                            <form:label path="roles">Roles: </form:label>
                            <c:forEach items="${roleList}" var="role">
                                <form:checkbox path="roles" value="${role}"/> ${role.roleName} <br/>
                            </c:forEach>
                                <%--    <form:checkboxes path="roles" items="${roleList}"/> <br/>--%>

                            <button class="btn btn-lg btn-success" type="submit">Update</button>
                            <a href="${pageContext.request.contextPath}/users" class="btn btn-lg btn-primary">Cancel</a>
                        </fieldset>

                    </form:form>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>