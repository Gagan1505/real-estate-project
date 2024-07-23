package com.xworkz.real_estate_app.controller;

import ch.qos.logback.classic.BasicConfigurator;
import com.xworkz.real_estate_app.dto.UserDTO;
import com.xworkz.real_estate_app.service.estateService.EstateService;
import com.xworkz.real_estate_app.service.otpService.OtpService;
import com.xworkz.real_estate_app.service.signinService.SignInService;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Component
@RequestMapping("/")
public class OTPController {

    private Logger logger = LogManager.getLogger(OTPController.class);

    @Autowired
    EstateService service;

    @Autowired
    OtpService otpService;

    @PostMapping("/generate-Otp")
    public String otpSend(@RequestParam("userEmailId") String emailId,Model model){

        UserDTO userDTO = service.getUserByEmail(emailId);
        model.addAttribute("user",userDTO);
        boolean mailIsSent = otpService.sendUserOtpToLogin(emailId);
        logger.info("Mail is Sent or not : "+mailIsSent);
        System.err.println("Mail is sent or not : "+mailIsSent);
//        if(mailIsSent){
            model.addAttribute("msg","Otp has been sent to the mail:please checkout");
            return "login";
//        }else{
//            model.addAttribute("msg","User not registered,please register");
//            return "generateOtp";
//        }
    }

    // ---------------------- Logging in -----------------------------
    @PostMapping("/user-Login")
    public String verifyOtp(@RequestParam("userEmailId")String email, @RequestParam("enteredOtp")String otpEntered, Model model, HttpSession session){

        System.err.println(email);
        UserDTO userDTO = service.getUserByEmail(email);
        int code = otpService.verifyUserOtpToLogin(email,otpEntered);
        if(code == 1){
            System.err.println("------------------- user is ------------------"+userDTO);
            System.err.println("---------------- And id is : ----------------"+userDTO.getUserId());
            model.addAttribute("user",userDTO);
            model.addAttribute("userId",userDTO.getUserId());
            model.addAttribute("msg","Login successful");
            session.setAttribute("userId",userDTO.getUserId());
            return "userDashboard";
        } else if (code == 2) {
            model.addAttribute("msg","Invalid otp or email");
            return "generateOtp";
        }else{
            model.addAttribute("msg","Otp expired");
            return "generateOtp";
        }
    }


}
