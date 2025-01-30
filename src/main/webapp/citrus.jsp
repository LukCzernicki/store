<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cytryny</title>
</head>
<body>

<h1>Oto dział z cytrynami:</h1>

<!-- Formularz do kupowania cytryn -->
<form action="${pageContext.request.contextPath}/add-to-basket" method="post">
    <input type="hidden" name="item" value="cytryna">
    <label>
        Kup ilość jabłek:
        <input type="number" name="quantity" required>
    </label>
    <input type="submit" value="Kup cytrynę">
</form>

<br><br>

<!-- Formularz do sprzedawania jabłek -->
<form action="${pageContext.request.contextPath}/sell-from-basket" method="post">
    <input type="hidden" name="item" value="cytrynę">
    <label>
        Usuń ilość jabłek:
        <input type="number" name="quantity" required>
    </label>
    <input type="submit" value="Usuń cytrynę">
</form>

<br><br>

<form action="${pageContext.request.contextPath}/index.jsp" method="get">
    <input type="submit" value="Rozmyśliłem się">
</form>

</body>
</html>