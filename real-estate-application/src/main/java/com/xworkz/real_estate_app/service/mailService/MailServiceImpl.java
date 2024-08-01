package com.xworkz.real_estate_app.service.mailService;

import com.xworkz.real_estate_app.configuration.MailConfiguration;
import com.xworkz.real_estate_app.dto.UserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Component;

@Component
public class MailServiceImpl implements MailService {

    @Autowired
    MailConfiguration configuration;

    public void welcomeMail(UserDTO userDTO) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setTo(userDTO.getUserEmailId());
        mailMessage.setSubject("Registration successful");
        mailMessage.setText("You have successfully registered in REAL ESTATE APPLICATION"
        +"For any queries contact : gagananand1505@gmail.com");
        configuration.mailConfig().send(mailMessage);
    }

    @Override
    public boolean sendOtp(UserDTO userDTO,String otp) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setTo(userDTO.getUserEmailId());
        mailMessage.setSubject("Otp for login");
        mailMessage.setText("Your Otp is : "+otp+".\nThis will be valid till 10 minutes");
        configuration.mailConfig().send(mailMessage);
        return true;
    }
}
