package com.myversion.app;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.sql.DataSource;

public class StudentDbUtil {
	private DataSource dataSource;

	public StudentDbUtil(DataSource theDataSource) {
		dataSource = theDataSource;
	}
	public ArrayList<Student> StudDisplay() {
		Connection con = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		ArrayList<Student> students = new ArrayList<Student>();
		try {
			// Establish connection
			con = dataSource.getConnection();
			st = con.prepareStatement("select * from student");
			rs = st.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String first_name = rs.getString("first_name");
				String last_name = rs.getString("last_name");
				String email = rs.getString("email");
				Student s1 = new Student(id, first_name, last_name, email);
				students.add(s1);
			}

			close(st, rs, con);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return students;
	}

	private static void close(Statement st, ResultSet rs, Connection con) {
		try {
			if (rs != null) {
				rs.close();
			}

			if (st != null) {
				st.close();
			}

			if (con != null) {
				con.close(); // doesn't really close it ... just puts back in connection pool
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public Student getStudent(String theStudentId) {
		Student s1 = null;
		Connection con = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			// Establish connection
			con = dataSource.getConnection();
			st = con.prepareStatement("select * from student where id=?");
			st.setString(1, theStudentId);
			rs = st.executeQuery();
			rs.next();
			int id = rs.getInt("id");
			String first_name = rs.getString("first_name");
			String last_name = rs.getString("last_name");
			String email = rs.getString("email");
			s1 = new Student(id, first_name, last_name, email);

			close(st, rs, con);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return s1;

	}

	public void updateStudent(Student theStudent) {
		try {
			Connection con = null;
			PreparedStatement st = null;
			ResultSet rs = null;
			// Establish connection
			con = dataSource.getConnection();
			st = con.prepareStatement("update student set first_name=?,last_name=?,email=? where id=?");
			st.setString(1, theStudent.getFirst_name());
			st.setString(2, theStudent.getLast_name());
			st.setString(3, theStudent.getEmail());
			st.setInt(4, theStudent.getId());
			st.executeUpdate();
			close(st, rs, con);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void addStudent(Student theStudent) {
		try {
			Connection con = null;
			PreparedStatement st = null;
			ResultSet rs = null;
			// Establish connection
			con = dataSource.getConnection();
			st = con.prepareStatement("insert into student(id,first_name,last_name,email) values(?,?,?,?)");
			st.setInt(1, theStudent.getId());
			st.setString(2, theStudent.getFirst_name());
			st.setString(3, theStudent.getLast_name());
			st.setString(4, theStudent.getEmail());
			st.executeUpdate();
			close(st, rs, con);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void deleteStudent(int theStudentId) {
		try {
			Connection con = null;
			PreparedStatement st = null;
			ResultSet rs = null;
			// Establish connection
			con = dataSource.getConnection();
			st = con.prepareStatement("delete from student where id=?");
			st.setInt(1, theStudentId);
			st.executeUpdate();
			close(st, rs, con);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
	}

}
