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
                <div class="search">
                    <form action=""  method="POST">
                        <table class="center">
                            <tr>
                                <th>Select department</th>
                                <td>
                                    <select name="departmentSearch" >
                                        <c:forEach items="${dropdownlist}" var="option">
                                            <option value="${option}">${option}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                            </tr> 
                            <tr>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <th>or Enter request title</th>
                                <td>
                                    <input type="text" name="titleSearch" value="${keyword}">
                                    <input type="submit" value="View">
                                </td>

                            </tr>
                        </table>
                    </form>
                </div>
                <table id="customers">
                    <tr>
                        <th>Request title</th>
                        <th>Date created</th>
                        <th>Date close</th>
                        <th>Status</th>
                        <th>Report to</th>
                        <th>Detail</th>
                    </tr>
                    <c:forEach items="${listRequest}" var="element">
                        <tr>
                            <td class="green">${element.title}</td>
                            <td>${element.createdDate}</td>
                            <td>${element.closeDate == null ? "N/A" : element.closeDate }</td>
                            <td>${element.status}</td>
                            <td class="w-90">${element.department}</td>
                            <td><a href="detail?id=${element.id}"><b>Solve</b></a></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
        <div class="footer">

        </div>
    </dv>


</html>
