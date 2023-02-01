package coffeeDao.common.qna;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import coffeeDao.common.common.dao.AbstractDAO;

@Repository("inquiryDAO")
public class InquiryDAO extends AbstractDAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	@SuppressWarnings("unchecked") // 리스트
	public List<Map<String, Object>> inquiryList(String id) throws Exception {
		return (List<Map<String, Object>>) selectList("qna.inquiryList", id);
	}

	// 게시물 카운트
	public int count(Criteria cri) throws Exception {
		return sqlSessionTemplate.selectOne("qna.count", cri);
	}

	// 페이징
	@SuppressWarnings("unchecked") // 리스트
	public List<Map<String, Object>> inquiryListPage(Criteria cri) throws Exception {
		return (List<Map<String, Object>>) selectList("qna.inquiryListPage", cri);
	}

	// 게시물 작성
	public void inquiryWrite(Map<String, Object> map) throws Exception {
		sqlSessionTemplate.insert("qna.inquiryWrite", map);
	}

	// 게시물 선택
	public Map<String, Object> inquiryDetail(int idx) throws Exception {
		return sqlSessionTemplate.selectOne("qna.inquiryDetail", idx);
	}

	// 게시물 수정
	public void inquiryUpdate(Map<String, Object> map) throws Exception {
		sqlSessionTemplate.insert("qna.inquiryUpdate", map);
	}

	// 게시물 삭제
	public void inquiryDelete(int num) throws Exception {
		sqlSessionTemplate.insert("qna.inquiryDelete", num);
	}

}
