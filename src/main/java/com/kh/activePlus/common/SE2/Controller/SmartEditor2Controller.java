package com.kh.activePlus.common.SE2.Controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.activePlus.common.SE2.model.vo.SmartEditor2;

@Controller
public class SmartEditor2Controller {
	/*@RequestMapping("/singleImageUpload.ap")
	public String singleImageUpload(HttpServletRequest request, SmartEditor2 se2) 
		throws UnsupportedEncodingException{
			String callback = se2.getCallback();
			String callback_func = se2.getCallback_func();
			String file_result = "";
			String result = "";
			MultipartFile multiFile = se2.getFiledata();
			try{
				if(multiFile != null && multiFile.getSize() > 0 && 
		        		StringUtils.isNotBlank(multiFile.getName())){
					if(multiFile.getContentType().toLowerCase().startsWith("image/")){
		            	String oriName = multiFile.getName();
		                String uploadPath = request.getSession().getServletContext().getRealPath("/img");
		                String path = uploadPath + "/smarteditor/";
		                File file = new File(path);
		                if(!file.exists()){
		                file.mkdirs();
		                }
		                String fileName = UUID.randomUUID().toString();
		                se2.getFiledata().transferTo(new File(path + fileName));
		                file_result += "&bNewLine=true&sFileName=" + oriName + 
		                			   "&sFileURL=/img/smarteditor/" + fileName;
					}else{
						file_result += "&errstr=error";
					}
				}else{
					file_result += "&errstr=error";
				}
			} catch (Exception e){
				e.printStackTrace();
			}
			result = "redirect:" + callback + 
					 "?callback_func=" + URLEncoder.encode(callback_func,"UTF-8") + file_result;
			return result;
		}
	*/
	
	@RequestMapping(value="/singleImageUpload.ap")
	public String simpleImageUploader(
		HttpServletRequest req, SmartEditor2 smarteditorVO) 
        	throws UnsupportedEncodingException{
	String callback = smarteditorVO.getCallback();
	String callback_func = smarteditorVO.getCallback_func();
	String file_result = "";
	String result = "";
	MultipartFile multiFile = smarteditorVO.getFiledata();
	try{
		if(multiFile != null && multiFile.getSize() > 0 && 
        		StringUtils.isNotBlank(multiFile.getName())){
			if(multiFile.getContentType().toLowerCase().startsWith("image/")){
            	String oriName = multiFile.getName();
                String uploadPath = req.getSession().getServletContext().getRealPath("/img");
                String path = uploadPath + "/smarteditor/";
                File file = new File(path);
                if(!file.exists()){
                file.mkdirs();
                }
                String fileName = UUID.randomUUID().toString();
                smarteditorVO.getFiledata().transferTo(new File(path + fileName));
                file_result += "&bNewLine=true&sFileName=" + oriName + 
                			   "&sFileURL=/img/smarteditor/" + fileName;
			}else{
				file_result += "&errstr=error";
			}
		}else{
			file_result += "&errstr=error";
		}
	} catch (Exception e){
		e.printStackTrace();
	}
	result = "redirect:" + callback + 
			 "?callback_func=" + URLEncoder.encode(callback_func,"UTF-8") + file_result;
	return result;
}
	/*//다중파일업로드
	@RequestMapping("multiImageUpload.ap")
	public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response){
	    try {
	         //파일정보
	         String sFileInfo = "";
	         //파일명을 받는다 - 일반 원본파일명
	         String filename = request.getHeader("file-name");
	         //파일 확장자
	         String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
	         //확장자를소문자로 변경
	         filename_ext = filename_ext.toLowerCase();
	         //파일 기본경로
	         String dftFilePath = request.getSession().getServletContext().getRealPath("/");
	         System.out.println("실제경로 : " + dftFilePath);
	         //파일 기본경로 _ 상세경로
	         String filePath = dftFilePath + "resources" + File.separator + "images" + File.separator;
	         System.out.println("상세경로 : " + filePath);
	         File file = new File(filePath);
	         if(!file.exists()) {
	            file.mkdirs();
	         }
	         String realFileNm = "";
	         SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
	         String today= formatter.format(new java.util.Date());
	         realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
	         String rlFileNm = filePath + realFileNm;
	         ///////////////// 서버에 파일쓰기 /////////////////
	         InputStream is = request.getInputStream();
	         OutputStream os=new FileOutputStream(rlFileNm);
	         int numRead;
	         byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
	         while((numRead = is.read(b,0,b.length)) != -1){
	            os.write(b,0,numRead);
	         }
	         if(is != null) {
	            is.close();
	         }
	         os.flush();
	         os.close();
	         ///////////////// 서버에 파일쓰기 /////////////////
	         String contextPath = (String) request.getAttribute("contextPath");
	         // 정보 출력
	         sFileInfo += "&bNewLine=true";
	         // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
	         sFileInfo += "&sFileName="+ filename;
//	         +"/resources/images/"
	         sFileInfo += "&sFileURL="+"/images/"+realFileNm;
	         PrintWriter print = response.getWriter();
	         print.print(sFileInfo);
	         print.flush();
	         print.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}*/
	
	//다중파일업로드
    @RequestMapping("multiImageUploader.ap")
    public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response){
        try {
        	// System.out.println("넘어오니");
             //파일정보
             String sFileInfo = "";
             //파일명을 받는다 - 일반 원본파일명
             String filename = request.getHeader("file-name");
             // System.out.println("filename-"+filename);
             //파일 확장자
             String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
             //확장자를소문자로 변경
             filename_ext = filename_ext.toLowerCase();
             //파일 기본경로
             String dftFilePath = request.getSession().getServletContext().getRealPath("resources");
             // System.out.println("dftFilePath:"+dftFilePath);
             //파일 기본경로 _ 상세경로
             String filePath = dftFilePath +  File.separator + "photo_upload" + File.separator;
             // System.out.println("file:"+filePath);
             File file = new File(filePath);
             if(!file.exists()) {
                file.mkdirs();
             }
             String realFileNm = "";
             SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
             String today= formatter.format(new java.util.Date());
             realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
             String rlFileNm = filePath + realFileNm;
             // System.out.println("realFileNm:"+realFileNm);

             ///////////////// 서버에 파일쓰기 ///////////////// 
             InputStream is = request.getInputStream();
             OutputStream os=new FileOutputStream(rlFileNm);
             int numRead;
             byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
             while((numRead = is.read(b,0,b.length)) != -1){
                os.write(b,0,numRead);
             }
             if(is != null) {
                is.close();
             }
             os.flush();
             os.close();
             ///////////////// 서버에 파일쓰기 /////////////////
             // 정보 출력
             sFileInfo += "&bNewLine=true";
             // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
             sFileInfo += "&sFileName="+ filename;;
             sFileInfo += "&sFileURL="+request.getContextPath()+"/resources/photo_upload/"+realFileNm;
             // System.out.println("sFileInfo:"+sFileInfo);
             PrintWriter print = response.getWriter();
             print.print(sFileInfo);
             print.flush();
             print.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }



}
