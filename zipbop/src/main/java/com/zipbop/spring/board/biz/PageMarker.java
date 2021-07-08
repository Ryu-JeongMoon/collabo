package com.spring.board.biz;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMarker {
   private int totalCount;
   private int startPage;
   private int endPage;
   private boolean prev;
   private boolean next;
   private int displayPageNum = 9;
   private int tempEndPage;
   
   
   public int getTempEndPage() {
      return tempEndPage;
   }

   public void setTempEndPage(int tempEndPage) {
      this.tempEndPage = tempEndPage;
   }

   private Criteria cri;
   
   
   public void setCri(Criteria cri) {
      this.cri = cri;
   }
   
   public void setTotalCount(int totalCount) {
      this.totalCount = totalCount;
      System.out.println("totalCount : " + totalCount);
      calcData();
   }
   
   public int getTotalCount() {
      return totalCount;
   }
   
   public int getStartPage() {
      return startPage;
   }
   
   public int getEndPage() {
      return endPage;
   }
   
   public boolean isPrev() {
      return prev;
   }
   
   public boolean isNext() {
      return next;
   }
   
   public int getDisplayPageNum() {
      return displayPageNum;
   }
   
   public Criteria getCri() {
      return cri;
   }
   
    


   @Override
   public String toString() {
      return "PageMarker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
            + prev + ", next=" + next + ", displayPageNum=" + displayPageNum + ", tempEndPage=" + tempEndPage
            + ", cri=" + cri + "]";
   }

   private void calcData() {
      endPage = (int) (Math.ceil(cri.getPage() / (double)displayPageNum) * displayPageNum);
      startPage = (endPage - displayPageNum) + 1;
      
     
      tempEndPage = (int) (Math.ceil(totalCount / (double)cri.getPerPageNum()));
      if (endPage > tempEndPage) {
         endPage = tempEndPage;
      }
      prev = startPage == 1 ? false : true;
      next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
      
   }
   
   public String makeQuery(int page) {
      UriComponents uriComponents = null;
      if (cri.getSearchCondition() != null) {
         uriComponents = UriComponentsBuilder.newInstance()
                      .queryParam("page", page)
                     .queryParam("perPageNum", cri.getPerPageNum())
                     .queryParam("searchKeyword", cri.getSearchKeyword())
                     .queryParam("searchCondition", cri.getSearchCondition())
                     .queryParam("flag_nq", cri.getFlag_nq())
                     .build();
      } else {
         uriComponents = UriComponentsBuilder.newInstance()
                .queryParam("page", page)
               .queryParam("perPageNum", cri.getPerPageNum())
               .queryParam("flag_nq", cri.getFlag_nq())
               .build();
      }
      System.out.println("uriComponents : " + uriComponents);
      return uriComponents.toUriString();
   }
   
}