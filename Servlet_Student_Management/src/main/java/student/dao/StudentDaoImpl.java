package student.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.connection.Dbconnection;
import student.model.Attendence;
import student.model.Student;

public class StudentDaoImpl implements StudentDao {
	
	Connection con=Dbconnection.getConnection();
	PreparedStatement p=null;
	int i,e;
	ResultSet rs=null;
	ResultSet r=null;
	
	@Override
	public int Register(Student s) {
		
		try {
			p=con.prepareStatement("insert into Student_Reg values(?,?,?,?,?,?,?,?,?)");
			p.setString(1, s.getName());
			p.setInt(2, s.getRollNo());
			p.setString(3, s.getEmail());
			p.setString(4, s.getMobNo());
			p.setString(5, s.getBatchNo());
			p.setString(6, s.getPass());
			p.setString(7, s.getSecQuestion());
			p.setString(8, s.getSecAns());
			p.setString(9, s.getGender());
			
			i=p.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		return i;
	}

	@Override
	public ResultSet Login(String email) {
		// TODO Auto-generated method stub
		
		try {
			p=con.prepareStatement("select email,pass,rollNo,name from Student_Reg where email=?");
			p.setString(1, email);
			
			rs=p.executeQuery();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
	}
	
	@Override
	public int resetPass(String email,String pass) {
		// TODO Auto-generated method stub
		
		try {
			p=con.prepareStatement("update Student_Reg set pass=? where email=?");
			p.setString(1, pass);
			p.setString(2, email);
			
			i=p.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
		
	}

	@Override
	public List<String> emailGetter(String batchNo) {
		// TODO Auto-generated method stub
		
		List<String> lstEmail=new ArrayList<String>();
		
		try {
			p=con.prepareStatement("select email from Student_Reg where batchNo=?");
			p.setString(1, batchNo);
			
			rs=p.executeQuery();
			
				while(rs.next())
				{
					String email = rs.getString("email"); 
			        lstEmail.add(email);
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return lstEmail;
	}

	@Override
	public ResultSet studentVerify(int rollNo) {
		// TODO Auto-generated method stub
		try {
			p=con.prepareStatement("select rollNo,name from Student_Reg where rollNo=?");
			p.setInt(1, rollNo);
			
			r=p.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return r;
	}

	@Override
	public int Enroll(List<String> enrollList, int rollNo) {
		// TODO Auto-generated method stub
		
		try {
			System.out.println("reached enroll");
			p=con.prepareStatement("insert into Class_Enrollment values (?,?,?,?)");
			p.setString(1, enrollList.get(0));
			p.setString(2, enrollList.get(1));
			p.setString(3, enrollList.get(2));
			p.setInt(4, rollNo);
			
			e=p.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return e;
	}

	@Override
	public List<String> classLoader(int rollNo) {
		// TODO Auto-generated method stub
		
		List<String> classList=new ArrayList<>();
		try {
			p=con.prepareStatement("select c_name from Class_Enrollment where rollNo=?");
			p.setInt(1, rollNo);
			
			rs=p.executeQuery();
			
			while(rs.next())
			{
				String c_name = rs.getString("c_name"); 
		        classList.add(c_name);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return classList;
	}

	@Override
	public int attendence(Attendence a) {
		// TODO Auto-generated method stub
		try {
			p=con.prepareStatement("insert into Attendence values (?,?,?,?,?)");
			p.setString(1, a.getC_name());
			p.setDate(2, a.getDate());
			p.setString(3, a.getS_name());
			p.setInt(4, a.getS_no());
			p.setString(5, a.getStatus());
			
			i=p.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
}
