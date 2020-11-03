package com.kh.activePlus.approval.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Approval {
	private int apvNo;
	private int apvDocNo;
	private int apvStep;
	private int apvType;
	private int apvResult;
	private String apvComment;
	private Date apvCompDate;
	private Date reciveDate;
	private String empId;
	
	public Approval(int apvStep, int apvType, String empId) {
		super();
		this.apvStep = apvStep;
		this.apvType = apvType;
		this.empId = empId;
	}
	
	
	
}
