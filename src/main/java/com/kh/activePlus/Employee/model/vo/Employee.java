package com.kh.activePlus.Employee.model.vo;

public class Employee {
	private String userNo;
	private String userTeam;
	private String userPwd;
	private String userName;
	
	public Employee() {}

	public Employee(String userNo, String userTeam, String userPwd, String userName) {
		super();
		this.userNo = userNo;
		this.userTeam = userTeam;
		this.userPwd = userPwd;
		this.userName = userName;
	}

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}

	public String getUserTeam() {
		return userTeam;
	}

	public void setUserTeam(String userTeam) {
		this.userTeam = userTeam;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Override
	public String toString() {
		return "Employee [userNo=" + userNo + ", userTeam=" + userTeam + ", userPwd=" + userPwd + ", userName="
				+ userName + "]";
	}
	
	
}
