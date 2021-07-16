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
                <div class="login">
                    <form action="home" method="POST">
                        <h1 class="blue">Member Login</h1>
                        <label>Using your username and password.</label><br><br>
                        <table class="center">
                             <tr>
                                
                                 <td colspan="2"><h4 class="red">${alert}</h4> </td>
                            </tr>
                            <tr>
                                <td><label>Username </label></td>
                                <td><input type="text" name="username" id="username" required=""><span class="red">(*)</span> </td>
                            </tr>
                            <tr>
                            </tr>
                            <tr>
                                <td><label>Password </label></td>
                                <td><input type="password" name="password" id="password" required=""><span class="red">(*)</span> </td>
                            </tr>
                        </table>
                        <br>
                        <input type="submit" value="Log In"><br>
                        <br> <label>This field <span class="red">(*)</span> is required.</label>
                    </form>
                </div>
            </div>
        </div>
        <div class="footer">

        </div>
    </dv>


</html>
