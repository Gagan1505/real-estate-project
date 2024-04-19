package com.xworkz.real_estate_app.service.signinService;

import com.xworkz.real_estate_app.dto.UserDTO;
import com.xworkz.real_estate_app.repository.EstateRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

@Service
@Component
public class SignInService {

    @Autowired
    private EstateRepository repository;
    @Autowired
    private HttpSession session;

    @Autowired
    public SignInService(EstateRepository estateRepository,HttpSession httpSession){
        this.repository = estateRepository;
        this.session = httpSession;
    }

    public String authenticate(String email){
        UserDTO user = repository.getUserByEmail(email);
        if(user != null){
            session.setAttribute("userId",user.getUserId());
            session.setAttribute("userName",user.getUserFirstName());
            return user.getUserFirstName();
        }else{
            return null;
        }
    }
}
