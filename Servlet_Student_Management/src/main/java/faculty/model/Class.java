package faculty.model;

public class Class {
	
	private String c_name;
	private String c_id;
	private String t_id;
	private String batcNo;

	public Class(String c_name, String c_id, String t_id, String batcNo) {
		super();
		this.c_name = c_name;
		this.c_id = c_id;
		this.t_id = t_id;
		this.batcNo = batcNo;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public String getC_id() {
		return c_id;
	}

	public void setC_id(String c_id) {
		this.c_id = c_id;
	}

	public String getT_id() {
		return t_id;
	}

	public void setT_id(String t_id) {
		this.t_id = t_id;
	}

	public String getBatcNo() {
		return batcNo;
	}

	public void setBatcNo(String batcNo) {
		this.batcNo = batcNo;
	}
	
	
}
