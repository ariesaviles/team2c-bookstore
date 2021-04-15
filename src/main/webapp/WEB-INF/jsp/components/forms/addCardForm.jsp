<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<style> <%@ include file="../../css/forms.css"%> </style>

<%--@elvariable id="cardForm" type=""--%>
<form:form method="POST" modelAttribute="cardForm">
    <div class="MyForm form-group" style="padding-top: 20px; ">
        <div class="innerForm">
            <div class="row">

                <form:label path="cardType">cardType:</form:label>
                <span style="color: red">${badType}</span><br/>
                <form:input type="text" class="springInput" id="cardType" path="cardType" cssClass="inputField"/><br/>

                <form:label path="expirationDate">expirationDate:</form:label>
                <span style="color: red">${badExp}</span><br/>
                <form:input type="text" class="springInput" id="expirationDate" placeholder="i.e. Cracking the Coding Interview" path="expirationDate" cssClass="inputField"/><br/>

                <form:label path="cardNumber">card number:</form:label>
                <span style="color: red">${badNumber}</span><br/>
                <form:input type="text" class="springInput" id="cardNumber" placeholder="i.e. Calvin Butson" path="cardNumber" cssClass="inputField"/><br/>

                <form:label path="cardSecurity">card Security:</form:label>
                <span style="color: red">${badSec}</span><br/>
                <form:input type="text" class="springInput" id="cardSecurity" placeholder="i.e. https://www.cs.uga.edu/sites/default/files/styles/square_400x400/public/faculty_13.jpg" path="cardSecurity" cssClass="inputField"/><br/>
            </div>

            <form:button type="submit" class="from-control" cssStyle="text-align: center">Submit</form:button>

        </div>
    </div>
</form:form>