package com.kh.activePlus.Employee.model.vo;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@EqualsAndHashCode
public class Employee {
	private String ID;
	private String userPwd;
	private String userName;
	private String userTeam;
	private String department;
	private String job;
	
	public Employee(String iD, String userPwd, String userName, String userTeam, String job) {
		super();
		ID = iD;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userTeam = userTeam;
		this.job = job;
	}
	
	
}
