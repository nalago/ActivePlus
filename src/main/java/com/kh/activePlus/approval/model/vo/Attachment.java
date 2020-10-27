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
public class Attachment {
	private int fId;
	private String original;
	private String rename;
	private String filePath;
	private String status;
	private String refTable;
	private int refId;
	
	public Attachment(String original, String rename, String filePath) {
		super();
		this.original = original;
		this.rename = rename;
		this.filePath = filePath;
	}
	
	
	
}
