<!DOCTYPE html>
<html>
<head>
    <title>Shiro Login Page</title>
</head>
<body>
    <form action="" method="post">
        <label for="username">Username: </label>
        <input type="text" id="username" name="username" placeholder="Username">
        <br>
        <label for="password">Password: </label>
        <input type="password" id="password" name="password" placeholder="Password">
        <br>
        <input type="submit" value="Login">
    </form>
    <a href="${pageContext.request.contextPath}/"><button>Back</button></a><br/>
    <a href="${pageContext.request.contextPath}/register">Don't have an account! Register Here</a>

</body>
</html>