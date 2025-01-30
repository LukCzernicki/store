<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Marchewki</title>
</head>
<body>

<h1>Oto dział z marchewkami:</h1>

<!-- Formularz do kupowania marchewek -->
<form action="${pageContext.request.contextPath}/add-to-basket" method="post">
    <input type="hidden" name="item" value="marchewka">
    <label>
        Kup ilość marchewek:
        <input type="number" name="quantity" required>
    </label>
    <input type="submit" value="Kup marchewkę">
</form>

<br><br>

<!-- Formularz do sprzedawania marchewek -->
<form action="${pageContext.request.contextPath}/sell-from-basket" method="post">
    <input type="hidden" name="item" value="marchewka">
    <label>
        Usuń ilość marchewek:
        <input type="number" name="quantity" required>
    </label>
    <input type="submit" value="Usuń marchewkę">
</form>

<br><br>

<!-- Formularz do powrotu do strony głównej -->
<form action="${pageContext.request.contextPath}/index.jsp" method="get">
    <input type="submit" value="Rozmyśliłem się">
</form>

</body>
</html>