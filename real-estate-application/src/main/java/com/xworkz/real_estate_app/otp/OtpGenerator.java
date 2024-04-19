package com.xworkz.real_estate_app.otp;

import java.util.Random;

public class OtpGenerator {

    public static String generateOtp(){
        Random random = new Random();
        StringBuilder otp = new StringBuilder();
        for(int i=0;i<6; i++){
            otp.append(random.nextInt(10));
        }
        return otp.toString();
    }
}
