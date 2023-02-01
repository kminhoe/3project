package coffeeDao.common.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import coffeeDao.common.util.FileUtils;
import coffeeDao.common.util.FileUtilsUpdate;
import coffeeDao.model.ProductBean;

@Service("productService")
public class ProductServiceImpl implements ProductService {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="productDAO")
	private ProductDAO productDAO;
	
	@Resource(name = "fileUtilsUpdate")
	private FileUtilsUpdate fileUtilsUpdate;

	@Resource(name = "fileUtils")
	private FileUtils fileUtils;
	
	@Override
	public List<Map<String, Object>> selectProductList(ProductBean product) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("ITEM_ID", product.getITEM_ID());
		
		return productDAO.selectProductList(map);
	}

	@Override
	public List<Map<String, Object>> selectProductId(ProductBean product) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("ITEM_ID", product.getITEM_ID());
		
		return productDAO.selectProductId(map);
	}
	
	// 상품&이미지 등록
		@Override
		public void enrollItem(Map<String, Object> map, HttpServletRequest request) throws Exception {
			productDAO.insertItem(map);

			List<Map<String, Object>> listFile = fileUtils.parseInsertFileInfo(map, request);
			for (int i = 0, size = listFile.size(); i < size; i++) {
				productDAO.insertItemImg(listFile.get(i));
			}
		}

		// 상품 수정
		@Override
		public void modifyItem(Map<String, Object> map, HttpServletRequest request) throws Exception {
			productDAO.updateItem(map);
		}

		// 상품 이미지 수정
		@Override
		public void modifyItemImg(Map<String, Object> map, HttpServletRequest request) throws Exception {

			if (map.get("FILE_NUM") == null) {
			} else {
				if (map.get("FILE_NUM").getClass().isArray()) {
					String[] f_n = (String[]) map.get("FILE_NUM");
					if (f_n.length > 1) {
						productDAO.deleteItemImg(map);

						List<Map<String, Object>> listFile = fileUtils.parseInsertFileInfo(map, request);
						for (int i = 0, size = listFile.size(); i < size; i++) {
							productDAO.insertItemImg(listFile.get(i));
						}
					}
				} else {
					List<Map<String, Object>> listFile = fileUtilsUpdate.parseInsertFileInfo(map, request);
					productDAO.updateItemImg(listFile.get(0));
				}
			}
		}

		// 상품 삭제
		@Override
		public void removeItem(Map<String, Object> map) throws Exception {
			productDAO.deleteItem(map);
		}

		// 상품이미지 삭제
		@Override
		public void removeItemImg(Map<String, Object> map) throws Exception {
			productDAO.deleteItemImg(map);
		}

		// 판매자 페이지 - 상품 관리 - 내 상품 목록
		@Override
		public List<Map<String, Object>> myProductList(Map<String, Object> map) throws Exception {

			return productDAO.selectItemList(map);
		}

		// 판매자 페이지 - 상품 관리 - 내 상품 목록 - 상품 상세보기
		@Override
		public List<Map<String, Object>> myProductDetail(Map<String, Object> map) throws Exception {
			return productDAO.selectItemDetail(map);
		}

		

		// 판매자 페이지 - 상품 관리 - 내 상품 목록 - 총 등록 상품 수
		public int myProductCount(Map<String, Object> map) throws Exception {
			return productDAO.myItemCount(map);
		}
		
		@Override
		public List<Map<String, Object>> reviewList(int num) throws Exception {
			// TODO Auto-generated method stub
			return productDAO.reviewList(num);
		}
		
		// 판매자 페이지 - 상품 관리 - 내 상품 목록 - 상품 리뷰 목록
		@Override
		public List<Map<String, Object>> myProductReviewList(Map<String, Object> map) throws Exception {
			return productDAO.selectReviewList(map);
		}
		
		// 판매자 페이지 - 상품 관리 - 내 상품 목록 - 상품 리뷰 목록 - 총 등록 리뷰 수
		@Override
		public int myProductReviewCount(Map<String, Object> map) throws Exception {
			return productDAO.myReviewCount(map);
		}

		// 판매자 페이지 - 상품 관리 - 내 상품 목록 - 상품 리뷰 목록 - 리뷰 상세보기 - 리뷰 답변 등록
		@Override
		public void enrollAnswer(Map<String, Object> map) throws Exception {
			productDAO.insertAnswer(map);
		}
		
		//판매자 페이지 - 상품관리 - 내 상품 목록 - 상품 리뷰 목록 - 리뷰 상세보기 - 리뷰 답변 수정
		@Override
		public void modifyAnswer(Map<String, Object> map) throws Exception {
			productDAO.UpdateAnswer(map);	
		}

		//판매자 페이지 - 상품관리 - 내 상품 목록 - 상품 리뷰 목록 - 리뷰 상세보기
		@Override
		public Map<String, Object> myProductReviewDetail(Map<String, Object> map) throws Exception {
			return productDAO.selectReviewDetail(map);
		}
		
		//판매자 페이지 - 상품관리 - 내 상품 목록 - 상품 리뷰 목록 - 리뷰 답글 상세보기
		@Override
		public Map<String, Object> myProductReviewAnswerDetail(Map<String, Object> map) throws Exception {
			return productDAO.selectReviewAnswerDetail(map);
		}

		@Override
		public void updateImage(Map<String, Object> map) throws Exception {
			productDAO.updateImage(map);
			
		}
		
		

}
