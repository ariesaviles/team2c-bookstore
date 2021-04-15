<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<style> <%@ include file="../../css/forms.css"%> </style>

<%--@elvariable id="promoForm" type=""--%>
<form:form method="POST" modelAttribute="promoForm">
    <div class="MyForm form-group" style="padding-top: 20px;">
        <div class="innerForm">
            <div class="row">
                <div class="columnFullForm"
        <form:label path="promocode">Promotion Code:</form:label>
        <span style="color: red">${badPromoCode}</span><br/>
        <form:input type = "text" class="springInput" id="promocode" path="promocode"/><br/><br/>

        <form:label path="dateStart">Start Date:</form:label>
        <span style="color: red">${badStart}</span><br/>
        <form:input type="text" class="springInput" id="dateStart" placeholder="YYYYmmDD" path="dateStart"/><br/><br/>

        <form:label path="dateEnd">End Date:</form:label>
        <span style="color: red">${badEnd}</span><br/>
        <form:input type="text" class="springInput" id="dateEnd" placeholder="YYYYmmDD" path="dateEnd"/><br/><br/>

        <form:label path="discount">Discount Price:</form:label>
        <span style="color: red">${badDiscount}</span><br/>
        <form:input type="text" class="springInput" id="discount" placeholder="DD.CC" path="discount"/><br/><br/>

                <div style="text-align: center"></div>
                <p><form:button type="submit" class="editButton" cssStyle="">Submit</form:button></p>
            </div>
            </div>
    </div>
</form:form>
</div>