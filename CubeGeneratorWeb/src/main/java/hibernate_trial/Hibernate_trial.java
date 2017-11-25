package hibernate_trial;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import POJOS.Address;

public class Hibernate_trial {

	public static void main(String[] args) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		
		Transaction tx = null;

        try {
            tx = session.beginTransaction();
            Address address = new Address("egypt" , "giza");
            session.save(address);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }

	}

}
