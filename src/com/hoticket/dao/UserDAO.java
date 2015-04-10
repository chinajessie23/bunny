package com.hoticket.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.annotations.NamedNativeQueries;
import org.hibernate.annotations.NamedNativeQuery;

import com.hoticket.modal.Customer;
import com.hoticket.modal.Movie;
import com.hoticket.modal.User;
import com.hoticket.util.ConnectionUtil;



public class UserDAO {
	Session session = null;

	/**
	 * get users list from user table
	 */
	@SuppressWarnings("unchecked")
	public List<User> getUsers() {

		List<User> users = new ArrayList<User>();
		try {

			session = ConnectionUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			users = (List<User>) session.createQuery("from User").list();
			session.getTransaction().commit();
			return users;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return users;
	}
	

	public void addUser(User user) {
		try {
	
			session = ConnectionUtil.getSessionFactory().openSession();
			Transaction transaction = session.beginTransaction();		
			Query query = session.getNamedQuery("calladdCustomerProcedure");
			query.setParameter("email", user.getEmail());
			query.setParameter("password", user.getPassword());
			query.setParameter("user_name", user.getUser_name());
			query.executeUpdate();
			transaction.commit();
			session.flush();
			session.close();
		} catch (Exception e) {
			e.getMessage();
			e.printStackTrace();
		}finally{
			session.close();
		}
		
	}
	
	//Third build?
	//update local image URL into database
	public void updatePortrait(String URL){
		
	}

/**
 * this method return a customer by searching by its pk=id
 * @param id
 * @return customer
 */
	public Customer getCustomer(int id) {
		Customer c;
		try {

			session = ConnectionUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			c = (Customer) session.get(Customer.class,id);
			c.getFavorite_movies();
			c.getBilling_accounts();c.getBilling_addresses();c.getFavorite_theatres();
			session.getTransaction().commit();
			return c;
			

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}


public void addCustomer(Customer c) {
	try {

		session = ConnectionUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.save(c);
		session.getTransaction().commit();
	} catch (Exception e) {
		e.printStackTrace();
	}
	
}
}