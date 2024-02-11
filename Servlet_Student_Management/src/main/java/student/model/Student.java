package student.model;

public class Student {
	
	private String name;
	private int rollNo;
	private String email;
	private String mobNo;
	private String batchNo;
	private String pass;
	private String secQuestion;
	private String secAns;
	private String gender;
	
	public Student(String name, int rollNo, String email, String mobNo, String batchNo, String pass, String secQuestion,
			String secAns, String gender) {
		super();
		this.name = name;
		this.rollNo = rollNo;
		this.email = email;
		this.mobNo = mobNo;
		this.batchNo = batchNo;
		this.pass = pass;
		this.secQuestion = secQuestion;
		this.secAns = secAns;
		this.gender = gender;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getRollNo() {
		return rollNo;
	}

	public void setRollNo(int rollNo) {
		this.rollNo = rollNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobNo() {
		return mobNo;
	}

	public void setMobNo(String mobNo) {
		this.mobNo = mobNo;
	}

	public String getBatchNo() {
		return batchNo;
	}

	public void setBatchNo(String batchNo) {
		this.batchNo = batchNo;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getSecQuestion() {
		return secQuestion;
	}

	public void setSecQuestion(String secQuestion) {
		this.secQuestion = secQuestion;
	}

	public String getSecAns() {
		return secAns;
	}

	public void setSecAns(String secAns) {
		this.secAns = secAns;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	
	
}
