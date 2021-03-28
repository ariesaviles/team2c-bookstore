<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<head>

</head>

<%--@elvariable id="accountForm" type=""--%>
<form:form method="POST" modelAttribute="accountForm">
    <div class="MyForm form-group" style="padding-top: 20px;">
        <form:label path="firstName">First Name:</form:label>
        <form:input type="text" class="springInput" id="firstName" placeholder="i.e. Calvin" path="firstName"/>
        <form:label path="lastName">Last Name:</form:label>
        <form:input type="text" class="springInput" id="lastName" placeholder="i.e. Butson" path="lastName"/>
        <form:label path="email">First Name:</form:label>
        <form:input type="email" class="springInput" id="email" path="email"/>

        <form:input type="text" class="springInput" id="userName" path="userName"/>
        <form:label path="password">First Name:</form:label>
        <form:password class="springInput" id="password" path="password"/>

        <form:button type="submit" class="from-control">Submit</form:button>
    </div>
</form:form>