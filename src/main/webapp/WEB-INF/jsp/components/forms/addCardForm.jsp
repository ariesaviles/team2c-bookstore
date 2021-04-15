<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<style> <%@ include file="../../css/forms.css"%> </style>

<%--@elvariable id="cardForm" type=""--%>
<form:form method="POST" modelAttribute="cardForm">
    <div class="MyForm form-group" style="padding-top: 20px; ">
        <div class="innerForm">
            <div class="row">
                <div class="columnLForm">
                    <form:label path="cardHolderName">Holder Name:</form:label>
                    <span style="color: red">${badNumber}</span><br/>
                    <form:input type="text" class="springInput" id="cardHolderName" placeholder="i.e. Calvin Butson"
                                path="cardHolderName" cssClass="inputField"/><br/>


                    <form:label path="expirationDate">Exp. Date:</form:label>
                    <span style="color: red">${badExp}</span><br/>
                    <form:input type="text" class="springInput" id="expirationDate" placeholder="i.e. YYYY-MM-DD"
                                path="expirationDate" cssClass="inputField"/><br/>
                    <form:label path="cardType">Type:</form:label>
                    <span style="color: red">${badType}</span><br/>
                    <form:input type="text" class="springInput" id="cardType" path="cardType" placeholder="i.e. Visa"
                                cssClass="inputField"/><br/>

                </div>
                <div class="columnRForm">
                    <form:label path="cardNumber">Card Number:</form:label>
                    <span style="color: red">${badNumber}</span><br/>
                    <form:input type="text" class="springInput" id="cardNumber" placeholder="i.e. 123456789"
                                path="cardNumber" cssClass="inputField"/><br/>

                    <form:label path="cardSecurity">Security Code:</form:label>
                    <span style="color: red">${badSec}</span><br/>
                    <form:input type="text" class="springInput" id="cardSecurity" placeholder="246" path="cardSecurity"
                                cssClass="inputField"/><br/>
                </div>
            </div>

            <p><form:button type="submit" class="editButton" cssStyle="text-align: center">Submit</form:button></p>

        </div>
    </div>
</form:form>