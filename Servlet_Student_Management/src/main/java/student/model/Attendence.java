package student.model;

import java.sql.Date;

public class Attendence {
	
	private String c_name;
	private Date date;
	private String s_name;
	private int s_no;
	private String status;
	
	public Attendence(String c_name, Date date, String s_name, int s_no, String status) {
		super();
		this.c_name = c_name;
		this.date = date;
		this.s_name = s_name;
		this.s_no = s_no;
		this.status = status;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getS_name() {
		return s_name;
	}

	public void setS_name(String s_name) {
		this.s_name = s_name;
	}

	public int getS_no() {
		return s_no;
	}

	public void setS_no(int s_no) {
		this.s_no = s_no;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
}
