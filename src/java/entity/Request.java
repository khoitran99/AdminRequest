/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.sql.Date;

/**
 *
 * @author khoi.tranvan
 */
public class Request {

    private int id;
    private String department;
    private int studentID;
    private String studentName;
    private Date createdDate;
    private Date closeDate;
    private String title;
    private String content;
    private String status;
    private String sovledBy;
    private String attach;
    private String solution;
    private int numberRequest;

    public Request(int id, String department, int studentID, String studentName, Date createdDate, Date closeDate, String title, String content, String status, String sovledBy, String attach, String solution) {
        this.id = id;
        this.department = department;
        this.studentID = studentID;
        this.studentName = studentName;
        this.createdDate = createdDate;
        this.closeDate = closeDate;
        this.title = title;
        this.content = content;
        this.status = status;
        this.sovledBy = sovledBy;
        this.attach = attach;
        this.solution = solution;
    }

    public Request() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public int getStudentID() {
        return studentID;
    }

    public void setStudentID(int studentID) {
        this.studentID = studentID;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Date getCloseDate() {
        return closeDate;
    }

    public void setCloseDate(Date closeDate) {
        this.closeDate = closeDate;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getSovledBy() {
        return sovledBy;
    }

    public void setSovledBy(String sovledBy) {
        this.sovledBy = sovledBy;
    }

    public String getAttach() {
        return attach;
    }

    public void setAttach(String attach) {
        this.attach = attach;
    }

    public String getSolution() {
        return solution;
    }

    public void setSolution(String solution) {
        this.solution = solution;
    }

    public int getNumberRequest() {
        return numberRequest;
    }

    public void setNumberRequest(int numberRequest) {
        this.numberRequest = numberRequest;
    }
    
    

    @Override
    public String toString() {
        return "Request{" + "id=" + id + ", department=" + department + ", studentID=" + studentID + ", studentName=" + studentName + ", createdDate=" + createdDate + ", closeDate=" + closeDate + ", title=" + title + ", content=" + content + ", status=" + status + ", sovledBy=" + sovledBy + ", attach=" + attach + ", solution=" + solution + '}';
    }

}
