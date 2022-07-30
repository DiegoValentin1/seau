package com.seau.seau.service.auth;

import com.seau.seau.model.auth.DaoAuth;

public class AuthService {
    DaoAuth auth = new DaoAuth();

    public com.seau.seau.model.auth.BeanUser login(String username, String password) {
        return auth.validate(username, password);
    }
}
