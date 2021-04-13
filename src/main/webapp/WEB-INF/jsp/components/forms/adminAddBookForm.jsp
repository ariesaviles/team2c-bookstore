<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<%--@elvariable id="bookForm" type=""--%>
<form:form method="POST" modelAttribute="bookForm">
    <div class="MyForm form-group" style="padding-top: 90px;">
        <form:label path="quantity">Quantity to Add:</form:label>
        <span style="color: red">${badPass}</span>
        <form:password class="springInput" id="quantity" path="quantity"/>

        <form:label path="title">Title:</form:label>
        <span style="color: red">${badFirst}</span>
        <form:input type="text" class="springInput" id="title" placeholder="i.e. Calvin" path="title"/>

        <form:label path="authors">Author(s):</form:label>
        <span style="color: red">${badLast}</span>
        <form:input type="text" class="springInput" id="authors" placeholder="i.e. Butson" path="authors"/>

        <form:label path="imgLink">Cover Image URL:</form:label>
        <span style="color: red">${badBirth}</span>
        <form:input type="text" class="springInput" id="imgLink" placeholder="YYYYmmDD" path="imgLink"/>

        <form:label path="edition">Edition:</form:label>
        <span style="color: red">${emailExist}</span>
        <span style="color: red">${badEmail}</span>
        <form:input type="email" class="springInput" id="edition" path="edition"/>

        <form:label path="genre">Category:</form:label>
        <span style="color: red">${userNameExist}</span>
        <span style="color: red">${badUser}</span>
        <form:input type="text" class="springInput" id="genre" path="genre"/>

        <form:label path="publisher">Publisher:</form:label>
        <span style="color: red">${badPass}</span>
        <form:password class="springInput" id="publisher" path="publisher"/>

        <form:label path="publishYear">Publication Year:</form:label>
        <span style="color: red">${badPass}</span>
        <form:password class="springInput" id="publishYear" path="publishYear"/>

        <form:label path="quantity">Quantity In Stock:</form:label>
        <span style="color: red">${badPass}</span>
        <form:password class="springInput" id="quantity" path="quantity"/>

<%--        <form:label path="password">Minimum_Threshold:</form:label>--%>
<%--        <span style="color: red">${badPass}</span>--%>
<%--        <form:password class="springInput" id="password" path="password"/>--%>

        <form:label path="price">Buying Price:</form:label>
        <span style="color: red">${badPass}</span>
        <form:password class="springInput" id="price" path="price"/>

        <form:label path="buyPrice">Selling Price:</form:label>
        <span style="color: red">${badPass}</span>
        <form:password class="springInput" id="buyPrice" path="buyPrice"/>

<%--        <form:label path="password">Bookscol:</form:label>--%>
<%--        <span style="color: red">${badPass}</span>--%>
<%--        <form:password class="springInput" id="password" path="password"/>--%>

        <form:label path="description">Description:</form:label>
        <span style="color: red">${badPass}</span>
        <form:password class="springInput" id="description" path="description"/>

        <form:button type="submit" class="from-control">Submit</form:button>
    </div>
</form:form>