package faculty.dao;

import java.sql.ResultSet;
import java.util.List;

import faculty.model.Class;
import faculty.model.Faculty;
import student.model.Attendence;

public interface FacultyDao {
	
	public int Register(Faculty f);
	public ResultSet Login(String email);
	public int resetPass(String email,String pass);
	public List<String> classLoader(String id);
	public int createClass(Class c);
	public ResultSet verify(String t_id);
	public int deleteClass(String c_id);
	public ResultSet classVerify(String c_id);
	public List<Attendence> viewAttendence(Attendence a);
	public ResultSet viewEnrollment(String className);
}
