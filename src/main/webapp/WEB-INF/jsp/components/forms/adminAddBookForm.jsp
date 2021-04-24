<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<style> <%@ include file="../../css/forms.css"%> </style>

<%--@elvariable id="bookForm" type=""--%>
<form:form method="POST" modelAttribute="bookForm">
    <div class="MyForm form-group" style="padding-top: 20px; ">
        <div class="innerForm">
            <div class="row">
                <div class="columnLForm"

                     <form:label path="ISBN">ISBN:</form:label>
                <span style="color: red">${badISBN}</span><br/>
                <form:input class="springInput" id="ISBN" path="ISBN" cssClass="inputField"/><br/>

                <form:label path="title">Title:</form:label>
                <span style="color: red">${badTitle}</span><br/>
                <form:input type="text" class="springInput" id="title" placeholder="i.e. Cracking the Coding Interview"
                            path="title" cssClass="inputField"/><br/>

                <form:label path="authors">Author(s):</form:label>
                <span style="color: red">${badAuthors}</span><br/>
                <form:input type="text" class="springInput" id="authors" placeholder="i.e. Calvin Butson" path="authors"
                            cssClass="inputField"/><br/>

                <form:label path="imgLink">Cover Image URL:</form:label>
                <span style="color: red">${badImgLink}</span><br/>
                <form:input type="text" class="springInput" id="imgLink"
                            placeholder="i.e. https://www.cs.uga.edu/sites/default/files/styles/square_400x400/public/faculty_13.jpg"
                            path="imgLink" cssClass="inputField"/><br/>

                <form:label path="edition">Edition:</form:label>
                <span style="color: red">${badEdition}</span>
                <br/>
                <form:input type="text" class="springInput" id="edition" path="edition" cssClass="inputField"/><br/>

                <form:label path="category">Category:</form:label>
                <span style="color: red">${badCategory}</span>
                <br/>
                <form:input type="text" class="springInput" id="category" path="category" cssClass="inputField"/><br/>
            </div>

            <div class="columnRForm">
                <form:label path="publisher">Publisher:</form:label>
                <span style="color: red">${badPublisher}</span><br/>
                <form:input class="springInput" id="publisher" path="publisher" cssClass="inputField"/><br/>

                <form:label path="publishYear">Publication Year:</form:label>
                <span style="color: red">${badPublishYear}</span><br/>
                <form:input class="springInput" id="publishYear" path="publishYear" cssClass="inputField"/><br/>

                <form:label path="quantity">Quantity In Stock:</form:label>
                <span style="color: red">${badQuantity}</span><br/>
                <form:input class="springInput" id="quantity" path="quantity" cssClass="inputField"/><br/>

                    <%--        <form:label path="password">Minimum_Threshold:</form:label>--%>
                    <%--        <span style="color: red">${badPass}</span>--%>
                    <%--        <form:password class="springInput" id="password" path="password"/>--%>

                <form:label path="buyPrice">Buying Price:</form:label>
                <span style="color: red">${badBuyPrice}</span><br/>
                <form:input class="springInput" id="buyPrice" path="buyPrice" cssClass="inputField"/><br/>

                <form:label path="price">Selling Price:</form:label>
                <span style="color: red">${badSellPrice}</span><br/>
                <form:input class="springInput" id="price" path="price" cssClass="inputField"/><br/>


                    <%--        <form:label path="password">Bookscol:</form:label>--%>
                    <%--        <span style="color: red">${badPass}</span>--%>
                    <%--        <form:password class="springInput" id="password" path="password"/>--%>

                <form:label path="description">Description:</form:label>
                <span style="color: red">${badDescription}</span><br/>
                <form:input class="springInput" id="description" path="description" cssClass="inputField"/><br/>
            </div>
        </div>

        <div style="text-align: center"></div>
        <p><form:button type="submit" class="editButton" cssStyle="text-align: center">Submit</form:button></p>

    </div>
    </div>
</form:form>