package cn.edu.imnu.itoffer.bean;

import java.util.Date;

public class Applicant {
	private int applicantId;
	private String applicantEmail;
	private String applicantPwd;
	private Date applicantRegistDate;
	public Applicant() {
		super();
	}

	public Applicant(int applicantId, String applicantEmail, String applicantPwd) {
		super();
		this.applicantId = applicantId;
		this.applicantEmail = applicantEmail;
		this.applicantPwd = applicantPwd;
		
		// TODO Auto-generated constructor stub
	}

}
