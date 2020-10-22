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
public class ApvDoc {
	private int apvDocNo;
	private String apvDocTitle;
	private String apvDocContent;
	private String apvDocStatus;
	private Date apdCreateDate;
	private Date apdModifyDate;
	private int apdStep;
	private String apdPath;
	private int docNo;
	private String empId;
	private int apvDocFileCount;
	
	public ApvDoc(String apvDocTitle, String apvDocContent, String apdPath, int docNo, String empId,
			int apvDocFileCount) {
		super();
		this.apvDocTitle = apvDocTitle;
		this.apvDocContent = apvDocContent;
		this.apdPath = apdPath;
		this.docNo = docNo;
		this.empId = empId;
		this.apvDocFileCount = apvDocFileCount;
	}
	
	
	
	
}
