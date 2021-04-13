<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<%--@elvariable id="passwordForm" type=""--%>
<form:form method="POST" modelAttribute="passwordForm">
    <div class="MyForm form-group" style="padding-top: 100px;">
        <form:label path="email">E-mail:</form:label>
        <span style="color: red">${emailMessage}</span>
        <form:input type="email" class="springInput" id="email" path="email"/><br/>

        <form:button type="submit" class="from-control">Submit</form:button>
    </div>
</form:form>