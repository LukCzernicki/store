<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ziemniaki</title>
</head>
<body>

<h1>Oto dział z ziemniakami:</h1>

<!-- Formularz do kupowania ziemniaków -->
<form action="${pageContext.request.contextPath}/add-to-basket" method="post">
    <input type="hidden" name="item" value="ziemniak">
    <label>
        Kup ilość ziemniaków:
        <input type="number" name="quantity" required>
    </label>
    <input type="submit" value="Kup ziemniaka">
</form>

<br><br>

<!-- Formularz do sprzedawania ziemniaków -->
<form action="${pageContext.request.contextPath}/sell-from-basket" method="post">
    <input type="hidden" name="item" value="ziemniak">
    <label>
        Usuń ilość ziemniaków:
        <input type="number" name="quantity" required>
    </label>
    <input type="submit" value="Usuń ziemniaka">
</form>

<br><br>

<!-- Formularz do powrotu do strony głównej -->
<form action="${pageContext.request.contextPath}/index.jsp" method="get">
    <input type="submit" value="Rozmyśliłem się">
</form>

</body>
</html>