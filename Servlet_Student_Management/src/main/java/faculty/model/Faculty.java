package faculty.model;

public class Faculty {
	
	private String name;
	private String id;
	private String email;
	private String mobNo;
	private String pass;
	private String secQuestion;
	private String secAns;
	private String gender;
	
	public Faculty(String name, String id, String email, String mobNo, String pass, String secQuestion, String secAns,
			String gender) {
		super();
		this.name = name;
		this.id = id;
		this.email = email;
		this.mobNo = mobNo;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

