package com.zipbop.board.domain.paging;

import lombok.*;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

@Getter
@Setter
@ToString
public class PageMarker {

    private int totalCount;
    private int startPage;
    private int endPage;
    private boolean prev;
    private boolean next;
    private int displayPageNum = 9;
    private int tempEndPage;
    private Criteria cri;

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
        calcData();
    }

    private void calcData() {
        endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);
        startPage = (endPage - displayPageNum) + 1;


        tempEndPage = (int) (Math.ceil(totalCount / (double) cri
                .getPerPageNum()));
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

        return uriComponents.toUriString();
    }

}