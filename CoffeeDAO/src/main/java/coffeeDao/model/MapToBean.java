package coffeeDao.model;

import java.util.Date;
import java.util.Map;



public class MapToBean {

	public static MemberBean mapToMember(Map<String, Object> map) {
		MemberBean memberBean = new MemberBean();
		
		memberBean.setMEM_ID((String) map.get("MEM_ID"));
		memberBean.setMEM_PWD((String) map.get("MEM_PWD"));
		memberBean.setMEM_NAME((String) map.get("MEM_NAME"));
		
		memberBean.setMEM_RDATE((Date) map.get("MEM_RDATE"));
		memberBean.setMEM_EMAIL((String) map.get("MEM_EMAIL"));
		memberBean.setMEM_ADDR1((String) map.get("MEM_ADDR1"));
		memberBean.setMEM_ADDR2((String) map.get("MEM_ADDR2"));
		
		memberBean.setMEM_ZP((String) map.get("MEM_ZP"));
		memberBean.setMEM_PHONE((String) map.get("MEM_PHONE"));
		memberBean.setMEM_DEL((Number) map.get("MEM_DEL"));	

		return memberBean;
	}
	
	public static SellerBean mapToSeller(Map<String, Object> map) {
		SellerBean sellerBean = new SellerBean();
		
		sellerBean.setSELL_ID((String) map.get("SELL_ID"));
		sellerBean.setSELL_PWD((String) map.get("SELL_PWD"));
		sellerBean.setSELL_NUM((String) map.get("SELL_NUM"));
		sellerBean.setSELL_NAME((String) map.get("SELL_NAME"));
		sellerBean.setSELL_PHONE((String) map.get("SELL_PHONE"));
		sellerBean.setSELL_ADDR1((String) map.get("SELL_ADDR1"));
		sellerBean.setSELL_ADDR2((String) map.get("SELL_ADDR2"));
		sellerBean.setSELL_ZP((String) map.get("SELL_ZP"));
		sellerBean.setSELL_EMAIL((String) map.get("SELL_EMAIL"));
		sellerBean.setSELL_BANK((String) map.get("SELL_BANK"));
		sellerBean.setSELL_IMAGE((String) map.get("SELL_IMAGE"));
		sellerBean.setSELL_PROF((String) map.get("SELL_PROF"));
		sellerBean.setSELL_CONT((String) map.get("SELL_CONT"));
		sellerBean.setSELL_RDATE((Date) map.get("SELL_RDATE"));
		sellerBean.setSELL_BNUM((String) map.get("SELL_BUNM"));		
		sellerBean.setSELL_SNS((String) map.get("SELL_SNS"));
		sellerBean.setSELL_STATE((Number) map.get("SELL_STATE"));
		
		return sellerBean;
	}
	
	public static ProductBean mapToProduct(Map<String, Object> map) {
		ProductBean productBean = new ProductBean();
		
		productBean.setITEM_ID((Number) map.get("ITEM_ID"));
		productBean.setITEM_NAME((String) map.get("ITEM_NAME"));
		productBean.setITEM_IMAGE((String) map.get("ITEM_IMAGE"));
		productBean.setITEM_DATE((Date) map.get("ITEM_DATE"));
		productBean.setITEM_SELLER((String) map.get("ITEM_SELLER"));
		productBean.setITEM_CONT((String) map.get("ITEM_CONT"));
		productBean.setITEM_SUB((String) map.get("ITEM_SUB"));
		productBean.setITEM_COMP((String) map.get("ITEM_COMP"));
		productBean.setITEM_LOC((String) map.get("ITEM_LOC"));
		productBean.setITEM_200((String) map.get("ITEM_200"));
		productBean.setITEM_500((String) map.get("ITEM_500"));
		productBean.setITEM_CAF((String) map.get("ITEM_CAF"));
		productBean.setITEM_TASTE((String) map.get("ITEM_TASTE"));
		productBean.setITEM_TYPE((String) map.get("ITEM_TYPE"));
		productBean.setITEM_GRIND((String) map.get("ITEM_GRIND"));
		productBean.setITEM_SEND((Number) map.get("ITEM_SEND"));
		productBean.setITEM_LIKE((Number) map.get("ITEM_LIKE"));
		productBean.setITEM_DEL((String) map.get("ITEM_DEL"));
		productBean.setFILE_STD((String)map.get("FILE_STD"));
		productBean.setSELL_PROF((String)map.get("SELL_PROF"));
		
		return productBean;
	}
	
	public static OrderBean mapToOrder(Map<String, Object> map) {
		OrderBean orderBean = new OrderBean();
		
		orderBean.setORDER_STATE((String) map.get("ORDER_STATE"));
		
		return orderBean;
	}
	
}