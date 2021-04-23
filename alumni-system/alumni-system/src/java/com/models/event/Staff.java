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
public class Staff extends User {

	private String staffName;
	private int staffID;
	private String staffPassword;
	private String staffEmail;
	private String staffPhoneNum;

    public String getStaffName() {
        return staffName;
    }

    public void setStaffName(String staffName) {
        this.staffName = staffName;
    }

    public int getStaffID() {
        return staffID;
    }

    public void setStaffID(int staffID) {
        this.staffID = staffID;
    }

    public String getStaffPassword() {
        return staffPassword;
    }

    public void setStaffPassword(String staffPassword) {
        this.staffPassword = staffPassword;
    }

    public String getStaffEmail() {
        return staffEmail;
    }

    public void setStaffEmail(String staffEmail) {
        this.staffEmail = staffEmail;
    }

    public String getStaffPhoneNum() {
        return staffPhoneNum;
    }

    public void setStaffPhoneNum(String staffPhoneNum) {
        this.staffPhoneNum = staffPhoneNum;
    }      

	public Staff(){

	}

	public void finalize() throws Throwable {
		super.finalize();
	}

	public void displayMsg(){

	}

	public void displaySavedEventData(){

	}

	public void displaySavedNewsData(){

	}

	public void displaySavedCharityData(){

	}

	public void displayAllSavedNews(){

	}

	public void displayAllSavedCharity(){

	}

	public void displayAllSavedEvent(){

	}

}
