/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dbcontext.DBContext;
import entity.Request;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 *
 * @author khoi.tranvan
 */
public class RequestDAO {

    /* List request by date and department */
    public List<Request> getListRequestByDate(String department, Date date) throws Exception {
        DBContext db = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM Request WHERE department LIKE ? AND createdDate >= ?";
        List<Request> listRequest = new ArrayList<>();
        try {
            db = new DBContext();
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + department + "%");
            ps.setDate(2, date);
            rs = ps.executeQuery();
            while (rs.next()) {
                Request r = new Request();
                r.setId(rs.getInt("id"));
                r.setStudentID(rs.getInt("studentID"));
                r.setStudentName(rs.getString("studentName"));
                r.setCreatedDate(rs.getDate("createdDate"));
                r.setCloseDate(rs.getDate("closeDate"));
                r.setTitle(rs.getString("title"));
                r.setContent(rs.getString("content"));
                r.setSovledBy(rs.getString("solvedBy"));
                r.setAttach(rs.getString("attach"));
                r.setSolution(rs.getString("solution"));
                r.setDepartment(rs.getString("department"));
                r.setStatus(rs.getString("status"));
                listRequest.add(r);
            }
            return listRequest;
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
    }

    /* Get specific request by its ID */
    public Request getRequestByID(int requestID) throws Exception {
        DBContext db = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM Request WHERE id = ?";

        try {
            db = new DBContext();
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, requestID);
            rs = ps.executeQuery();
            while (rs.next()) {
                Request r = new Request();
                r.setId(rs.getInt("id"));
                r.setStudentID(rs.getInt("studentID"));
                r.setStudentName(rs.getString("studentName"));
                r.setCreatedDate(rs.getDate("createdDate"));
                r.setCloseDate(rs.getDate("closeDate"));
                r.setTitle(rs.getString("title"));
                r.setContent(rs.getString("content"));
                r.setSovledBy(rs.getString("solvedBy"));
                r.setAttach(rs.getString("attach"));
                r.setSolution(rs.getString("solution"));
                r.setDepartment(rs.getString("department"));
                r.setStatus(rs.getString("status"));
                return r;
            }
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
        return null;
    }

    /* List search request by keyword , department , date */
    public List<Request> getListSearchRequestByDate(String keyword, String department, Date date) throws Exception {
        DBContext db = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM Request WHERE title LIKE ? AND department LIKE ? AND createdDate >= ?";
        List<Request> listRequestSearch = new ArrayList<>();
        try {
            db = new DBContext();
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, department);
            ps.setDate(3, date);
            rs = ps.executeQuery();
            while (rs.next()) {
                Request r = new Request();
                r.setId(rs.getInt("id"));
                r.setStudentID(rs.getInt("studentID"));
                r.setStudentName(rs.getString("studentName"));
                r.setCreatedDate(rs.getDate("createdDate"));
                r.setCloseDate(rs.getDate("closeDate"));
                r.setTitle(rs.getString("title"));
                r.setContent(rs.getString("content"));
                r.setSovledBy(rs.getString("solvedBy"));
                r.setAttach(rs.getString("attach"));
                r.setSolution(rs.getString("solution"));
                r.setDepartment(rs.getString("department"));
                r.setStatus(rs.getString("status"));
                listRequestSearch.add(r);
            }
            return listRequestSearch;
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
    }

    /* Update request */
    public int updateRequest(String status, String solution, String solvedBy, int requestID,Date closeDate) throws Exception {
        DBContext db = null;
        PreparedStatement ps = null;
        Connection con = null;
        ResultSet rs = null;
        String sql = "UPDATE [dbo].[Request]\n"
                + "   SET \n"
                + "	 [solution] = ?\n"
                + "	,[status] = ?\n"
                + "    ,[solvedBy] = ?,closeDate = ?\n"
                + " WHERE id = ?";
        try {
            db = new DBContext();
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, solution);
            ps.setString(2, status);
            ps.setString(3, solvedBy);
            ps.setInt(5, requestID);
            ps.setDate(4, closeDate);
            return ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }

    }

    /* DepartmentDAO Alternative */
    /* Get list department for dropdownlish */
    public List<String> getListDepartment() throws Exception {
        DBContext db = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT DISTINCT department\n"
                + "FROM Request;";
        List<String> listDepartment = new ArrayList<>();
        try {
            db = new DBContext();
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                listDepartment.add(rs.getString("department"));
            }
            return listDepartment;
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
    }

    /* Get list department by date ( today and last 2 day ) */
    public List<Request> getListDepartmentByDate(Date date) throws Exception {
        DBContext db = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT COUNT(id) AS number,department FROM Request WHERE createdDate >= ? GROUP BY department";
        List<Request> listDepartmentCurrent = new ArrayList<>();
        try {
            db = new DBContext();
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setDate(1, date);
            rs = ps.executeQuery();
            while (rs.next()) {
                Request r = new Request();
                r.setDepartment(rs.getString("department"));
                r.setNumberRequest(rs.getInt("number"));
                listDepartmentCurrent.add(r);
            }
            return listDepartmentCurrent;
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
    }
}
