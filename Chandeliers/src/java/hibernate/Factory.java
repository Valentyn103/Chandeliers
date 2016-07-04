package hibernate;

import hibernate.users.usersImplements;
import hibernate.users.usersInterface;

public class Factory {
    private static usersInterface usersInterface = null;
    private static Factory factory = null;

    public static synchronized Factory getFactory() {
        if (factory == null) {
            factory = new Factory();
        }
        return factory;
    }

    public usersInterface getusers() {
        if (usersInterface == null) {
            usersInterface = new usersImplements();
        }
        return usersInterface;
    }
}
