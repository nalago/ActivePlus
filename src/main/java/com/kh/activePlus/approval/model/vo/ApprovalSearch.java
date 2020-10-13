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
public class ApprovalSearch {
	private String empId;
	private int apvType;
	private String apvDocStatus;
	
	public ApprovalSearch(String empId, String apvDocStatus) {
		super();
		this.empId = empId;
		this.apvDocStatus = apvDocStatus;
	}
	
	
}
