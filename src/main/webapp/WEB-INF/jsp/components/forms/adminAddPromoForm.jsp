<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<%--@elvariable id="promoForm" type=""--%>
<form:form method="POST" modelAttribute="promoForm">
    <div class="MyForm form-group" style="padding-top: 2px;">
        <div class="innerForm">
            <div class="row">
                <div class="columnLForm"

        <form:label path="promocode">Promotion Code to Add:</form:label>
        <span style="color: red">${badPromoCode}</span>
        <form:input type = "text" class="springInput" id="promocode" path="promocode"/>

        <form:label path="dateStart">Start Date:</form:label>
        <span style="color: red">${badStart}</span>
        <form:input type="text" class="springInput" id="dateStart" placeholder="YYYYmmDD" path="dateStart"/>
            </div>
                <div class="columnRForm">
        <form:label path="dateEnd">End Date:  </form:label>
        <span style="color: red">${badEnd}</span>
        <form:input type="text" class="springInput" id="dateEnd" placeholder="YYYYmmDD" path="dateEnd"/>

        <form:label path="discount">    Discount Price:</form:label>
        <form:input type="text" class="springInput" id="discount" placeholder="00.00" path="discount"/>
            </div>
        </div>

        <form:button type="submit" class="from-control">Submit</form:button>

    </div>
    </div>
</form:form>