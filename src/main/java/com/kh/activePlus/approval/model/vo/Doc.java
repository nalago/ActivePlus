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
	
	
	
	
}
