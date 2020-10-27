package com.kh.activePlus.approval.model.vo;

import java.sql.Date;

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
public class Approver {
	private int apvDocNo;
	private String name;
	private Date apvCompDate;
	private String apvDocStatus;
	
	
}
