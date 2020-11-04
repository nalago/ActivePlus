package com.kh.activePlus.employee.model.vo;

import java.util.Calendar;
import java.util.Date;

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
public class TNA {
	private int tid;
	private Date startDate;
	private Date leaveDate;
	private String reason;
	private String empId;

	public TNA(Date startDate, String empId) {
		this.startDate = startDate;
		this.empId = empId;
	}
}
