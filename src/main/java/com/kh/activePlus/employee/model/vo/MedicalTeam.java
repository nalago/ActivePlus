package com.kh.activePlus.employee.model.vo;

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
public class MedicalTeam {
	private String emp_id;		// 사번
	private String field;		// 분야
	private String grade;		// 직급

}
