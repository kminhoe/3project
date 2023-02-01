package coffeeDao.common.util;

public class Pagination {

	private int nowPage;
	private int totalItem;
	private int totalReview;
	private int itemPerPage = 5;
	private int pagePerLine = 5;
	private int prevPage;
	private int nextPage;
	private int totalPage;
	private int totalReviewPage;
	private int startPagePerLine;
	private int endPagePerLine;
	private int endReviewPagePerLine;

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getTotalItem() {
		return totalItem;
	}

	public void setTotalItem(int totalItem) {
		this.totalItem = totalItem;
	}
	
	public int getTotalReview() {
		return totalReview;
	}

	public void setTotalReview(int totalReview) {
		this.totalReview = totalReview;
	}

	public int getItemPerPage() {
		return itemPerPage;
	}

	public void setItemPerPage(int itemPerPage) {
		this.itemPerPage = itemPerPage;
	}

	public int getPagePerLine() {
		return pagePerLine;
	}

	public void setPagePerLine(int pagePerLine) {
		this.pagePerLine = pagePerLine;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int nowPage) {
		this.prevPage = nowPage - 1;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nowPage) {
		this.nextPage = nowPage + 1;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalItem) {
		this.totalPage = (int) Math.ceil((double) totalItem / itemPerPage);
	}
	
	public int getTotalReviewPage() {
		return totalReviewPage;
	}

	public void setTotalReviewPage(int totalReview) {
		this.totalReviewPage = (int) Math.ceil((double) totalReview / itemPerPage);
	}

	public int getStartPagePerLine() {
		return startPagePerLine;
	}

	public void setStartPagePerLine(int nowPage) {
		this.startPagePerLine = (nowPage - 1) / pagePerLine * pagePerLine + 1;
	}

	public int getEndPagePerLine() {
		return endPagePerLine;
	}

	public void setEndPagePerLine(int startPagePerLine) {
		this.endPagePerLine = (startPagePerLine + pagePerLine - 1);

		if (endPagePerLine > totalPage) {
			this.endPagePerLine = totalPage;
		}
	}
	
	public int getEndReviewPagePerLine() {
		return endReviewPagePerLine;
	}

	public void setEndReviewPagePerLine(int startPagePerLine) {
		this.endReviewPagePerLine = (startPagePerLine + pagePerLine - 1);

		if (endReviewPagePerLine > totalReviewPage) {
			this.endReviewPagePerLine = totalReviewPage;
		}
	}
}

