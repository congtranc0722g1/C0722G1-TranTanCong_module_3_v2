<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Calculator</title>
</head>
<body>
<h1>Simple Calculator</h1>
<form action="/calculator" method="get">
    <p>First Operand</p>
    <input type="text" name="number1">
    <p>Operator</p>
    <select name="operator">
        <option value="+">Addition</option>
        <option value="-">Except</option>
        <option value="*">Multiply</option>
        <option value="/">Divide</option>
    </select>
    <p>Second Operand</p>
    <input type="text" name="number2"> <br><br>
    <button type="submit">Calculate</button>
</form>
</body>
</html>
