<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Jabłka</title>
</head>
<body>

<h1>Oto dział z jabłkami:</h1>

<!-- Formularz do kupowania jabłek -->
<form action="${pageContext.request.contextPath}/add-to-basket" method="post">
    <input type="hidden" name="item" value="jabłko">
    <label>
        Kup ilość jabłek:
        <input type="number" name="quantity" required>
    </label>
    <input type="submit" value="Kup jabłko">
</form>

<br><br>

<!-- Formularz do sprzedawania jabłek -->
<form action="${pageContext.request.contextPath}/sell-from-basket" method="post">
    <input type="hidden" name="item" value="jabłko">
    <label>
        Usuń ilość jabłek:
        <input type="number" name="quantity" required>
    </label>
    <input type="submit" value="Usuń jabłko">
</form>

<br><br>

<form action="${pageContext.request.contextPath}/index.jsp" method="get">
    <input type="submit" value="Rozmyśliłem się">
</form>

</body>
</html>