<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<head>
    <style type="text/css">
        label {
            display: inline-block;
            width: 200px;
            margin: 5px;
            text-align: left;
        }
        input[type=text], input[type=password], select {
            width: 200px;
        }
        input[type=radio] {
            display: inline-block;
            margin-left: 45px;
        }
        input[type=checkbox] {
            display: inline-block;
            margin-right: 190px;
        }

        button {
            padding: 10px;
            margin: 10px;
        }
    </style>
</head>

<form:form method="POST" modelAttribute="accountForm">
    <div class="MyForm form-group">
        <form:input type="text" class="springInput" id="firstName" placeholder="i.e. Calvin" path="firstName"/>
        <form:input type="text" class="springInput" id="lastName" placeholder="i.e. Butson" path="lastName"/>
        <form:input type="text" class="springInput" id="userName" path="userName"/>
        <form:input type="email" class="springInput" id="email" path="email"/>
        <form:password class="springInput" id="password" path="password"/>

        <form:button type="submit" class="from-control">Submit</form:button>
    </div>
</form:form>