/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.models.event;

/**
 *
 * @author Amir Syafiq
 */
public class Alumni extends User {

	private String alumniName;
	private int alumniID;
	private String alumniAddress;
	private String alumniEmail;
	private double alumniPrevSalary;
	private String alumniPassword;
	private String alumniCurSalary;
	private String alumniPhoneNum;
	private int alumniGraduateYear;
	private String alumniPrevJob;
	private String alumniCurJob;
	private String alumniStatus;
	private String alumniStatusYear;

    public String getAlumniName() {
        return alumniName;
    }

    public void setAlumniName(String alumniName) {
        this.alumniName = alumniName;
    }

    public int getAlumniID() {
        return alumniID;
    }

    public void setAlumniID(int alumniID) {
        this.alumniID = alumniID;
    }

    public String getAlumniAddress() {
        return alumniAddress;
    }

    public void setAlumniAddress(String alumniAddress) {
        this.alumniAddress = alumniAddress;
    }

    public String getAlumniEmail() {
        return alumniEmail;
    }

    public void setAlumniEmail(String alumniEmail) {
        this.alumniEmail = alumniEmail;
    }

    public double getAlumniPrevSalary() {
        return alumniPrevSalary;
    }

    public void setAlumniPrevSalary(double alumniPrevSalary) {
        this.alumniPrevSalary = alumniPrevSalary;
    }

    public String getAlumniPassword() {
        return alumniPassword;
    }

    public void setAlumniPassword(String alumniPassword) {
        this.alumniPassword = alumniPassword;
    }

    public String getAlumniCurSalary() {
        return alumniCurSalary;
    }

    public void setAlumniCurSalary(String alumniCurSalary) {
        this.alumniCurSalary = alumniCurSalary;
    }

    public String getAlumniPhoneNum() {
        return alumniPhoneNum;
    }

    public void setAlumniPhoneNum(String alumniPhoneNum) {
        this.alumniPhoneNum = alumniPhoneNum;
    }

    public int getAlumniGraduateYear() {
        return alumniGraduateYear;
    }

    public void setAlumniGraduateYear(int alumniGraduateYear) {
        this.alumniGraduateYear = alumniGraduateYear;
    }

    public String getAlumniPrevJob() {
        return alumniPrevJob;
    }

    public void setAlumniPrevJob(String alumniPrevJob) {
        this.alumniPrevJob = alumniPrevJob;
    }

    public String getAlumniCurJob() {
        return alumniCurJob;
    }

    public void setAlumniCurJob(String alumniCurJob) {
        this.alumniCurJob = alumniCurJob;
    }

    public String getAlumniStatus() {
        return alumniStatus;
    }

    public void setAlumniStatus(String alumniStatus) {
        this.alumniStatus = alumniStatus;
    }

    public String getAlumniStatusYear() {
        return alumniStatusYear;
    }

    public void setAlumniStatusYear(String alumniStatusYear) {
        this.alumniStatusYear = alumniStatusYear;
    }

	public Alumni(){

	}

	public void finalize() throws Throwable {
		super.finalize();
	}

}
