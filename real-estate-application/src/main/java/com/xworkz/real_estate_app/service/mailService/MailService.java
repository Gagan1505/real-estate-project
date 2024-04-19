package com.xworkz.real_estate_app.service.mailService;

import com.xworkz.real_estate_app.dto.UserDTO;

public interface MailService {
    void welcomeMail(UserDTO userDTO);

    boolean sendOtp(UserDTO userDTO, String otp);
}
