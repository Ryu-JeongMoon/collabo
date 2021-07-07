package com.zipbop.funding;

public class MemberVO {
	private String id;
	private String license;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getLicense() {
		return license;
	}

	public void setLicense(String license) {
		this.license = license;
	}

	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", license=" + license + "]";
	}

}
