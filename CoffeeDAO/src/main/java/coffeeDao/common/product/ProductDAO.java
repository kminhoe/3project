package coffeeDao.common.product;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("productDAO")
public class ProductDAO {
	
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	//상품 조회
	public List<Map<String, Object>> selectProductList(Map<String, Object> map) throws Exception {
		return sqlSessionTemplate.selectList("product.selectProductList", map);
	}
	
	
	//상품ID 조회
	public List<Map<String, Object>> selectProductId(Map<String, Object> map) throws Exception {
		return sqlSessionTemplate.selectList("product.selectProductId", map);
	}
	
	// 상품 등록
		public void insertItem(Map<String, Object> map) throws Exception {
			sqlSessionTemplate.insert("product.insertProduct", map);
		}
		
		// 상품 이미지 등록
		public void insertItemImg(Map<String, Object> map) throws Exception {
			sqlSessionTemplate.insert("product.insertProductImg", map);
		}

		// 상품 수정
		public void updateItem(Map<String, Object> map) {
			sqlSessionTemplate.update("product.updateProduct", map);
		}
		
		// 상품 이미지 수정
		public void updateItemImg(Map<String, Object> map) {
			sqlSessionTemplate.update("product.updateProductImg", map);
		}
		

		// 상품 삭제
		public void deleteItem(Map<String, Object> map) {
			sqlSessionTemplate.update("product.deleteProduct", map);
		}

		// 상품 이미지 삭제
		public void deleteItemImg(Map<String, Object> map) throws Exception {
			sqlSessionTemplate.update("product.deleteProductImg", map);
		}

		// 판매자 페이지 - 상품관리 - 내상품 목록
		public List<Map<String, Object>> selectItemList(Map<String, Object> map) {
			return sqlSessionTemplate.selectList("product.myProductList", map);
		}

		// 판매자 페이지 - 상품 관리 - 내 상품 목록 - 상품 디테일
		public List<Map<String, Object>> selectItemDetail(Map<String, Object> map) {
			return sqlSessionTemplate.selectList("product.myProductDetail", map);
		}
		
	
		
		// 판매자 페이지 - 상품 관리 - 내 상품 목록 - 총 등록 상품 수
		public int myItemCount(Map<String, Object> map) throws Exception {
			return sqlSessionTemplate.selectOne("product.selectItemCount", map);
		}
		
		public List<Map<String, Object>> reviewList(int num){
			return sqlSessionTemplate.selectList("product.reviewList", num);
		}
		
		// 판매자 페이지 - 상품 관리 - 내 상품 목록 - 상품 리뷰 목록
		public List<Map<String, Object>> selectReviewList(Map<String, Object>map) throws Exception {
			return sqlSessionTemplate.selectList("product.myProductReviewList", map);
		}
		
		// 판매자 페이지 - 상품 관리 - 내 상품 목록 - 상품 리뷰 목록 - 총 등록 리뷰 수
		public int myReviewCount(Map<String, Object> map) throws Exception {
			return sqlSessionTemplate.selectOne("product.selectReviewCount", map);
		}

		// 판매자 페이지 - 상품 관리 - 내 상품 목록 - 상품 리뷰 목록 - 리뷰 상세보기- 리뷰 답변 등록
		public void insertAnswer(Map<String, Object> map) throws Exception {
			sqlSessionTemplate.insert("product.insertAnswer", map);
		}
		
		// 판매자 페이지 - 상품 관리 - 내 상품 목록 - 상품 리뷰 목록 - 리뷰 상세보기 - 리뷰 답변 수정
		public void UpdateAnswer(Map<String, Object> map) throws Exception {
			sqlSessionTemplate.update("product.UpdateAnswer", map);
		}

		//판매자 페이지 - 상품관리 - 내 상품 목록 - 상품 리뷰 목록 - 리뷰 상세보기
		public Map<String, Object> selectReviewDetail(Map<String, Object> map) throws Exception {
			return sqlSessionTemplate.selectOne("product.myProductReviewDetail", map);
		}
		
		//판매자 페이지 - 상품관리 - 내 상품 목록 - 상품 리뷰 목록 - 리뷰 답글 상세보기
		public Map<String, Object> selectReviewAnswerDetail(Map<String, Object> map) throws Exception {
			return sqlSessionTemplate.selectOne("product.myProductReviewAnswerDetail", map);
		}
		
		//상품 이미지 업데이트
		public void updateImage(Map<String, Object> map) throws Exception {
			sqlSessionTemplate.insert("product.updateImage", map);
		}
	
}
