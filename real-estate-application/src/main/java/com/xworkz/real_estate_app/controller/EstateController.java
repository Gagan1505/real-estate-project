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
    public String getUserToUpdate(HttpSession session,Model model){
        Integer userId = (Integer)session.getAttribute("userId");
        if(userId != null){
            UserDTO user = service.getUserInfoToUpdate(userId);
            model.addAttribute("user",user);
            return "updateUserInfo";
        }else{
            model.addAttribute("loginErr","Please login");
            return "index";
        }

    }

    /*   ---------------------- UPDATING THE RECORDS OF THE USER ----------------- */
    @PostMapping("/updateUser")
    public String updateUser(@Valid UserDTO userDTO, BindingResult bindingResult,Model model,HttpSession session){
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
            Integer userId = (Integer)session.getAttribute("userId");
            System.err.println(userId);
            service.updateUserInfoById(userId, userDTO);
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
    public String userFromDashboard(Model model,HttpSession session,HttpServletRequest request){
        Integer userId = (Integer) session.getAttribute("userId");
        System.err.println("User id in to Dashboard : >>>>>>>>>>>>>>>>>>>>>>> ----- "+userId);
        UserDTO userDTO = service.getUserByUserId(userId);
        model.addAttribute("user",userDTO);
        return "userDashboard";
    }

    @GetMapping("/detailsToAddProperty")
    public String getUserToAddProperty(HttpSession session,Model model){
        Integer userId = (Integer)session.getAttribute("userId");
        if(userId != null){
            UserDTO userDTO = service.getUserByUserId(userId);
            model.addAttribute("user",userDTO);
            return "addProperty";
        }else{
            model.addAttribute("loginErr","Please login");
            return "index";
        }

    }

    @PostMapping("/sell")
    public String addProperty(@Valid PropertyDTO propertyDTO,BindingResult bindingResult,Model model,HttpSession session){
        model.addAttribute("property",propertyDTO);
        Integer userId = (Integer)session.getAttribute("userId");
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
    public String getAllProperties(HttpSession session,Model model){
        Integer userId = (Integer) session.getAttribute("userId");
        System.out.println(userId+"   ----------------------------- user Id is  -------------");
        if(userId != null){
            List<PropertyDTO> estates = service.getAllPropertiesOtherThanUser(userId);
            System.err.println("------------------------------------------------------------"+estates);
            if(estates.isEmpty()){
                model.addAttribute("NOTHING","no properties present to display");
            }else{
                model.addAttribute("props",estates);
                for(PropertyDTO p:estates){
                    System.err.println("IN ESTATE PROPS "+p);
                }
            }
            return "properties";
        }else{
            model.addAttribute("loginErr","Please login");
            return "index";
        }
    }


    @GetMapping("/bidProperty")
    public String getPropertyToBid(HttpSession session,@RequestParam("propertyId") Integer propertyId){
        session.setAttribute("propertyId",propertyId);
        return "bid-property";
    }


    @PostMapping("/bid")
    public String bidProperty(HttpSession session,BiddDTO biddDTO,Model model){
        Integer propertyId = (Integer) session.getAttribute("propertyId");
        System.err.println("property id is ----- "+propertyId);
        Integer userId = (Integer)session.getAttribute("userId");
        System.err.println("user id is ----- "+userId);
        service.bidForAProperty(biddDTO,propertyId,userId);
        model.addAttribute("success","Success ");
        return "bid-property";
    }

    @GetMapping("/propertiesToSell")
    public String getUserPropertiesToSell(HttpSession session,Model model){
        Integer userId = (Integer) session.getAttribute("userId");
        if(userId != null){
            System.err.println("User Id in propertiesToSell is : "+userId);
            List<BiddDTO> bidsList = service.getAllUserPropertiesToSell(userId);
            model.addAttribute("bids",bidsList);
            return "userProperties";
        }else{
            model.addAttribute("loginErr","Please login");
            return "index";
        }
    }

    @GetMapping("/sellProperty")
    public String sellProperty(@RequestParam("bidId")Integer bidId,HttpSession session,Model model){
        Integer sellerId = (Integer) session.getAttribute("userId");
        service.sellProperty(bidId,sellerId);
        model.addAttribute("SellSuccess","Successsfully Sold property");
        return "userProperties";
    }


    // ----------------- BOUGHT PROPERTIES ----------------
    @GetMapping("/bought")
    private String propertiesBoughtByUser(Model model,HttpSession session){
        Integer userId = (Integer) session.getAttribute("userId");
        model.addAttribute("buyedProps",service.getPropertiesBoughtByUser(userId));
        return "propertiesBought";
    }


    // ------------SOLD PROPERTIES ---------------------
    @GetMapping("/sold")
    private String propertiesSoldByUser(Model model,HttpSession session){
        Integer userId = (Integer) session.getAttribute("userId");
        if(userId != null){
            model.addAttribute("soldProps",service.getPropertiesSoldByUser(userId));
            return "propertiesSold";
        }else{
            model.addAttribute("loginError","Please Login Again");
            return "index";
        }
    }


    @GetMapping("/logout")
    public String userLogout(HttpSession session){
        session.invalidate();
        return "index";
    }


}



