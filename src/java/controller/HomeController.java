/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.RequestDAO;
import dao.UserDAO;

import entity.Request;
import entity.User;
import java.io.IOException;

import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utility.Utility;

/**
 *
 * @author khoi.tranvan
 */
public class HomeController extends HttpServlet {
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String url = request.getServletPath();
            if (url.equals("/logout")) {
                request.getSession().removeAttribute("USER");
                response.sendRedirect(request.getContextPath() + "/home");
                return;
            } else if (url.equals("/home")) {
                User user = (User) request.getSession().getAttribute("USER");
                if (user != null) {
                    RequestDAO requestDAO = new RequestDAO();
                    List<Request> listDepartmentCurrent = requestDAO.getListDepartmentByDate(Utility.getCurrentSQLDate());
                    List<Request> listDepartmentLast2Days = requestDAO.getListDepartmentByDate(Utility.getLast2DaysSQLDate());

                    request.setAttribute("listDepartmentCurrent", listDepartmentCurrent);
                    request.setAttribute("listDepartmentLast2Days", listDepartmentLast2Days);

                    request.setAttribute("today", Utility.formatToday());
                    request.getRequestDispatcher("home.jsp").forward(request, response);

                } else {
                    request.setAttribute("today", Utility.formatToday());
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            }
        } catch (Exception e) {
            request.setAttribute("error", e.toString());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String username = request.getParameter("username").trim();
            String password = request.getParameter("password").trim();

            UserDAO userDAO = new UserDAO();
            User user = userDAO.login(username, password);
            if (user != null) {
                request.getSession().setAttribute("USER", user);
                response.sendRedirect(request.getContextPath() + "/home");
            } else {
                request.setAttribute("alert", "username or password is not correct!");
                request.setAttribute("today", Utility.formatToday());
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("error", e.toString());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

}
