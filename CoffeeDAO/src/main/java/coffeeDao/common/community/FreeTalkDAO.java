package coffeeDao.common.community;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("freeTalkDAO")
public class FreeTalkDAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	//조회수 
	public void updateCount(Map<String,Object>map) throws Exception{
		sqlSessionTemplate.update("board.updateCount", map);
	}
	
	// 게시글 리스트
	public List<Map<String, Object>> freeTalkList(Map<String, Object> map) throws Exception {
		return sqlSessionTemplate.selectList("board.selectBoardList", map);
	}
	
	// 게시글 총 갯수
	public int countBoard(Map<String, Object> map) throws Exception {
		return sqlSessionTemplate.selectOne("board.countBoard", map);
	}
	
	// 게시글 작성하기
	public void freeTalkWrite(Map<String, Object> map) throws Exception {
		sqlSessionTemplate.insert("board.insertBoard", map);
	}
	
	public Map<String,Object> freeTalkDetail(Map<String,Object>map) throws Exception {
		return sqlSessionTemplate.selectOne("board.detailBoard", map);
	}
	
	public void freeTalkModify(Map<String,Object>map) throws Exception {
		sqlSessionTemplate.update("board.modifyBoard", map);
	}
	
	public void noticeWrite(Map<String,Object> map) throws Exception {
		sqlSessionTemplate.insert("admin.noticeWrite", map);
	}
	
	public void freeTalkDelete(Map<String,Object> map) throws Exception {
		sqlSessionTemplate.update("board.deleteBoard", map);
	}
	
	// 댓글 리스트
		public List<Map<String, Object>> commentList(int BO_IDX) throws Exception {
			return sqlSessionTemplate.selectList("board.selectCommentList", BO_IDX);
		}
		
		// 댓글 작성하기
		public int insertComment(Map<String, Object> map) throws Exception {
			return sqlSessionTemplate.insert("board.insertComment", map);
		}

		// 대댓글 REF 최대값
		public int countRef(Map<String, Object> map) throws Exception {
			return sqlSessionTemplate.selectOne("board.countRef", map);
		}
		
		// 대댓글 REF 최대값
		public int commentIDXS(Map<String, Object> map) throws Exception {
			return sqlSessionTemplate.selectOne("board.commentIDX", map);
		}
		
		//조회수 
		public void updateRestep(Map<String,Object>map) throws Exception{
			sqlSessionTemplate.update("board.updateRestep", map);
		}
		
		//조회수 
		public Long getMaxIdx() throws Exception{
			return sqlSessionTemplate.selectOne("board.getMaxIdx");
		}
		public void updateComment(Map<String, Object> map) throws Exception{
			
			sqlSessionTemplate.update("board.updateComment", map);
		}
		
		public void deleteComment(int COM_IDX) throws Exception{
			sqlSessionTemplate.delete("board.deleteComment", COM_IDX);
		}
}
