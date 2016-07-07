package hibernate.users;

import hibernate.HibernateUnit;
import models.usersTable;
import org.hibernate.Session;

import java.util.List;

public class usersImplements implements usersInterface {
    @Override
    public void add(usersTable usersTable) {
        Session session = HibernateUnit.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(usersTable);
        session.getTransaction().commit();
    }

    @Override
    public List getAll() {
        Session session = HibernateUnit.getSessionFactory().openSession();
        List<usersTable> list = session.createCriteria(usersTable.class).list();
        return list;
    }
}