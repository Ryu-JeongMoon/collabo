package com.spring.util;
import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import com.spring.board.biz.BoardVO;


@Component("fileUtils")
public class FileUtils {
	private static final String filePath = "C:/MyStudy/upload/"; // 파일이 저장될 위치
	
	public static Map<String, Object> parseInsertFileInfo(BoardVO boardVO, 
		MultipartFile multipartFile) throws Exception{
		
		//MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		
		//List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> listMap = null;
		
		int board_no = Integer.parseInt(boardVO.getNo());
		
		File file = new File(filePath);
		if(file.exists() == false) {
			file.mkdirs();
		}
		
		System.out.println("UTIL iterator has next");
		originalFileName = multipartFile.getOriginalFilename();
		originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
		storedFileName = getRandomString() + originalFileExtension;
		file = new File(filePath + storedFileName);
		multipartFile.transferTo(file);
		listMap = new HashMap<String, Object>();
		listMap.put("BOARD_NO", board_no);
		listMap.put("ORG_FILE_NAME", originalFileName);
		listMap.put("STORED_FILE_NAME", storedFileName);
		listMap.put("FILE_SIZE", multipartFile.getSize());
		
		return listMap;
	}
	

	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}