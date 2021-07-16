<%-- 
    Document   : home
    Created on : Jul 1, 2021, 5:02:02 PM
    Author     : khoi.tranvan
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/style.css" type="text/css" />
    </head>
    <div class="container">
        <div class="header">
        </div>
        <div class="main">
            <div class="left">
                <c:if test="${empty USER}">
                    <a class="menu" href="home">Login</a>
                </c:if>
                <c:if test="${not empty USER}">
                    <a class="menu" href="logout">Welcome ${USER.username}, Log out</a>
                    <a class="menu" href="home">Home</a>
                    <a class="menu" href="view">View Requests</a>
                </c:if>
                <a class="menu disabled" disabled="">${today}</a>
            </div>
            <div class="right">
                <div class="menu-div">
                    <c:if test="${empty USER}">
                        <a class="menu-right" href="home">Login</a>
                    </c:if>
                    <c:if test="${not empty USER}">
                        <a class="menu-right" href="logout">Welcome ${USER.username}, Log out</a>
                        <a class="menu-right" href="home">Home</a>
                        <a class="menu-right" href="view">View Requests</a>
                    </c:if>
                    <a class="menu-right disabled" disabled="">${today}</a>
                </div>

                <h2 class="blue">Request received by today - ${today}</h2>
                <table id="customers">
                    <tr>
                        <th>Department name</th>
                        <th>Number of request</th>
                        <th>View detail</th>
                    </tr>
                    <c:forEach items="${listDepartmentCurrent}" var="element">
                        <tr>
                            <td class="green">${element.department}</td>
                            <td>${element.numberRequest}</td>
                            <td><a href="viewtoday?department=${element.department}">view</a></td>
                        </tr>
                    </c:forEach>


                </table>
                <br>

                <h2 class="blue">Request received by last 2 days</h2>
                <table id="customers">
                    <tr>
                        <th>Department name</th>
                        <th>Number of request</th>
                        <th>View detail</th>
                    </tr>
                    <c:forEach items="${listDepartmentLast2Days}" var="element">
                        <tr>
                            <td class="green">${element.department}</td>
                            <td>${element.numberRequest}</td>
                            <td><a href="viewlast2day?department=${element.department}">view</a></td>
                        </tr>
                    </c:forEach>

                </table>
            </div>
        </div>
        <div class="footer">
        </div>
    </dv>


</html>
