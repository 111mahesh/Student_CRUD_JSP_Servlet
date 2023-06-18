package com.util;

import org.hibernate.Session;
import org.hibernate.cfg.Configuration;

public class Hbutil {
	
	public static Session getSession()
	{
		return new Configuration().configure()
				.buildSessionFactory()
				.openSession();
	}
}
