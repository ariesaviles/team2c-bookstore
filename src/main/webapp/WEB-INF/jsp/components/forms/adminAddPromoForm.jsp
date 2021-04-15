<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<%--@elvariable id="promoForm" type=""--%>
<form:form method="POST" modelAttribute="promoForm">
    <div class="MyForm form-group" style="padding-top: 90px;">

        <form:label path="promocode">Promotion Code to Add:</form:label>
        <span style="color: red">${badPromoCode}</span>
        <form:input type = "text" class="springInput" id="promocode" path="promocode"/>

        <form:label path="dateStart">Start Date:</form:label>
        <span style="color: red">${badStart}</span>
        <form:input type="text" class="springInput" id="dateStart" placeholder="YYYYmmDD" path="dateStart"/>

        <form:label path="dateEnd">End Date:</form:label>
        <span style="color: red">${badEnd}</span>
        <form:input type="text" class="springInput" id="dateEnd" placeholder="YYYYmmDD" path="dateEnd"/>

        <form:label path="discount">Discount Price:</form:label>
        <span style="color: red">${badDiscount}</span>
        <form:input type="text" class="springInput" id="discount" placeholder="DD.CC" path="discount"/>

        <form:button type="submit" class="from-control">Submit</form:button>
    </div>
</form:form>