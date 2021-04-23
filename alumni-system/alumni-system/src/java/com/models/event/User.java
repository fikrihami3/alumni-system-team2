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
public class User {
    
        private String userName;
	private int userID;
	private String userEmail;
	private String userPhoneNum;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPhoneNum() {
        return userPhoneNum;
    }

    public void setUserPhoneNum(String userPhoneNum) {
        this.userPhoneNum = userPhoneNum;
    }

	public User(){

	}

	public void finalize() throws Throwable {

	}

	public void displayCharityDetail(){

	}

	public void displayAllSavedCharity(){

	}

	public void displayMsg(){

	}

	public void displayAllSavedNews(){

	}

	public void displayNewsDetail(){

	}

	public void displayAllSavedEvent(){

	}

	public void displayEventDetail(){

	}
}
