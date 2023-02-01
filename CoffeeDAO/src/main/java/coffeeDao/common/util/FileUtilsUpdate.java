package coffeeDao.common.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("fileUtilsUpdate")
public class FileUtilsUpdate {

	// 파일명 랜덤 생성(문자,숫자)
	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

	// 경로 - 본인 서버, 로컬 경로로 설정
//	private static final String filePath = "C:\\Users\\new\\Desktop\\teamLoit\\CoffeeDAO\\CoffeeDAO manageProduct2\\src\\main\\webapp\\resources\\img\\";

	// 파일 등록
	public List<Map<String, Object>> parseInsertFileInfo(Map<String, Object> map, HttpServletRequest request)
			throws Exception {
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		
		String path2 = request.getSession().getServletContext().getRealPath("resources/img/");

		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> listMap = null;

		String itemId = (String) map.get("ITEM_ID");

		String fileNum = (String) map.get("FILE_NUM");

		File file = new File(path2);
		if (file.exists() == false) {
			file.mkdirs();
		}

		while (iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if (multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = getRandomString() + originalFileExtension;

				file = new File(path2 + storedFileName);
				multipartFile.transferTo(file);

				listMap = new HashMap<String, Object>();
				listMap.put("ITEM_ID", itemId);
				listMap.put("FILE_ORG", originalFileName);
				listMap.put("FILE_STD", storedFileName);
				listMap.put("FILE_SIZE", multipartFile.getSize());

				listMap.put("FILE_NUM", fileNum);

				list.add(listMap);
			}
		}
		return list;
	}
}
