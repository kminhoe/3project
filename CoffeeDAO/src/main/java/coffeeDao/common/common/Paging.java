package coffeeDao.common.common;

public class Paging {
	
	private int totalPage;
	private int pageBlock;
	private int startPage;
	private int endPage;
	private int currentPage;
	
	private StringBuffer pageHtml = new StringBuffer();
	
	public Paging(int countItemAll, int pageBlock, int pageSize, int currentPage, String url,String searchUrl) {
		totalPage = countItemAll / pageSize + (countItemAll%pageSize==0 ? 0 :1);
		this.pageBlock = pageBlock;
		
		startPage = (int)((currentPage-1)/pageBlock)*pageBlock + 1;
		endPage = startPage + pageBlock-1;
		if(endPage>totalPage) {
			endPage = totalPage;
		}
		this.currentPage = currentPage;
		
		makePageHtml(url, searchUrl);
	}
	
	private void makePageHtml(String url, String searchUrl) {
		pageHtml.append("<div class=\"\">");
		pageHtml.append("<div class=\"seller_center\">");
		pageHtml.append("<div class=\"\">");
		pageHtml.append("<ul>");
		if(startPage>pageBlock) {
			pageHtml.append("<li><a href=\"" + url + "?page=" + (startPage-pageBlock) + searchUrl + "\">&lt;</a></li>&nbsp;");
		}
		
		for(int i=startPage; i<=endPage; i++) {
			pageHtml.append("<li class=\"active\">");
			if(i!=currentPage) {
				pageHtml.append("<li><a href=\"" + url + "?page=" + i  + searchUrl + "\">" + i + "</a></li>&nbsp;");				
			} else {
				pageHtml.append("<li class=\"active\"><span>" + i+ "</span>&nbsp;");				
			}
		}
		
		if(endPage<totalPage) {
			pageHtml.append("<li><a href=\"" + url + "?page=" + (startPage+pageBlock)  + searchUrl + "\">&gt;</a></li>");
		}
		pageHtml.append("</ul></div></div></div>");
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getPageBlock() {
		return pageBlock;
	}

	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
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


	public StringBuffer getPageHtml() {
		return pageHtml;
	}

	

}
