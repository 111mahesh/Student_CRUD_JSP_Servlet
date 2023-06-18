package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.model.Student;
import com.util.Hbutil;

public class StudentDao {
	
	Session session=Hbutil.getSession();
	Transaction tx=session.beginTransaction();
	
	public int insertStudent(Student s)
	{
		int check=(Integer) session.save(s);
		tx.commit();
		session.close();
		
		return check;
	}
	public int deleteStudentBuSid(int sid)
	{
		int check=session.createQuery("delete from Student where sid='"+sid+"'")
				.executeUpdate();
		
		tx.commit();
		session.close();
		return check;
	}
	public Student findStudentBySid(int id)
	{
		Student s=(Student)session.createCriteria(Student.class)
				.add(Restrictions.eq("sid", id))
				.uniqueResult();
		tx.commit();
		session.close();
		
		return s;
	}
	public int updateStudent(Student s)
	{
		int check=session.createQuery("update Student set sname='"+s.getSname()+"',scity='"+s.getScity()+"',saddress='"+s.getSaddress()+"',sgender='"+s.getSgender()+"',sper='"+s.getSper()+"',sstream='"+s.getSstream()+"',shobbies='"+s.getShobbies()+"' where sid='"+s.getSid()+"'")
				.executeUpdate();
				
				
		tx.commit();
		session.close();
		return check;
	}
	public List<Student> findAllStudent()
	{
		List<Student> list=session.createCriteria(Student.class).list();
		
		tx.commit();
		session.close();
		return list;
	}
	public byte[] findImageBySid(int sid)
	{
		byte[] b=(byte[])session.createCriteria(Student.class)
				.add(Restrictions.eq("sid", sid))
				.setProjection(Projections.property("simage"))
				.uniqueResult();
		tx.commit();
		session.close();
		return b;
	}
	public byte[] findResumeBySid(int sid)
	{
		byte[] b=(byte[])session.createCriteria(Student.class)
				.add(Restrictions.eq("sid", sid))
				.setProjection(Projections.property("sresume"))
				.uniqueResult();
		tx.commit();
		session.close();
		return b;
	}
}
