<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                    <form:form modelAttribute="user" method="post" action="/registration">
                        <fieldset>
                            <div class="form-group">
                                <form:input class="form-control" placeholder="Username" path="username" type="text"/>
                            </div>
                            <div class="form-group">
                                <form:input class="form-control" placeholder="Password" path="password" type="password"/>
                            </div>
                            <button class="btn btn-lg btn-success" type="submit">Register</button>
                            <a href="${pageContext.request.contextPath}/login" class="btn btn-lg btn-primary">Back</a>
                        </fieldset>
                    </form:form>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>