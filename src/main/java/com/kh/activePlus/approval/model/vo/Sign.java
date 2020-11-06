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
public class Sign {
	private int fId;
	private String original;
	private String rename;
	private String filePath;
	private String status;
	private String refTable;
	private String refId;
	private String empId;
	private String department;
	private String jobGrade;
	
	

}
