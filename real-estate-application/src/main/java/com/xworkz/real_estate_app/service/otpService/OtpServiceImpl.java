package com.xworkz.real_estate_app.service.otpService;

import com.xworkz.real_estate_app.dto.UserDTO;
import com.xworkz.real_estate_app.otp.OtpGenerator;
import com.xworkz.real_estate_app.repository.EstateRepository;
import com.xworkz.real_estate_app.service.estateService.EstateService;
import com.xworkz.real_estate_app.service.mailService.MailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
public class OtpServiceImpl implements OtpService{

    @Autowired
    MailService mailService;

    @Autowired
    EstateService service;

    @Autowired
    EstateRepository repository;
    @Override
    public boolean sendUserOtpToLogin(String email) {
        UserDTO userDTO = service.getUserByEmail(email);
        String otp = OtpGenerator.generateOtp();
        System.err.println("otp generated is ------------------------------------------------------->>>>>>>>>>>>>>>>>>>>>     "+otp);

        LocalDateTime time = LocalDateTime.now();
        int userId = userDTO.getUserId();

        System.err.println("User id is ---------------------------------------> "+userId);

        if(service.emailIspresent(email)){
            if(mailService.sendOtp(userDTO,otp)){
                boolean isUpdated = service.setOtpAndTimeForUserById(userId,otp,time);
                if(isUpdated){
                    return true;
                }else{
                    return false;
                }
            }else{
                return false;
            }
        }else{
            return false;
        }
    }

    @Override
    public int verifyUserOtpToLogin(String email,String otpEntered) {
        int verifiedCode = 0;
        UserDTO userDTO = service.getUserByEmail(email);
        System.out.println("Otp in user is ---------------------->  "+userDTO.getUserOtp());
        int count = repository.getUserOtpCount(email);
        System.err.println(count);
        System.out.println("-------------------------- Entered otp is ---------------------------- : "+otpEntered);
        LocalDateTime timeOtpEntered = LocalDateTime.now();

        LocalDateTime otpSentTime = userDTO.getOtpTimeStamp();
        System.out.println("otp sent time =>>>>>>>>>> : "+otpSentTime);

        String otp = userDTO.getUserOtp();
        System.out.println(otp);
        int otpCount = repository.getUserOtpCount(email);
        try {
            if(timeOtpEntered.isBefore(otpSentTime.plusMinutes(300))) {
                if (otpCount <= 1) {
                    if (otpEntered.equals(otp)) {
                        repository.setOtpCountForUser(userDTO.getUserId(), 0);
                        verifiedCode = 1;
                    } else {
//                    < ---------------CHECK FOR INVALID -------------------- >
                        otpCount++;
                        verifiedCode = 2;
                        repository.setOtpCountForUser(userDTO.getUserId(), otpCount);
                        if (otpCount == 1) {
                            repository.setUserDeactivatedTime(userDTO.getUserId(), LocalDateTime.now());
                            repository.setOtpCountForUser(userDTO.getUserId(), 0);
                        }
                    }
                }
            }else{
                if(verifiedCode == 1){
                    verifiedCode = 1;
                }else{
                    verifiedCode = 3;
                }
            }
        }catch(Exception e){
            System.out.println("Error in verifying otp ------------- "+ e.getMessage());
        }
        return verifiedCode;
    }
}
