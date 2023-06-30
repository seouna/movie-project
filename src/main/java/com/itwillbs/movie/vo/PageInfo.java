package com.itwillbs.movie.vo;

// 페이징 처리에 사용될 정보를 저장할 PageInfo 클래스 정의(=DTO = Bean= VO역할)
// 단 데이터베이스 작업에 사용되지 않으므로 클래스 이름을 다르게 지정함
public class PageInfo {
	private int listCount;
	private int pageListLimit;
	private int maxPage;
	private int startPage;
	private int endPage;
	
	public PageInfo() {}

	public PageInfo(int listCount, int pageListLimit, int maxPage, int startPage, int endPage) {
		super();
		this.listCount = listCount;
		this.pageListLimit = pageListLimit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getPageListLimit() {
		return pageListLimit;
	}

	public void setPageListLimit(int pageListLimit) {
		this.pageListLimit = pageListLimit;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	@Override
	public String toString() {
		return "PageInfo [listCount=" + listCount + ", pageListLimit=" + pageListLimit + ", maxPage=" + maxPage
				+ ", startPage=" + startPage + ", endPage=" + endPage + "]";
	}
	
	
	
}
