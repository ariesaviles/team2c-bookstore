<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<%--@elvariable id="accountForm" type=""--%>
<form:form method="POST" modelAttribute="accountForm">
    <div class="MyForm form-group" style="padding-top: 90px;">
        <form:label path="firstName">First Name: *</form:label>
        <span style="color: red">${badFirst}</span>
        <form:input type="text" class="springInput" id="firstName" placeholder="i.e. Calvin" path="firstName"/>

        <form:label path="lastName">Last Name: *</form:label>
        <span style="color: red">${badLast}</span>
        <form:input type="text" class="springInput" id="lastName" placeholder="i.e. Butson" path="lastName"/>

        <form:label path="birthDate">Date of Birth: *</form:label>
        <span style="color: red">${badBirth}</span>
        <form:input type="text" class="springInput" id="birthDate" placeholder="YYYYmmDD" path="birthDate"/>

        <form:label path="email">E-mail: *</form:label>
        <span style="color: red">${emailExist}</span>
        <span style="color: red">${badEmail}</span>
        <form:input type="email" class="springInput" id="email" path="email"/>
        <form:label path="email">Username: *</form:label>

        <span style="color: red">${userNameExist}</span>
        <span style="color: red">${badUser}</span>
        <form:input type="text" class="springInput" id="userName" path="userName"/>
        <form:label path="password">Password: *</form:label>
        <span style="color: red">${badPass}</span>
        <form:password class="springInput" id="password" path="password"/>

        <form:label path="streetAdd">Street:</form:label>
        <form:input type="text" class="springInput" id="streetAdd" placeholder="123 Broad St" path="streetAdd"/>

        <form:label path="city">Street:</form:label>
        <form:input type="text" class="springInput" id="city" placeholder="Athens" path="city"/>

        <form:label path="state">Street:</form:label>
        <form:input type="text" class="springInput" id="state" placeholder="Georgia" path="state"/>

        <form:label path="zipCode">Street:</form:label>
        <form:input type="text" class="springInput" id="zipCode" placeholder="30609" path="zipCode"/>


        <form:button type="submit" class="from-control">Submit</form:button>
    </div>
</form:form>