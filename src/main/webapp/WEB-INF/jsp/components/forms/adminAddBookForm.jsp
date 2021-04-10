<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<%--@elvariable id="accountForm" type=""--%>
<form:form method="POST" modelAttribute="accountForm">
    <div class="MyForm form-group" style="padding-top: 90px;">
        <form:label path="title">Title:</form:label>
        <span style="color: red">${badFirst}</span>
        <form:input type="text" class="springInput" id="firstName" placeholder="i.e. Calvin" path="firstName"/>

        <form:label path="authors">Author(s):</form:label>
        <span style="color: red">${badLast}</span>
        <form:input type="text" class="springInput" id="lastName" placeholder="i.e. Butson" path="lastName"/>

        <form:label path="imgLink">Cover Image URL:</form:label>
        <span style="color: red">${badBirth}</span>
        <form:input type="text" class="springInput" id="birthDate" placeholder="YYYYmmDD" path="birthDate"/>

        <form:label path="edition">Edition:</form:label>
        <span style="color: red">${emailExist}</span>
        <span style="color: red">${badEmail}</span>
        <form:input type="email" class="springInput" id="email" path="email"/>

        <form:label path="genre">Category:</form:label>
        <span style="color: red">${userNameExist}</span>
        <span style="color: red">${badUser}</span>
        <form:input type="text" class="springInput" id="userName" path="userName"/>

        <form:label path="publisher">Publisher:</form:label>
        <span style="color: red">${badPass}</span>
        <form:password class="springInput" id="password" path="password"/>

        <form:label path="publishYear">Publication Year:</form:label>
        <span style="color: red">${badPass}</span>
        <form:password class="springInput" id="password" path="password"/>

        <form:label path="quantity">Quantity In Stock:</form:label>
        <span style="color: red">${badPass}</span>
        <form:password class="springInput" id="password" path="password"/>

<%--        <form:label path="password">Minimum_Threshold:</form:label>--%>
<%--        <span style="color: red">${badPass}</span>--%>
<%--        <form:password class="springInput" id="password" path="password"/>--%>

        <form:label path="price">Buying Price:</form:label>
        <span style="color: red">${badPass}</span>
        <form:password class="springInput" id="password" path="password"/>

        <form:label path="sellPrice">Selling Price:</form:label>
        <span style="color: red">${badPass}</span>
        <form:password class="springInput" id="password" path="password"/>

        <form:label path="password">Bookscol:</form:label>
        <span style="color: red">${badPass}</span>
        <form:password class="springInput" id="password" path="password"/>

        <form:label path="description">Description:</form:label>
        <span style="color: red">${badPass}</span>
        <form:password class="springInput" id="password" path="password"/>

        <form:button type="submit" class="from-control">Submit</form:button>
    </div>
</form:form>