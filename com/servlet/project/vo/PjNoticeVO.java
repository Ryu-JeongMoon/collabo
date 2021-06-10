package bitcamp.project.vo;

public class PjNoticeVO {
	private String pj_idx, writer, pwd, regdate, editdate, hit, title, content, file_name, com_count;

	public String getPj_idx() {
		return pj_idx;
	}

	public void setPj_idx(String pj_idx) {
		this.pj_idx = pj_idx;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getEditdate() {
		return editdate;
	}

	public void setEditdate(String editdate) {
		this.editdate = editdate;
	}

	public String getHit() {
		return hit;
	}

	public void setHit(String hit) {
		this.hit = hit;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getCom_count() {
		return com_count;
	}

	public void setCom_count(String com_count) {
		this.com_count = com_count;
	}

	@Override
	public String toString() {
		return "PjNoticeVO [pj_idx=" + pj_idx + ", writer=" + writer + ", pwd=" + pwd + ", regdate=" + regdate
				+ ", editdate=" + editdate + ", hit=" + hit + ", title=" + title + ", content=" + content
				+ ", file_name=" + file_name + ", com_count=" + com_count +"]";
	}
	
}
