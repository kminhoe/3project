package coffeeDao.common.qna;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


import coffeeDao.model.qnaBean;

@Service("inquiryService")
public class InquiryServiceImpl implements InquiryService {

	@Resource(name = "inquiryDAO")
	private InquiryDAO inquiryDAO;

	@Override
	public List<Map<String, Object>> inquiryList(String id) throws Exception {
		// TODO Auto-generated method stub
		return inquiryDAO.inquiryList(id);
	}

	@Override
	public int count(Criteria cri) throws Exception {
		return inquiryDAO.count(cri);
	}

	@Override
	public List<Map<String, Object>> inquiryListPage(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return inquiryDAO.inquiryListPage(cri);
	}

	@Override
	public void inquiryWrite(qnaBean qa, HttpSession session, HttpServletRequest request) throws Exception {

		MultipartFile qa_image = qa.getQA_FILE();

		if (qa_image.isEmpty()) {

			Map<String, Object> map = new HashMap<String, Object>();

			String writer = (String) session.getAttribute("MEM_ID");

			qa.setQA_WRITER(writer);

			map.put("QA_TITLE", qa.getQA_TITLE());
			map.put("QA_CONT", qa.getQA_CONT());
			map.put("QA_CLASS", qa.getQA_CLASS());
			map.put("QA_WRITER", qa.getQA_WRITER());
			map.put("QA_IMAGE", "");

			inquiryDAO.inquiryWrite(map);

		} else {

			// 이클립스에 해당 경로 폴더 만들기
			String path = request.getSession().getServletContext().getRealPath("resources/img/");
			System.out.println("경로 주소 : " + path);

			File f = new File(path);

			// 폴더 없으면 만들기
			if (!f.exists()) {
				f.mkdir();
			} else {
			}
			System.out.println("폴더가 존재합니다");

			// 파일 저장
			qa_image.transferTo(new File(path + qa_image.getOriginalFilename()));

			qa.setQA_IMAGE(qa_image.getOriginalFilename());

			Map<String, Object> map = new HashMap<String, Object>();

			String writer = (String) session.getAttribute("MEM_ID");

			qa.setQA_WRITER(writer);

			map.put("QA_TITLE", qa.getQA_TITLE());
			map.put("QA_CONT", qa.getQA_CONT());
			map.put("QA_CLASS", qa.getQA_CLASS());
			map.put("QA_WRITER", qa.getQA_WRITER());
			map.put("QA_IMAGE", qa_image.getOriginalFilename());

			inquiryDAO.inquiryWrite(map);
		}

	}

	@Override
	public Map<String, Object> inquiryDetail(int idx) throws Exception {

		return (Map<String, Object>) inquiryDAO.inquiryDetail(idx);

	}

	@Override
	public void inquiryUpdate(qnaBean qa, HttpSession session, HttpServletRequest request) throws Exception {

		MultipartFile qa_image = qa.getQA_FILE();

		if (qa_image.isEmpty()) {

			Map<String, Object> map = new HashMap<String, Object>();

			String writer = (String) session.getAttribute("MEM_ID");

			qa.setQA_WRITER(writer);

			map.put("QA_TITLE", qa.getQA_TITLE());
			map.put("QA_CONT", qa.getQA_CONT());
			map.put("QA_CLASS", qa.getQA_CLASS());
			map.put("QA_IMAGE", "");
			map.put("QA_IDX", qa.getQA_IDX());

			inquiryDAO.inquiryUpdate(map);

		} else {

			// 이클립스에 해당 경로 폴더 만들기
			String path = request.getSession().getServletContext().getRealPath("resources/img/");
			System.out.println("경로 주소 : " + path);

			File f = new File(path);

			// 폴더 없으면 만들기
			if (!f.exists()) {
				f.mkdir();
			} else {
			}
			System.out.println("폴더가 존재합니다");

			// 파일 저장
			qa_image.transferTo(new File(path + qa_image.getOriginalFilename()));

			qa.setQA_IMAGE(qa_image.getOriginalFilename());

			Map<String, Object> map = new HashMap<String, Object>();

			String writer = (String) session.getAttribute("MEM_ID");

			qa.setQA_WRITER(writer);

			map.put("QA_TITLE", qa.getQA_TITLE());
			map.put("QA_CONT", qa.getQA_CONT());
			map.put("QA_CLASS", qa.getQA_CLASS());
			map.put("QA_IMAGE", qa_image.getOriginalFilename());
			map.put("QA_IDX", qa.getQA_IDX());

			inquiryDAO.inquiryUpdate(map);
		}

	}

	@Override
	public void inquiryDelete(int num) throws Exception {
		// TODO Auto-generated method stub
		inquiryDAO.inquiryDelete(num);

	}

}
