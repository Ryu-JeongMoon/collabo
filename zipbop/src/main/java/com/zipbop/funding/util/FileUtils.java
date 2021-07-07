package com.zipbop.funding.util;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import com.zipbop.funding.FundingOpenVO;


@Component("fileUtils")
public class FileUtils {
   private static final String filePath = "C:/MyStudy/upload/"; // 파일이 저장될 위치
   
   public static Map<String, Object> parseInsertFileInfo(FundingOpenVO ovo, 
      MultipartFile multipartFile) throws Exception{
      
      //MultipartFile multipartFile = null;
      String originalFileName = null;
      String originalFileExtension = null;
      String storedFileName = null;
      
      //List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
      Map<String, Object> listMap = null;
      
      int board_no = ovo.getProduct_no();
      
      File file = new File(filePath);
      if(file.exists() == false) {
         file.mkdirs();
      }
      
      System.out.println("UTIL iterator has next");
      originalFileName = multipartFile.getOriginalFilename();
      originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
      file = new File(filePath + originalFileName);
      multipartFile.transferTo(file);
      listMap = new HashMap<String, Object>();
      listMap.put("BOARD_NO", board_no);
      listMap.put("ORG_FILE_NAME", originalFileName);
      
      return listMap;
   }
   


}