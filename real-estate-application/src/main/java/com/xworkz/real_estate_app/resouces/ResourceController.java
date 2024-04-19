package com.xworkz.real_estate_app.resouces;

import com.xworkz.real_estate_app.service.estateService.EstateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RequestMapping("/")
@RestController
public class ResourceController {

    @Autowired
    EstateService service;

    @GetMapping("getEmail/{email}")
    public String emailIsPresent(@PathVariable("email") String email){

        if(service.emailIspresent(email)){
                return "Already exist";
        } else{
            return "";
        }
    }

    @GetMapping("getPhone/{phone}")
    public String phoneIsPresent(@PathVariable("phone") Long phone){
        if(service.phoneIspresent(phone))
            return "Already exist";
        else
            return "";
    }

    @GetMapping("getAdhaar/{adhaar}")
    public String adhaarIsPresent(@PathVariable("adhaar") Long adhaar){
        if(service.adhaarCount(adhaar))
            return "Already exist";
        else
            return "";
    }

    @GetMapping("getPan/{pan}")
    public String panIsPresent(@PathVariable("pan") String pan){
        if(service.panIsPresent(pan))
            return "Already exist";
        else
            return "";
    }


    @GetMapping("verifyUserToGenerateOtp/{email}")
    public String isActive(@PathVariable("email") String email){
        if(service.emailIspresent(email)){

//            1.TIME CHECK == 1
            if(service.userIsActive(email)){
                return "Present and Active";
            }else{
                return "Present and inactive";
            }
        }else{
            return "Doesn't exist";
        }
    }



}
