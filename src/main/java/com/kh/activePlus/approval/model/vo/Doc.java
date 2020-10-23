package com.kh.activePlus.approval.model.vo;

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
public class Doc {
	private int docNo;
	private String docTitle;
	private String docContent;
	private String docStatus;
	private String docType;
	private String docExplantion;
	private String empId;
	
	
	
	public Doc(String docTitle, String docContent, String docExplantion, String empId) {
		super();
		this.docTitle = docTitle;
		this.docContent = docContent;
		this.docExplantion = docExplantion;
		this.empId = empId;
	}



	public Doc(String docTitle, String empId) {
		super();
		this.docTitle = docTitle;
		this.empId = empId;
	}
	
	
	
	
	
}
