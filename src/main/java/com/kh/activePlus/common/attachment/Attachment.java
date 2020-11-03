package com.kh.activePlus.common.attachment;

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
public class Attachment {
	private int atId;
	private String originalFile;
	private String renameFile;
	private String filePath;
	private String refTable;
	private String refId;
	private String status;
	
	public Attachment(String originalFile, String renameFile, String filePath) {
		super();
		this.originalFile = originalFile;
		this.renameFile = renameFile;
		this.filePath = filePath;
	}
}
