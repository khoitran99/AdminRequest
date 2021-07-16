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
                <div>
                    <form action="detail"  method="POST" >
                        <h2 class="blue">Request ID : ${requestByID.id}</h2>
                        <input type="hidden" name="requestid" value="${requestByID.id}" >
                        <table class="center">
                            <tr>
                                <td></td>
                                <td>
                                    <h3 class="green">${success}</h3>
                                    <h3 class="red">${alert}</h3>
                                </td>
                            </tr>
                            <tr>
                                <td class="textright">Request to department</td>
                                <td><input class="input" value="${requestByID.department}" name="department" type="text" disabled=""></td>
                            </tr>
                            <tr>
                                <td class="textright">Student ID</td>
                                <td><input class="input" value="${requestByID.studentID}" name="studentID" type="text" disabled=""></td>
                            </tr>
                            <tr>
                                <td class="textright">Student name</td>
                                <td><input class="input" value="${requestByID.studentName}" name="studentName" type="text" disabled=""></td>
                            </tr>
                            <tr>
                                <td class="textright">Date created</td>
                                <td><input class="input" value="${requestByID.createdDate}" name="createdDate"  type="text" disabled=""></td>
                            </tr>
                            <tr>
                                <td class="textright">Request title</td>
                                <td><input class="input" value="${requestByID.title}" name="title" type="text" disabled=""></td>
                            </tr>
                            <tr>
                                <td class="textright">Request content</td>
                                <td><textarea class="fontarial" id="textarea"  name="content" cols="40" rows="5" disabled="">${requestByID.content}</textarea></td>
                            </tr>
                            <tr>
                                <td class="textright">Request state </td>
                                <td>
                                    <input type="radio" name="status" value="approved" ${requestByID.status == "approved" ? "checked" : ""}>
                                      <label class="blue" >Approved</label>
                                      <input type="radio"  name="status" value="rejected" ${requestByID.status == "rejected" ? "checked" : ""}>
                                      <label class="red" >Rejected</label>
                                </td>
                            </tr>
                            <tr>
                                <td class="textright">Close date</td>
                                <td>
                                    <input name="closeDate" class="input" value="${requestByID.closeDate!=null ? minclosedate : requestByID.closeDate}" type="date" min="${tomorrow}">
                                    
                                </td>
                            </tr>
                            <tr>
                                <td class="textright">Solved by </td>
                                <td><input class="input" name="solvedBy" type="text" value="${requestByID.sovledBy}"  disabled=""> </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td class="textright">Attached (if any)</td>
                                <td>
                                    <a class="button w-100" href="docs/${requestByID.attach}" download="${requestByID.attach}" >Download</a>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td class="textright">School's solution</td>
                                <td><textarea id="textarea" class="fontarial"  name="solution" cols="40" rows="5">${requestByID.solution}</textarea></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><input class="button w-60" type="submit" value="Save"></td>
                            </tr>

                        </table>

                    </form>
                </div>
            </div>
        </div>
        <div class="footer">
        </div>
    </div>
</html>
