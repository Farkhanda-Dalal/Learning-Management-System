package faculty.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import common.connection.Dbconnection;
import faculty.model.Class;
import faculty.model.Faculty;
import student.model.Attendence;

public class FacultyDaoImpl implements FacultyDao {

	int i;
	Connection con=Dbconnection.getConnection();
	PreparedStatement p;
	ResultSet rs;

	@Override
	public int Register(Faculty f) {
		// TODO Auto-generated method stub
		try {
			p=con.prepareStatement("insert into Teacher_Reg values(?,?,?,?,?,?,?,?)");
			p.setString(1, f.getName());
			p.setString(2, f.getId());
			p.setString(3, f.getEmail());
			p.setString(4, f.getMobNo());
			p.setString(5, f.getPass());
			p.setString(6, f.getSecQuestion());
			p.setString(7, f.getSecAns());
			p.setString(8, f.getGender());

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
			p=con.prepareStatement("select email,pass,id from Teacher_Reg where email=?");
			p.setString(1, email);

			rs=p.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return rs;
	}

	@Override
	public int createClass(Class c) {
		// TODO Auto-generated method stub

		try {
			p=con.prepareStatement("insert into Class values(?,?,?,?)");
			p.setString(1, c.getC_name());
			p.setString(2, c.getC_id());
			p.setString(3, c.getT_id());
			p.setString(4, c.getBatcNo());

			i=p.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return i;
	}

	@Override
	public ResultSet verify(String t_id) {
		// TODO Auto-generated method stub
		try {
			p=con.prepareStatement("select id,pass from Teacher_Reg where id=?");
			p.setString(1, t_id);

			rs=p.executeQuery();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return rs;
	}

	@Override
	public int deleteClass(String c_id) {
		// TODO Auto-generated method stub

		try {
			p=con.prepareStatement("delete from Class where c_id=?");
			p.setString(1, c_id);

			i=p.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return i;
	}

	@Override
	public List<String> classLoader(String id) {
		// TODO Auto-generated method stub
		List<String> classList=new ArrayList<String>();

		try {
			p=con.prepareStatement("select c_name from Class where t_id=?");
			p.setString(1, id);

			rs=p.executeQuery();
			while(rs.next())
			{
				String className=rs.getString("c_name");
				classList.add(className);
				System.out.println(className);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return classList;
	}

	@Override
	public int resetPass(String email,String pass) {
		// TODO Auto-generated method stub

		try {
			p=con.prepareStatement("update Teacher_Reg set pass=? where email=?");
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
	public ResultSet classVerify(String c_id) {
		// TODO Auto-generated method stub
		System.out.println("reached classVerify");
		try {
			p=con.prepareStatement("select * from Class where c_id=?");
			p.setString(1, c_id);

			rs=p.executeQuery();


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return rs;
	}

	@Override
	public List<Attendence> viewAttendence(Attendence a) {
		// TODO Auto-generated method stub
		List<Attendence> lstAdd=new ArrayList<Attendence>();

		try {
			p=con.prepareStatement("select * from Attendence where TO_CHAR(a_date, 'dd-Month-yy')=? and c_name=?");
			p.setDate(1, a.getDate());
			p.setString(2, a.getC_name());

			System.out.println(a.getDate());
			System.out.println(a.getC_name());

			rs=p.executeQuery();

			System.out.println("rs executed");
			while(rs.next())
			{
				System.out.println("rows added");
				Attendence add=new Attendence(rs.getString(1), rs.getDate(2), rs.getString(3), rs.getInt(4), rs.getString(5));
				lstAdd.add(add);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lstAdd;
	}

	@Override
	public ResultSet viewEnrollment(String className) {
		// TODO Auto-generated method stub
		
		try {
			p=con.prepareStatement("select * from Class_Enrollment where c_name=?");
			p.setString(1, className);
			
			rs=p.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}

}
