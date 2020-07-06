package com.myversion.app;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {
	
private static final long serialVersionUID = 1L;
private StudentDbUtil dbUtil;
	
	@Resource(name="jdbc/web_student_tracker")
	private DataSource dataSource;
	
	@Override
	public void init() throws ServletException {
		super.init();
		
		// create our student db util ... and pass in the conn pool / datasource
		try {
			dbUtil = new StudentDbUtil(dataSource);
		}
		catch (Exception exc) {
			throw new ServletException(exc);
		}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String command = request.getParameter("command");

		if (command == null) {
			command = "LIST";
		}
		switch (command) {
		case "LIST":
			getStudents(request, response);
			break;
		case "LOAD":
			loadStudent(request, response);
			break;
		case "UPDATE":
			updateStudent(request, response);
			break;
		case "ADD":
			addStudent(request, response);
			break;
		case "DELETE":
			deleteStudent(request,response);
			break;
		}

	}

	private void deleteStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// read student id info from form data
		int theStudentId=Integer.parseInt(request.getParameter("studentId"));
		// perform delete of id from database
		dbUtil.deleteStudent(theStudentId);
		// send them back to the "list students" page
		getStudents(request, response);
		
	}

	private void addStudent(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// read student info from form data
		int theStudentId = Integer.parseInt(request.getParameter("id"));
		String firstName = request.getParameter("first_name");
		String lastName = request.getParameter("last_name");
		String email = request.getParameter("email");
		// create a new student object
		Student theStudent = new Student(theStudentId, firstName, lastName, email);
		// perform add operation in database
		dbUtil.addStudent(theStudent);

		// send them back to the "list students" page
		getStudents(request, response);

	}

	private void updateStudent(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// read student info from form data
		int theStudentId = Integer.parseInt(request.getParameter("id"));
		String firstName = request.getParameter("first_name");
		String lastName = request.getParameter("last_name");
		String email = request.getParameter("email");
		// create a new student object
		Student theStudent = new Student(theStudentId, firstName, lastName, email);

		// perform update on database
		dbUtil.updateStudent(theStudent);

		// send them back to the "list students" page
		getStudents(request, response);
	}

	private void getStudents(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// get student from database (db util)
		List<Student> theStudent = dbUtil.StudDisplay();

		// place student in the request attribute
		request.setAttribute("studentDetails", theStudent);

		// send to jsp page: index.jsp
		RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
		dispatcher.forward(request, response);

	}

	private void loadStudent(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// read student id from form data
		String theStudentId = request.getParameter("studentId");

		// get student from database (db util)
		Student theStudent = dbUtil.getStudent(theStudentId);

		// place student in the request attribute
		request.setAttribute("theStudent", theStudent);
		// send to jsp page: update-student-form.jsp
		RequestDispatcher dispatcher = request.getRequestDispatcher("/update-student-form.jsp");
		dispatcher.forward(request, response);
	}

}
