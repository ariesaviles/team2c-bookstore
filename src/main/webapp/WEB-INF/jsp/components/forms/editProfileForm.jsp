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



        <form:button type="submit" class="from-control">Submit</form:button>
    </div>


</form:form>

<div class="columnRForm">


</div>


<a>Subscribed to Promotions: </a>
<td><a href="/changePromoStatus"><button>
    <p> ${isPromotion}</p>
</button></a></td>