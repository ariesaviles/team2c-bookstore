<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<%--@elvariable id="promoForm" type=""--%>
<form:form method="POST" modelAttribute="promoForm">
    <div class="MyForm form-group" style="padding-top: 90px;">

        <form:label path="promoCode">Promotion Code to Add:</form:label>
        <span style="color: red">${badPromoCode}</span>
        <form:input class="springInput" id="promoCode" path="promoCode"/>

        <form:label path="startDate">Start Date:</form:label>
        <span style="color: red">${badStart}</span>
        <form:input type="text" class="springInput" id="startDate" placeholder="YYYYmmDD" path="startDate"/>

        <form:label path="endDate">End Date:</form:label>
        <span style="color: red">${badEnd}</span>
        <span style="color: red">${badOrder}</span>
        <form:input type="text" class="springInput" id="endDate" placeholder="YYYYmmDD" path="endDate"/>

        <form:label path="discount">Discount Price:</form:label>
        <span style="color: red">${badDiscount}</span>
        <form:input type="text" class="springInput" id="discount" placeholder="DD.CC" path="discount"/>

        <form:button type="submit" class="from-control">Submit</form:button>
    </div>
</form:form>