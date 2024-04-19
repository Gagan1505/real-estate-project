package com.xworkz.real_estate_app.controller;

import com.xworkz.real_estate_app.dto.AuditDTO;
import com.xworkz.real_estate_app.dto.BiddDTO;
import com.xworkz.real_estate_app.dto.PropertyDTO;
import com.xworkz.real_estate_app.dto.UserDTO;
import com.xworkz.real_estate_app.service.estateService.EstateService;
import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Component
@SessionAttributes("userId")
@RequestMapping("/")
public class EstateController {

    private static final Logger logger = LogManager.getLogger(EstateController.class);
    @Autowired
    EstateService service;


    /* <---------- NEW USER REGISTER ----------> */
    @PostMapping("/register")//register
    public String registerUser(@Valid UserDTO userDTO, BindingResult bindingResult, Model model) {

        BasicConfigurator.configure();
        logger.info("Errors present in backend : {}"+bindingResult.hasErrors());
        System.err.println("Errors present in backend ----------- " + bindingResult.hasErrors());

        /*  TO RENDER THE SAME USER IF ERRORS OCCURRED */
        model.addAttribute("user", userDTO);

        if (bindingResult.hasErrors()) {
            List<ObjectError> errors = bindingResult.getAllErrors();

            /* TO DISPLAY ERRORS FROM BACKEND */
            model.addAttribute("errors", errors);
            return "userRegister";

        } else {
            service.validateAndSaveUser(userDTO);
            model.addAttribute("SuccessMsg", "Saved successfully -- Please login");
            return "userRegister";
        }
    }

    /*      ------------------GET USER INFO TO UPDATE  -----------------   */

    @GetMapping("/userToUpdate")
    public String getUserToUpdate(HttpServletRequest request,Model model){
        Integer userId = (Integer)request.getSession().getAttribute("userId");
        UserDTO user = service.getUserInfoToUpdate(userId);
        if(user != null){
            model.addAttribute("user",service.getUserInfoToUpdate(userId));
        }else{
            model.addAttribute("errMsg","Failed to fetch details ");
        }
        return "updateUserInfo";
    }

    /*   ---------------------- UPDATING THE RECORDS OF THE USER ----------------- */
    @PostMapping("/updateUser")
    public String updateUser(@Valid UserDTO userDTO, BindingResult bindingResult,Model model,HttpServletRequest request){
        /* ----------------- CHECK FOR VALID INPUTS -------------------------- */

        model.addAttribute("user",userDTO);

        if(bindingResult.hasErrors()){
            /*---------------------------- DISPLAYING ERRORS IN WEB PAGE ------------- */
            List<ObjectError> errors = bindingResult.getAllErrors();
            model.addAttribute("errors",errors);
            return "updateUserInfo";
        }else{
            AuditDTO audit = new AuditDTO();
            audit.setUpdatedBy(userDTO.getUserFirstName()+" "+userDTO.getUserLastName());
            audit.setUpdatedOn(LocalDateTime.now());
            userDTO.setAudit(audit);
            service.updateUserInfoById((Integer)request.getSession().getAttribute("userId"), userDTO);
            model.addAttribute("updateSuccessMsg","Updated successfully");
            return "userDashboard";
        }
    }

    @GetMapping("/delete")
    public RedirectView deleteUserInfo( Model model, HttpServletRequest req){
        RedirectView view = new RedirectView();
        Integer userId = (Integer) req.getSession().getAttribute("userId");
        service.deleteUserById(userId);
        model.addAttribute("deletedMsg","User Info Deleted Successfully");

        view.setUrl(req.getContextPath()+"userRegister.jsp");
        return view;
    }

    //------------------------------------------------------------

    @PostMapping("/userDashboard")
    public String returnToDashboard(@ModelAttribute UserDTO userDTO,Model model){
        model.addAttribute("user",userDTO);
        return "userDashboard";
    }

    /*  --------------------------- TO REDIRECT USER FROM DASHBOARD TO DASHBOARD ---------------------*/
    @GetMapping("/toDashboard")
    public RedirectView userFromDashboard(@RequestParam("id")Integer userId,Model model,HttpServletRequest request){
        UserDTO userDTO = service.getUserByUserId(userId);
        model.addAttribute("user",userDTO);
        RedirectView view = new RedirectView();
        view.setUrl(request.getContextPath()+"/userDashboard.jsp");
        return view;
    }

    @GetMapping("/detailsToAddProperty")
    public String getUserToAddProperty(@RequestParam("id")Integer userId,Model model){
        UserDTO userDTO = service.getUserByUserId(userId);
        model.addAttribute("user",userDTO);
        return "addProperty";
    }

    @PostMapping("/sell")
    public String addProperty(@Valid PropertyDTO propertyDTO,@RequestParam("id")Integer userId,BindingResult bindingResult,Model model){
        model.addAttribute("property",propertyDTO);
        model.addAttribute("user",service.getUserByUserId(userId));

        if(bindingResult.hasErrors()){
            /* ------------FOR RENDERING ERRORS -------------*/
            List<ObjectError> errors = bindingResult.getAllErrors();
            model.addAttribute("propertyErrors",errors);
            return "addProperty";
        }else{
            service.validateAndSaveProperty(userId,propertyDTO);
            model.addAttribute("success","successfully added property");
            return "userDashboard";
        }
    }

    @GetMapping("/estateProperties")
    public String getAllProperties(@RequestParam("id")Integer userId,Model model){
        System.err.println(userId);
        List<PropertyDTO> estates = service.getAllPropertiesOtherThanUser(userId);
        if(estates.isEmpty()){
            model.addAttribute("NOTHING","no properties present to display");
        }else{
            model.addAttribute("props",estates);
        }
        return "properties";
    }


    @GetMapping("/bidProperty")
    public String getPropertyToBid(HttpServletRequest request,@RequestParam("propertyId") Integer propertyId){
        HttpSession session = request.getSession();
        session.setAttribute("propertyId",propertyId);
        return "bid-property";
    }


    @PostMapping("/bid")
    public String bidProperty(HttpServletRequest request,BiddDTO biddDTO,Model model){
        HttpSession session = request.getSession();
        Integer propertyId = (Integer) session.getAttribute("propertyId");
        System.err.println("property id is ----- "+propertyId);
        Integer userId = (Integer)session.getAttribute("userId");
        System.err.println("user id is ----- "+userId);
        service.bidForAProperty(biddDTO,propertyId,userId);
        model.addAttribute("success","Success ");

        return "bid-property";
    }
}



