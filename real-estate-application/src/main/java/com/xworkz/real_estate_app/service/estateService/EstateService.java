package com.xworkz.real_estate_app.service.estateService;

import com.xworkz.real_estate_app.dto.BiddDTO;
import com.xworkz.real_estate_app.dto.PropertyDTO;
import com.xworkz.real_estate_app.dto.UserDTO;

import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;

public interface EstateService {

    void validateAndSaveUser(UserDTO userDTO);

    UserDTO getUserByUserId(int userId);

    boolean emailIspresent(String email);

    boolean phoneIspresent(Long phoneNumber);

    boolean adhaarCount(Long adhaarNumber);

    boolean panIsPresent(String panNumber);

    boolean setOtpAndTimeForUserById(int userId, String otp, LocalDateTime time);

    UserDTO getUserByEmail(String email);

    boolean userIsActive(String email);

    UserDTO getUserInfoToUpdate(int userId);
    boolean updateUserInfoById(int userId,UserDTO user);
    void deleteUserById(int userId);


    /* ----------------------PROPERTY RELATED METHODS ------------------ */

    void validateAndSaveProperty( int userId,PropertyDTO propertyDTO);

    List<PropertyDTO> getAllPropertiesOtherThanUser(int userId);

    /* ------------------- BID A PROPERTY --------------------------*/

    void bidForAProperty(BiddDTO biddDTO,Integer propertyId,Integer userId);

}
