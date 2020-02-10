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
                    <h3 class="panel-title">Add a new Role</h3>
                </div>
                <div class="panel-body text-center">
                    <form:form modelAttribute="role" method="post" action="/register-role">
                        <fieldset>
                            <div class="form-group">
                                <form:input cssClass="form-control" type="text" path="roleName" placeholder="Role Name"/>
                            </div>
                            <div style="width: 100%; height: 100px">
                                <div style="width: 30%; float: left">
                                    <span class="input-group-text">Permission(s): </span>
                                </div>
                                <div style="width: 70%; float: right; text-align: left; padding-left: 20px">
                                    <form:checkbox path="permission" value="user:view"/>user:view<br/>
                                    <form:checkbox path="permission" value="user:*"/>user:*<br/>
                                    <form:checkbox path="permission" value="book:read"/>book:read<br/>
                                    <form:checkbox path="permission" value="book:*"/>book:*
                                </div>
                            </div>

                            <input class="btn btn-lg btn-success" type="submit" value="Save">
                            <a href="${pageContext.request.contextPath}/users" class="btn btn-lg btn-primary">Cancel</a><br/>
                        </fieldset>
                    </form:form>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>