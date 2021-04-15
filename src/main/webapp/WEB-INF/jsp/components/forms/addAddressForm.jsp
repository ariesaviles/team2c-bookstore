<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<style> <%@ include file="../../css/forms.css"%> </style>

<%--@elvariable id="addressForm" type=""--%>
<form:form method="POST" modelAttribute="addressForm">
    <div class="MyForm form-group" style="padding-top: 20px; ">
        <div class="innerForm">
            <div class="row">

                <form:label path="street">Street:</form:label>
                <span style="color: red">${badStreet}</span><br/>
                <form:input type="text" class="springInput" id="street" path="street" cssClass="inputField"/><br/>

                <form:label path="city">city:</form:label>
                <span style="color: red">${badCity}</span><br/>
                <form:input type="text" class="springInput" id="city" path="city" cssClass="inputField"/><br/>

                <form:label path="state">state:</form:label>
                <span style="color: red">${badState}</span><br/>
                <form:input type="text" class="springInput" id="state" placeholder="i.e. Cracking the Coding Interview" path="state" cssClass="inputField"/><br/>

                <form:label path="zipCode">zip: </form:label>
                <span style="color: red">${badZip}</span><br/>
                <form:input type="text" class="springInput" id="zipCode" placeholder="i.e. Calvin Butson" path="zipCode" cssClass="inputField"/><br/>

            </div>

            <form:button type="submit" class="from-control" cssStyle="text-align: center">Submit</form:button>

        </div>
    </div>
</form:form>