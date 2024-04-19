package com.xworkz.real_estate_app.service.otpService;

import org.springframework.stereotype.Service;

public interface OtpService {

    boolean sendUserOtpToLogin(String email);

    int verifyUserOtpToLogin(String email, String otp);
}
