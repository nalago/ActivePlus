package com.kh.activePlus.common.paging;

public class Pagination {
	public static PageInfo getPageInfo(int currentPage, int listCount, 
			int pageLimit, int boardLimit) {
		
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		
		// 마지막 페이지가 총 페이지 수보다 클 경우
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		return new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
	}
}
