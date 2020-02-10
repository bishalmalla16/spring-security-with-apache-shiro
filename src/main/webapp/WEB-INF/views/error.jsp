<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Error Page</title>
</head>
<body>
    <h1>Access Denied!
        <c:out value="${errors.status}"/></h1>
    <h3><c:out value="${errors.message}"/></h3>
    <p>Please go back to
        <a href="${pageContext.request.contextPath}/">Home Page</a>
    </p>
</body>
</html>