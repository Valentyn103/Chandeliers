package hibernate.users;


import models.usersTable;

import java.util.List;

public interface usersInterface {
    public void add(usersTable db);

    public List getAll();
}
