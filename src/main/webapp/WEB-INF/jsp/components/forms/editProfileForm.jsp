<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<%--@elvariable id="accountForm" type=""--%>
<form:form method="POST" modelAttribute="accountForm">
    <div class="MyForm form-group" style="padding-top: 90px;">
        <form:label path="firstName">First Name:</form:label>

        <form:input type="text" class="springInput" id="firstName" placeholder="${firstName}" path="firstName"/><br/>

        <form:label path="lastName">Last Name:</form:label>
        <form:input type="text" class="springInput" id="lastName" placeholder="${lastName}" path="lastName"/><br/>

        <form:label path="birthDate">Date of Birth:</form:label>
        <form:input type="text" class="springInput" id="birthDate" placeholder="${birthDate}" path="birthDate"/><br/>

        <form:label path="email">Username:</form:label>
        <form:input type="text" class="springInput" id="userName" placeholder="${userName}" path="userName"/><br/>

        <c:choose>
            <c:when test="${isPromotion}">
                <label class="lblActive">Is Subscribed? </label>
                <input type="radio" id="chStatusId" name="status" value="true" checked="?${isPromotion}'checked':''"/>
                <label class="lblActive">True</label>
                <input type="radio" id="chStatusId" name="status" value="false" checked="?${isPromotion}'':'checked'"/>
                <label class="lblInactive">False</label>
            </c:when>
        </c:choose>
        <br/>

        <form:button type="submit" class="from-control">Submit</form:button>
    </div>
</form:form>