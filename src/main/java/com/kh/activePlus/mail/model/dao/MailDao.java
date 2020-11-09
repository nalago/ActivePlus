package com.kh.activePlus.mail.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.activePlus.common.attachment.Attachment;
import com.kh.activePlus.common.paging.PageInfo;
import com.kh.activePlus.mail.model.vo.Email;

@Repository
public class MailDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int getListCount(String receiver, String kind) {
		HashMap<String, String> hmap = new HashMap<>();
		hmap.put("receiver", receiver);
		hmap.put("kind", kind);
		System.out.println("kind : " + kind);
		System.out.println("receiver : " + receiver);
		int result = 0;
		if(kind.equals("send")) {
			result = sqlSession.selectOne("mailMapper.getSendListCount", hmap);
			System.out.println("result : " + result);
		} else {
			result = sqlSession.selectOne("mailMapper.getReceiveListCount", hmap);
		}
		
		return result;
	}

	public ArrayList<Email> selectInList(String empId, String kind, PageInfo pi) {
		int offset = 0;
		RowBounds rowBounds = null;
		if(pi != null) {
			offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
			rowBounds = new RowBounds(offset, pi.getBoardLimit());
			System.out.println("piDao : " + pi);
			System.out.println("offset : " + offset);
			System.out.println("boardLimit : " + pi.getBoardLimit());
			
		} else {
			// 메인화면 select
			offset = 0;
			rowBounds = new RowBounds(offset, 3);
			
		}
		
		HashMap<String, String> hmap = new HashMap<>();
		hmap.put("kind", kind);
		hmap.put("empId", empId);
		ArrayList<Email> aList = new ArrayList<>();
		if(kind.equals("send")) {
			// 보낸 메일함
			System.out.println("rowBounds off : " + rowBounds.getOffset());
			System.out.println("rowBounds off : " + rowBounds.getLimit());
			aList = (ArrayList)sqlSession.selectList("mailMapper.selectSendList", hmap, rowBounds);
			System.out.println("ALIST : "+aList);
			System.out.println("여기로 들어옴!");
		} else {
			aList = (ArrayList)sqlSession.selectList("mailMapper.selectReceiveList", hmap, rowBounds);
		}
		System.out.println("Dao : "+aList);
		return aList;
	}

	public int sendMail(Email e, String[] receiver, String[] refReceiver) {
		// System.out.println("Dao : " + e);
		int result = sqlSession.insert("mailMapper.sendMail", e);
		int rResult = 0;
		int mId = e.getMailId();
		if(mId > 0) {
			e.setMailId(mId);
			sqlSession.insert("mailMapper.insertSend",e);
			for (String r : receiver) {
				e.setMrCategory("수신");
				e.setReceiver(r);
				result += sqlSession.insert("mailMapper.insertReceive", e);
			}
			if(refReceiver != null) {
				for (String rr : refReceiver) {
					e.setMrCategory("참조");
					e.setReceiver(rr);
					result += sqlSession.insert("mailMapper.insertReceive", e);
				}
			}
		}
		
		return mId;
	}

	public int insertAttachment(ArrayList<Attachment> aList) {
		int result = 0;
		for (Attachment at : aList) {
			result += sqlSession.insert("mailMapper.insertAttachment", at);
		}
		
		return result;
	}

	public Email selectMail(Email e) {
		return sqlSession.selectOne("mailMapper.selectMail",e);
	}

	public ArrayList<Attachment> selectAttachment(Attachment at) {
		return (ArrayList)sqlSession.selectList("mailMapper.selectAtt",at);
	}



	public ArrayList<String> selectReceiver(Email e) {
			
		ArrayList<String> em = (ArrayList)sqlSession.selectList("mailMapper.selectReceiver", e);
		System.out.println("em : " + em);
		return em;
	}

	public int setMail(HashMap<String, String> hmap) {
		int result = 0;
		if(hmap.get("kind").equals("rec")) {
			result = sqlSession.update("mailMapper.setMailRec",hmap);
		} else {
			result = sqlSession.update("mailMapper.setMailSend",hmap);
		}
		
		return result;
	}

	public Email selectMailSend(int mId) {
		return sqlSession.selectOne("mailMapper.selectMailSend",mId);
	}

	public Email selectMailDel(int mId) {
		return sqlSession.selectOne("mailMapper.selectMailDel",mId);
	}

	public int sendTemp(Integer mNo) {
		return sqlSession.update("mailMapper.sendTemp",mNo);
	}

	public void readMail(Email m) {
		sqlSession.update("mailMapper.readMail",m);
	}
	
	
}
