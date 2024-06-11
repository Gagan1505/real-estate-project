package com.xworkz.real_estate_app.service.estateService;

import com.xworkz.real_estate_app.dto.*;
import com.xworkz.real_estate_app.repository.EstateRepository;
import com.xworkz.real_estate_app.service.mailService.MailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

@Component
public class EstateServiceImpl implements EstateService {

    @Autowired
    EstateRepository repository;

    @Autowired
    MailService mailService;

    public void validateAndSaveUser(UserDTO userDTO) {
        AuditDTO audit = new AuditDTO();
        audit.setCreatedBy(userDTO.getUserFirstName()+" "+userDTO.getUserLastName());
        audit.setCreatedOn(LocalDateTime.now());
        userDTO.setAudit(audit);
        if(repository.saveUser(userDTO)){
            mailService.welcomeMail(userDTO);
        }
    }

    @Override
    public UserDTO getUserByUserId(int userId) {
        return repository.getUserById(userId);
    }

    public boolean emailIspresent(String email) {
        boolean isPresent = false;
        for(String s : repository.allEmails()){
            if(s.equals(email)) {
                isPresent = true;
                break;
            }
        }
        return isPresent;
    }

    public boolean phoneIspresent(Long phoneNumber) {
        boolean isPresent = false;
        for(Long l : repository.getAllPhones()){
            System.out.println(l+"  "+phoneNumber);
            if(l.equals(phoneNumber)){
                isPresent = true;
                break;
            }
        }
        return isPresent;
    }

    public boolean adhaarCount(Long adhaarNumber){
        if(repository.adhaarCount(adhaarNumber)!=0l){
            return true;
        }else{
            return false;
        }

    }

    public boolean panIsPresent(String panNumber) {
        if(repository.panCount(panNumber.toLowerCase())!=0l)
            return true;
        else
            return false;
    }

    public boolean setOtpAndTimeForUserById(int userId,String otp,LocalDateTime time) {
        return repository.setOtpAndTimeForUserById(userId,otp,time);
    }

    @Override
    public UserDTO getUserByEmail(String email) {
        return repository.getUserByEmail(email);
    }

    @Override
    public boolean userIsActive(String email) {
        boolean isActive = false;
        UserDTO userDTO = this.getUserByEmail(email);
        try {
            LocalDateTime deactivatedTime = repository.getUserDeactivatedTime(email);
            System.err.println("Deactivated time is --------------- in user active --------- "+deactivatedTime);
            LocalDateTime enteredTime = LocalDateTime.now();

            int userId = userDTO.getUserId();
            if (enteredTime.isAfter(deactivatedTime.plusMinutes(1))) {
                repository.setUserDeactivatedTime(userDTO.getUserId(),LocalDateTime.of(2000,1,1,0,0,0,0));
                isActive = true;
            }else{
                isActive = false;
            }
        }catch(NullPointerException ne){
            System.err.println(""+ne.getMessage());
        }
        return isActive;
    }

    @Override
    public UserDTO getUserInfoToUpdate(int userId) {
        UserDTO userDTO = repository.getUserInfoToUpdateById(userId);
        return userDTO;
    }

    @Override
    public boolean updateUserInfoById(int userId, UserDTO user) {
        return repository.updateUserInfoById(userId,user);
    }

    @Override
    public void deleteUserById(int userId) {
        repository.deleteUserInfo(userId);
    }


    /* --------------------------- PROPERTY METHODS ----------------------- */

    @Override
    public void validateAndSaveProperty( int userId,PropertyDTO propertyDTO) {
        propertyDTO.setPropertyStatus("FOR-SALE");
        repository.addProperty(userId,propertyDTO);
    }

    @Override
    public List<PropertyDTO> getAllPropertiesOtherThanUser(int userId) {
        List<PropertyDTO> properties = new ArrayList<>();
        for(PropertyDTO prop: repository.getAllProperties(userId)){
            if(!prop.getPropertyStatus().equals("SOLD") && prop != null){
                properties.add(prop);
            }
        }
        return properties;
    }

    @Override
    public void bidForAProperty(BiddDTO biddDTO, Integer propertyId, Integer userId) {
        repository.addBidForProperty(biddDTO,propertyId,userId);

    }

    @Override
    public List<BiddDTO> getAllUserPropertiesToSell(Integer userId) {
        return repository.getUserPropertiesToSell(userId);
    }

    @Override
    public void sellProperty(Integer bidId, Integer sellerId) {
        repository.sellProperty(bidId,sellerId);
    }

    @Override
    public List<SoldBoughtDTO> getPropertiesBoughtByUser(Integer userId) {
        return repository.getPropertiesBoughtByUser(userId);
    }

    @Override
    public List<SoldBoughtDTO> getPropertiesSoldByUser(Integer userId) {
        return repository.getPropertiesSoldByUser(userId);
    }
}
