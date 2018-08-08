<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Dron
  Date: 01.08.2018
  Time: 19:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
            integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
            crossorigin="anonymous"></script>
    <title>Weather</title>
</head>
<body>
<form action="/getWeather" method="get">
    <div class="col-4">
        <h3>Погода на текущий момент</h3>
        <div class="form-group mb-2">
            <label for="city" class="col-form-label-sm">City:</label>
            <input type="text" class="form-control col-form-label-sm" id="city" name="city"
                   placeholder="Enter city">
        </div>
    <input class=" btn btn-outline-primary btn-sm mb-2" type="submit" value="Enter City">
    </div>
</form>
<div class="col-6">
    <div class="table-responsive-sm">
        <c:if test="${!empty weat}">
            <table class="table table-sm table-bordered">
                <thead>
                <tr align="center" class="table-active">
                    <th>City</th>
                    <th>Temp</th>
                    <th>Humidity</th>
                    <th>Main</th>
                </tr>
                </thead>
                <tbody>
                <tr align="center">
                    <td>${weat.name}</td>
                    <td>${weat.temp}°C</td>
                    <td>${weat.humidity}%</td>
                    <td>${weat.main}</td>
                </tr>
                </tbody>
            </table>
        </c:if>
    </div>
    <h3>Курсы валют</h3>
    <form action="/getRates" method="get">
        <select name="bank">
            <option>Ощадбанк</option>
            <option>ПриватБанк</option>
            <option>Аркада</option>
            <option>Кредобанк</option>
            <option>Кредитвест банк</option>
            <option>Сбербанк России</option>
            <option>Пиреус Банк МКБ</option>
            <option>ПУМБ</option>
            <option>International Invest</option>
            <option>ВТБ</option>
            <option>Глобус</option>
            <option>Коминвестбанк</option>
            <option>Альфа-банк</option>
            <option>Райффайзен Банк Аваль</option>
            <option>ПриватБанк</option>
            <option>Укрэксимбанк</option>
            <option>БМ Банк</option>
            <option>Universal Bank</option>
            <option>ТАСкомбанк</option>
            <option>Земельный капитал</option>
            <option>Credit Agricole</option>
            <option>Кредит Днепр</option>
            <option>Marfin</option>
            <option>Альпари банк</option>
        </select>
        <br>
        <br>
        <select name="currency">
            <option>usd</option>
            <option>eur</option>
            <option>rub</option>
        </select>
        <br>
        <br>
        <input class=" btn btn-outline-primary btn-sm mb-2" type="submit" value="Get Rates">
    </form>
    <div class="table-responsive-sm">
        <c:if test="${!empty exc}">
            <table class="table table-sm table-bordered">
                <thead>
                <tr align="center" class="table-active">
                    <th>Bank</th>
                    <th>Currency</th>
                    <th>Buy</th>
                    <th>Sale</th>
                </tr>
                </thead>
                <tbody>
                <tr align="center">
                    <td>${exc.nameBank}</td>
                    <td>${exc.currency}</td>
                    <td>${exc.buy} UAH</td>
                    <td>${exc.sale} UAH</td>
                </tr>
                </tbody>
            </table>
        </c:if>
    </div>
</div>
</body>
</html>
