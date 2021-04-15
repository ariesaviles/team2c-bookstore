<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style> <%@ include file="../../css/forms.css"%> </style>

<%--@elvariable id="accountForm" type=""--%>
<form:form method="POST" modelAttribute="accountForm">
    <div class="MyForm form-group" style="padding-top: 1px;">
    <div class="innerForm">
    <div class="row">
    <div class="columnFullForm">
        <form:label path="firstName">First Name:</form:label><br/>

        <form:input type="text" class="springInput" id="firstName" placeholder="${firstName}" path="firstName"/><br/><br/>

        <form:label path="lastName">Last Name:</form:label><br/>
        <form:input type="text" class="springInput" id="lastName" placeholder="${lastName}" path="lastName"/><br/><br/>

        <form:label path="birthDate">Date of Birth:</form:label><br/>
        <form:input type="text" class="springInput" id="birthDate" placeholder="${birthDate}" path="birthDate"/><br/><br/>

        <form:label path="email">Username:</form:label><br/>
        <form:input type="text" class="springInput" id="userName" placeholder="${userName}" path="userName"/><br/><br/>


    </div>
    </div>
        <form:button type="submit" class="from-control">Submit</form:button>
    </div>
    </div>

</form:form>

<div class="columnRForm">


</div>

<a>Subscribed to Promotions: </a>
<td><a href="/changePromoStatus"><button>
    <p> ${isPromotion}</p>
</button></a></td>
