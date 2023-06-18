package com.servlet;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;

import com.dao.StudentDao;
import com.model.Student;

@MultipartConfig(maxFileSize = 999999,maxRequestSize = 999999)
@WebServlet("/StudentServlet")
public class StudentServlet  extends HttpServlet{
	
	@Override  
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if(req.getParameter("b1").equalsIgnoreCase("add"))
		{
			Student s=new Student();
			s.setSname(req.getParameter("sname"));
			s.setScity(req.getParameter("scity"));
			s.setSgender(req.getParameter("sgender"));
			s.setSaddress(req.getParameter("saddress"));
			s.setSstream(req.getParameter("sstream"));
			s.setSper(Double.parseDouble(req.getParameter("sper")));
			s.setShobbies(Arrays.asList(req.getParameterValues("shobbies")).toString());
			s.setSimage(IOUtils.toByteArray(req.getPart("simage").getInputStream()));
			s.setSresume(IOUtils.toByteArray(req.getPart("sresume").getInputStream()));
			
			System.out.println(s);
			if(new StudentDao().insertStudent(s)>0)
			{
				req.getRequestDispatcher("index.jsp").forward(req, resp);
			}
			else {
				req.getRequestDispatcher("error.jsp").forward(req, resp);
			}
			
		}
		if(req.getParameter("b1").equalsIgnoreCase("delete"))
		{
			int id=Integer.parseInt(req.getParameter("sid"));
			if(new StudentDao().deleteStudentBuSid(id)>0)
			{
				req.getRequestDispatcher("index.jsp").forward(req, resp);
			}
			else {
				req.getRequestDispatcher("error.jsp").forward(req, resp);
			}
		}
		if(req.getParameter("b1").equalsIgnoreCase("display"))
		{
			int id=Integer.parseInt(req.getParameter("sid"));
			Student s=new StudentDao().findStudentBySid(id);
			if(s!=null)
			{
				req.setAttribute("student", s);
				req.getRequestDispatcher("edit.jsp").forward(req, resp);
			}
			else {
				req.getRequestDispatcher("index.jsp").forward(req, resp);
			}
			
		}
		if(req.getParameter("b1").equalsIgnoreCase("update"))
		{
			Student s=new Student();
			s.setSid(Integer.parseInt(req.getParameter("sid")));
			s.setSname(req.getParameter("sname"));
			s.setScity(req.getParameter("scity"));
			s.setSgender(req.getParameter("sgender"));
			s.setSaddress(req.getParameter("saddress"));
			s.setSstream(req.getParameter("sstream"));
			s.setSper(Double.parseDouble(req.getParameter("sper")));
			s.setShobbies(Arrays.asList(req.getParameterValues("shobbies")).toString());
			
			if(new StudentDao().updateStudent(s)>0)
			{
				req.getRequestDispatcher("index.jsp").forward(req, resp);
			}
			else {
				req.getRequestDispatcher("edit.jsp").forward(req, resp);
			}
		}
		
	}
}
