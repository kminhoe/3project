package coffeeDao.common.product;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import coffeeDao.model.ProductBean;

public interface ProductService {
	
		public List<Map<String, Object>> selectProductList(ProductBean product) throws Exception;
	
		public List<Map<String, Object>> selectProductId(ProductBean product) throws Exception;
	
	// 상품&상품 이미지 등록
		public void enrollItem(Map<String, Object> map, HttpServletRequest request) throws Exception;

		// 상품 수정
		public void modifyItem(Map<String, Object> map, HttpServletRequest request) throws Exception;

		// 상품 이미지 수정
		public void modifyItemImg(Map<String, Object> map, HttpServletRequest request) throws Exception;

		// 상품 삭제
		public void removeItem(Map<String, Object> map) throws Exception;

		// 상품이미지 삭제
		public void removeItemImg(Map<String, Object> map) throws Exception;

		// 판매자 페이지 - 상품 관리 - 내 상품 목록
		public List<Map<String, Object>> myProductList(Map<String, Object> map) throws Exception;
		
		// 판매자 페이지 - 상품 관리 - 내 상품 목록 - 총 등록 상품 수
		public int myProductCount(Map<String, Object> map) throws Exception;

		// 판매자 페이지 - 상품 관리 - 내 상품 목록 - 상품 상세보기
		public List<Map<String, Object>> myProductDetail(Map<String, Object> map) throws Exception;
		

		
		// 리뷰
		public List<Map<String, Object>> reviewList(int num) throws Exception;
		
		// 판매자 페이지 - 상품 관리 - 내 상품 목록 - 상품 리뷰 목록
		public List<Map<String, Object>> myProductReviewList(Map<String, Object> map) throws Exception;
		
		// 판매자 페이지 - 상품 관리 - 내 상품 목록 - 상품 리뷰 목록 - 총 등록 리뷰 수
		public int myProductReviewCount(Map<String, Object> map) throws Exception;

		// 판매자 페이지 - 상품 관리 - 내 상품 목록 - 상품 리뷰 목록 - 리뷰 상세보기 - 리뷰 답변 등록
		public void enrollAnswer(Map<String, Object> map) throws Exception;
		 
		//판매자 페이지 - 상품관리 - 내 상품 목록 - 상품 리뷰 목록 - 리뷰 상세보기 - 리뷰 답변 수정
		public void modifyAnswer(Map<String, Object> map) throws Exception;

		//판매자 페이지 - 상품관리 - 내 상품 목록 - 상품 리뷰 목록 - 리뷰 상세보기
		public Map<String, Object> myProductReviewDetail(Map<String, Object> map) throws Exception;

		//판매자 페이지 - 상품관리 - 내 상품 목록 - 상품 리뷰 목록 - 리뷰 답변 상세보기
		public Map<String, Object> myProductReviewAnswerDetail(Map<String, Object> map) throws Exception;
		
		// 카트 이미지 업데이트
		public void updateImage(Map<String, Object> map) throws Exception;
		 
		
}