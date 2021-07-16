/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.RequestDAO;
import entity.Request;
import entity.User;
import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utility.Utility;

/**
 *
 * @author khoi.tranvan
 */
public class DetailController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try {
            User user = (User) request.getSession().getAttribute("USER");
            if (user != null) {
                RequestDAO requestDAO = new RequestDAO();
                int id = Integer.parseInt(request.getParameter("id"));
                Request requestByID = requestDAO.getRequestByID(id);
                request.setAttribute("requestByID", requestByID);
                request.setAttribute("today", Utility.formatToday());
                request.setAttribute("minclosedate", Utility.get7DaysSQLDate());
                request.setAttribute("tomorrow", Utility.getTomorrow());
                request.getRequestDispatcher("detail.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/home");
            }
        } catch (Exception e) {
            request.setAttribute("error", e.toString());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try {
            User user = (User) request.getSession().getAttribute("USER");
            if (user != null) {
                int id = Integer.parseInt(request.getParameter("requestid"));
                RequestDAO requestDAO = new RequestDAO();
                String closeDateStr = request.getParameter("closeDate").trim();
                System.out.println(closeDateStr);
                if (closeDateStr.equals("")||Utility.getCurrentSQLDate().compareTo(Date.valueOf(closeDateStr)) <= 0) {
                    String status = (request.getParameter("status") == null ? "in progress" : request.getParameter("status"));
                    String solution = request.getParameter("solution").trim();
                    String solvedBy = user.getUsername();
                    int result = requestDAO.updateRequest(status, solution, solvedBy, id,closeDateStr.equals("")?null:Date.valueOf(closeDateStr));
                    if (result == 1) {
                        request.setAttribute("success", "Request updated successfully!");
                        response.sendRedirect((String) request.getSession().getAttribute("previouspage"));
                        return;
                    } else {
                        request.setAttribute("alert", "Request updated failed!");
                    }
                } else {
                    request.setAttribute("alert", "This request exceeds close date !");
                }
                Request requestByID = requestDAO.getRequestByID(id);
                request.setAttribute("requestByID", requestByID);
                request.setAttribute("today", Utility.formatToday());
                request.setAttribute("minclosedate", Utility.get7DaysSQLDate());
                request.setAttribute("tomorrow", Utility.getTomorrow());
                request.getRequestDispatcher("detail.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/home");
            }
        } catch (Exception e) {
            request.setAttribute("error", e.toString());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

}
