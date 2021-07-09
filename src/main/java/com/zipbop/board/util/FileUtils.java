package com.zipbop.board.util;

import com.zipbop.board.domain.entity.BoardVO;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;


@Component
public class FileUtils {
    // TODO for Window -> private static final String filePath = "C:/MyStudy/upload/"; // 파일이 저장될 위치
    private static final String filePath = "/Users/ryujeongmoon/Downloads/upload/"; // 파일이 저장될 위치

    public static Map<String, Object> parseInsertFileInfo(BoardVO boardVO, MultipartFile multipartFile) throws Exception {

        //MultipartFile multipartFile = null;
        String originalFileName = null;
        String originalFileExtension = null;
        String storedFileName = null;

        //List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
        Map<String, Object> listMap = null;

        int board_no = Integer.parseInt(boardVO.getNo());

        File file = new File(filePath);
        if (file.exists() == false) {
            file.mkdirs();
        }

        originalFileName = multipartFile.getOriginalFilename();
        originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
        storedFileName = getRandomString() + originalFileExtension;
        file = new File(filePath + storedFileName);
        multipartFile.transferTo(file);

        listMap = new HashMap<>();

        listMap.put("BOARD_NO", board_no);
        listMap.put("ORG_FILE_NAME", originalFileName);
        listMap.put("STORED_FILE_NAME", storedFileName);
        listMap.put("FILE_SIZE", multipartFile.getSize());

        return listMap;
    }

    public static String getRandomString() {
        return UUID.randomUUID()
                   .toString()
                   .replaceAll("-", "");
    }
}