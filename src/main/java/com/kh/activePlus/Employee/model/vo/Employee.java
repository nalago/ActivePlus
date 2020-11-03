package com.kh.activePlus.Employee.model.vo;

import java.sql.Date;

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
	/*EMP_ID	VARCHAR2(20 BYTE)
	PWD	VARCHAR2(15 BYTE)
	EMAIL	VARCHAR2(30 BYTE)
	PHONE	VARCHAR2(20 BYTE)
	NAME	VARCHAR2(10 BYTE)
	BIRTH	DATE
	CATEGORY	VARCHAR2(6 BYTE)
	SALARY	VARCHAR2(40 BYTE)
	ACC_NO	NUMBER
	ADDRESS	VARCHAR2(40 BYTE)
	HIRE_DATE	DATE
	STATUS	VARCHAR2(40 BYTE)
	LICENSE	VARCHAR2(15 BYTE)
	LICENSE_NO	VARCHAR2(30 BYTE)
	LICENSE_DATE	DATE*/
	private String empId;
	private String pwd;
	private String email;
	private String phone;
	private String name;
	//private Date birth;
	private String category;
	private String salary;
	//private int accNo;
	private String address;
	//private Date hireDate;
	private String status;
	private String license;
	private String licenseNo;
	//private Date licenseDate;
	
	
	
	
}
