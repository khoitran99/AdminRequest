/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.RequestDAO;
import entity.Request;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
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
public class ViewController extends HttpServlet {

    public void setPreviousPage(HttpServletRequest request) {

        String uri = request.getScheme() + "://"
                + request.getServerName() + ":"
                + request.getServerPort()
                + request.getRequestURI() + "?"
                + request.getQueryString();
        request.getSession().removeAttribute("previouspage");
        request.getSession().setAttribute("previouspage", uri);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try {

            List<Request> listRequest = new ArrayList<>();
            List<String> dropdownlist = new ArrayList<>();

            RequestDAO requestDAO = new RequestDAO();
            String url = request.getServletPath();
            switch (url) {
                case "/viewtoday": {
                    String department = request.getParameter("department").trim();
                    dropdownlist.add(department);
                    listRequest = requestDAO.getListRequestByDate(department, Utility.getCurrentSQLDate());
                    break;
                }
                case "/viewlast2day": {
                    String department = request.getParameter("department").trim();
                    dropdownlist.add(department);
                    listRequest = requestDAO.getListRequestByDate(department, Utility.getLast2DaysSQLDate());
                    break;
                }
                default:
                    listRequest = requestDAO.getListRequestByDate("", Date.valueOf("1900-01-01"));
                    dropdownlist = requestDAO.getListDepartment();
                    break;
            }
            request.setAttribute("listRequest", listRequest);
            request.setAttribute("dropdownlist", dropdownlist);
            request.setAttribute("today", Utility.formatToday());
            setPreviousPage(request);
            request.getRequestDispatcher("view.jsp").forward(request, response);
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
            String department = request.getParameter("departmentSearch").trim();
            String keyword = request.getParameter("titleSearch").trim();

            RequestDAO requestDAO = new RequestDAO();
            List<Request> listSearch = new ArrayList<>();
            List<String> dropdownlist = new ArrayList<>();

            String url = request.getServletPath();
            switch (url) {
                case "/viewtoday": {
                    dropdownlist.add(department);
                    listSearch = requestDAO.getListSearchRequestByDate(keyword, department, Utility.getCurrentSQLDate());
                    break;
                }
                case "/viewlast2day": {
                    dropdownlist.add(department);
                    listSearch = requestDAO.getListSearchRequestByDate(keyword, department, Utility.getLast2DaysSQLDate());
                    break;
                }
                default:
                    listSearch = requestDAO.getListSearchRequestByDate(keyword, department, Date.valueOf("1900-01-01"));
                    dropdownlist = requestDAO.getListDepartment();
                    break;
            }
            request.setAttribute("keyword", keyword);
            request.setAttribute("listRequest", listSearch);
            request.setAttribute("dropdownlist", dropdownlist);
            request.setAttribute("today", Utility.formatToday());
            setPreviousPage(request);
            request.getRequestDispatcher("view.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", e.toString());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

}
