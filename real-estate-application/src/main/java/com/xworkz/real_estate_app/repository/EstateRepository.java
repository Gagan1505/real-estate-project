package com.xworkz.real_estate_app.repository;

import com.xworkz.real_estate_app.dto.BiddDTO;
import com.xworkz.real_estate_app.dto.PropertyDTO;
import com.xworkz.real_estate_app.dto.SoldBoughtDTO;
import com.xworkz.real_estate_app.dto.UserDTO;

import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;

public interface EstateRepository {

    boolean setOtpAndTimeForUserById(int userId, String otp, LocalDateTime time);

    UserDTO getUserById(int id);
    UserDTO getUserByEmail(String email);
    boolean saveUser(UserDTO userDTO);
    List<String> allEmails();
    List<Long> getAllPhones();
    Long adhaarCount(Long adhaarNumber);
    Long panCount(String panNumber);
    void setOtpCountForUser(int userId, int otp);
    int getUserOtpCount(String email);
    LocalDateTime getUserDeactivatedTime(String email);
    void setUserDeactivatedTime(int userId, LocalDateTime timeOfDeactivated);
    UserDTO getUserInfoToUpdateById(int userId);
    boolean updateUserInfoById(int userId,UserDTO user);
    void deleteUserInfo(int userId);

    /* -------------- PROPERTY METHODS ------------------*/

    void addProperty(int userId,PropertyDTO propertyDTO);

    List<PropertyDTO> getAllPropertiesToBid(int userId);


    // ------------------- BID THE PROPERTY ---------------
    void addBidForProperty(BiddDTO biddDTO, Integer propertyId, Integer userId);

    List<BiddDTO> getUserPropertiesToSell(Integer userId);

    void sellProperty(Integer bidId,Integer sellerId);

    List<SoldBoughtDTO> getPropertiesBoughtByUser(Integer userId);

    List<SoldBoughtDTO> getPropertiesSoldByUser(Integer userId);
}
