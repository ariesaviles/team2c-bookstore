<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<head>

</head>

<%--@elvariable id="loginForm" type=""--%>
<form:form method="POST" modelAttribute="loginForm">
    <div class="MyForm form-group" style="padding-top: 90px;">
        <form:label path="email">E-mail:</form:label>
        <form:input type="text" class="springInput" id="email" path="email"/><br/>
        <form:label path="password">Password:</form:label>
        <form:password class="springInput" id="password" path="password"/><br/>

        <form:button type="submit" class="from-control">Submit</form:button>
    </div>
</form:form>