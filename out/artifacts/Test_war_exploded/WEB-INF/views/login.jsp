<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
    <head>
        <title>Login Page</title>
        <!-- Custom styles for this template -->
        <link href="<c:url value="/resources/css/custom.css" />" rel="stylesheet">
    </head>
    <body>
    <c:if test="${not empty msg}" >
        <div class="msg">${msg}</div>
    </c:if>
        <div class="login-page">
            <div class="form">
                <%--<form class="register-form">
                    <input type="text" placeholder="username"/>
                    <input type="password" placeholder="password"/>
                    <input type="text" placeholder="email address"/>
                    <button>create</button>
                    <p class="message">Already registered? <a href="#">Sign In</a></p>
                </form>--%>
                    <%--displaying login error--%>
                    <c:if test="${not empty error}">
                        <div class="error" style="color:#ff0000">${error}</div>
                    </c:if>
                <form class="login-form" action="<c:url value="/j_spring_security_check" />" method="post">
                    <input type="text" name="username" placeholder="username"/>
                    <input type="password" name="password" placeholder="password"/>
                    <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
                    <input type="submit" value="Login" />
                    <p class="message">Not registered? <a href="#">Create an account</a></p>
                </form>
            </div>
        </div>
    </body>
    <script src="<c:url value="jquery-3.2.1.min.js" />"></script>

</html>