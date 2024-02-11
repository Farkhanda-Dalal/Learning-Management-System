package student.dao;

import java.sql.ResultSet;
import java.util.List;

import student.model.Attendence;
import student.model.Student;

public interface StudentDao {
	
	public int Register(Student s);
	public ResultSet Login(String email);
	public int resetPass(String email,String pass);
	public List<String> emailGetter(String batchNo);
	public  ResultSet studentVerify(int rollNo);
	public int Enroll(List<String> enrollList,int rollNo);
	public List<String> classLoader(int rollNo); 
	public int attendence(Attendence a);
}
