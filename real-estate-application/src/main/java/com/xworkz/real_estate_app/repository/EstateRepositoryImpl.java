package com.xworkz.real_estate_app.repository;

import com.xworkz.real_estate_app.dto.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

@Component
public class EstateRepositoryImpl implements EstateRepository{

    @Autowired
    EntityManagerFactory factory;

    public boolean saveUser(UserDTO userDTO) {
        boolean isSaved = false;
        EntityManager em = factory.createEntityManager();
        try{
            em.getTransaction().begin();
            userDTO.setRegisteredOn(LocalDateTime.now());
            userDTO.setUserDeactivatedTime(LocalDateTime.of(2000,1,1,0,0,0,0));
            userDTO.setOtpCount(0);
            System.out.println("time while saving new record -------------------------"+LocalTime.now());
            em.persist(userDTO);
            em.getTransaction().commit();
            isSaved = true;
        }catch (PersistenceException pe){
            System.err.println("Saving user failed : "+pe.getMessage());
            em.getTransaction().rollback();
        }finally{
            System.out.println("Save user finally block");
            em.close();
        }
        return isSaved;
    }

    public boolean setOtpAndTimeForUserById(int userId,String otp,LocalDateTime time){
        EntityManager em = factory.createEntityManager();
        boolean isUpdated = false;
        try {
            em.getTransaction().begin();
            UserDTO userDTO = em.find(UserDTO.class,userId);
            System.err.println("-------------------------------- otp is here ---------------------"+otp);
            userDTO.setUserOtp(otp);
            userDTO.setOtpTimeStamp(time);
            em.merge(userDTO);
            em.getTransaction().commit();
            isUpdated = true;
        }catch(Exception se){
            System.out.println("Error in updating user"+se.getMessage());
            em.getTransaction().rollback();
        }finally {
            System.out.println("update user otp by email");
            em.close();
        }
        return isUpdated;
    }

    @Override
    public UserDTO getUserById(int id) {
        EntityManager em = factory.createEntityManager();
        UserDTO userDTO = null;
        try{
            userDTO = em.find(UserDTO.class,id);
        }catch(PersistenceException pe){
            System.out.println("Error in finding user : "+pe.getMessage());
        }finally {
            em.close();
        }
        return userDTO;
    }

    @Override
    public UserDTO getUserByEmail(String email) {
        UserDTO userDTO = new UserDTO();

        EntityManager em = factory.createEntityManager();
        try{
            userDTO = (UserDTO) em.createNamedQuery("userByEmail").setParameter("email",email).getSingleResult();
        }catch(PersistenceException pe){
            System.out.println("Error in getting user info : "+pe.getMessage());
        }finally {
            em.close();
        }
        return userDTO;
    }

    public List<String> allEmails() {
        EntityManager em = factory.createEntityManager();
        List<String> emails = em.createNamedQuery("allEmails").getResultList();
        System.out.println(emails);
        return emails;
    }

    public List<Long> getAllPhones() {
        EntityManager em = factory.createEntityManager();
        System.out.println(em.createNamedQuery("allPhones").getResultList());
        return em.createNamedQuery("allPhones").getResultList();
    }

    public Long adhaarCount(Long adhaarNumber){
        EntityManager em = factory.createEntityManager();
        Query query = em.createNamedQuery("adhaarCount");
        query.setParameter("adhaar",adhaarNumber);
        Long count = (Long)query.getSingleResult();
        System.out.println("Adhaar count : "+count);
        return count;
    }

    public Long panCount(String panNumber){
        EntityManager em = factory.createEntityManager();
        Query query = em.createNamedQuery("panCount");
        query.setParameter("pan",panNumber);
        Long count = (Long)query.getSingleResult();
        System.out.println("Pan Count : "+count);
        return count;
    }

    @Override
    public void setOtpCountForUser(int userId, int otpCount) {
        EntityManager em = factory.createEntityManager();
        try{
            em.getTransaction().begin();
            UserDTO userDTO = em.find(UserDTO.class,userId);
            userDTO.setOtpCount(otpCount);
            em.merge(userDTO);
            System.out.println("Otp updated successfully -----------------------------");
            em.getTransaction().commit();
        }catch(PersistenceException pe){
            System.err.println("Error in updating otpCount"+pe.getMessage());
            em.getTransaction().rollback();
        }finally{
            System.err.println("setOtpCountForUser final ------------------- ");
            em.close();
        }
    }

    @Override
    public int getUserOtpCount(String email) {
        EntityManager em = factory.createEntityManager();
        int count = 0;

        try{
            count = (Integer)em.createNamedQuery("getUserOtpCount").setParameter("email",email).getSingleResult();
        }catch (NullPointerException ne){
            System.err.println("NE :              "+ne.getMessage());
        }
        finally {
            em.close();
        }
        return count;
    }

    @Override
    public LocalDateTime getUserDeactivatedTime(String email) {
        LocalDateTime time = null;
        EntityManager em = factory.createEntityManager();
        try{
            time = (LocalDateTime) em.createNamedQuery("getUserDeactivatedTime").setParameter("email",email).getSingleResult();
        }finally {
            em.close();
        }
        return time;
    }


    @Override
    public void setUserDeactivatedTime(int userId, LocalDateTime timeOfDeactivated) {
        EntityManager em = factory.createEntityManager();
        try{
            em.getTransaction().begin();
            UserDTO userDTO = em.find(UserDTO.class,userId);
            userDTO.setUserDeactivatedTime(timeOfDeactivated);
            em.merge(userDTO);
            em.getTransaction().commit();
            System.err.println("Deactivated time updated ---------------- successfully");
        }catch (PersistenceException pe){
            System.err.println("Error in updating the time -------------------- ");
            em.getTransaction().rollback();
        }finally {
            System.err.println("setUserDeactivatedTime finally block ----");
            em.close();
        }
    }

    @Override
    public UserDTO getUserInfoToUpdateById(int userId) {
        UserDTO userDTO = null;
        EntityManager em = factory.createEntityManager();
        try{
            userDTO = em.find(UserDTO.class,userId);
        }catch(PersistenceException pe){
            System.err.println("Error in finding the record"+pe.getMessage());
        }finally {
            em.close();
        }
        return userDTO;
    }

    @Override
    public boolean updateUserInfoById(int userId,UserDTO user) {
        boolean isUpdated = false;
        EntityManager em = factory.createEntityManager();
        try{
            AuditDTO audit = em.find(AuditDTO.class,userId);
            em.getTransaction().begin();
            Query query = em.createNamedQuery("updateUserById");
            query.setParameter("firstName",user.getUserFirstName());
            query.setParameter("lastName",user.getUserLastName());
            query.setParameter("email",user.getUserEmailId());
            query.setParameter("phone",user.getUserPhoneNumber());
            query.setParameter("adhaar",user.getUserAdhaar());
            query.setParameter("pan",user.getUserPanCard());
            query.setParameter("current",user.getUserCurrentAddress());
            query.setParameter("permanent",user.getUserPermanentAddress());
            query.setParameter("id",userId);
            query.executeUpdate();

            em.createNamedQuery("updateAudit").setParameter("ub",user.getAudit().getUpdatedBy())
                            .setParameter("uo",user.getAudit().getUpdatedBy())
                            .setParameter("id",userId)
                                    .executeUpdate();
            em.getTransaction().commit();
            isUpdated = true;
        }catch(PersistenceException pe){
            System.err.println("Error in updating the record"+pe.getMessage());
            em.getTransaction().rollback();
        }finally {
            em.close();
        }
        return isUpdated;
    }

    @Override
    public void deleteUserInfo(int userId) {
        EntityManager em = factory.createEntityManager();
        try{
            em.getTransaction().begin();
            em.createNamedQuery("deleteUserInfo").setParameter("userId",userId).executeUpdate();
            em.getTransaction().commit();
        }catch(PersistenceException pe){
            System.out.println("Error in deleteing the record : "+pe.getMessage());
            em.getTransaction().rollback();
        }finally{
            em.close();
        }
    }

    /* --------------------------- METHODS RELATED TO PROPERTY --------------------------------*/

    @Override
    public void addProperty(int userId,PropertyDTO propertyDTO) {
        EntityManager em = factory.createEntityManager();
        try {
            em.getTransaction().begin();
            System.err.println("User id in add property is : "+userId);
            UserDTO userDTO = em.find(UserDTO.class,userId);
            propertyDTO.setUser(userDTO);

            List<PropertyDTO> props = userDTO.getProperties();
            props.add(propertyDTO);
            userDTO.setProperties(props);
            em.persist(propertyDTO);

            em.getTransaction().commit();
        }catch(PersistenceException pe){
            System.err.println("Error in saving property Record");
            em.getTransaction().rollback();
        }finally{
            em.close();
        }
    }

    @Override
    public List<PropertyDTO> getAllPropertiesToBid(int userId) {
        EntityManager em = factory.createEntityManager();
        List<PropertyDTO> props = null;
        try{
            UserDTO user = em.find(UserDTO.class,userId);
            System.err.println("User Name in find of getAllProps is : --------------- "+user.getUserFirstName());
            props = em.createNamedQuery("getAllPropsToBid").setParameter("currUser",user).getResultList();
        }catch(PersistenceException pe){
            System.out.println("Error in finding properties details--- "+pe.getMessage());
        }finally {
            em.close();
        }
        return props;
    }

    @Override
    public void addBidForProperty(BiddDTO biddDTO, Integer propertyId, Integer userId) {
        EntityManager em = factory.createEntityManager();
        try{
            em.getTransaction().begin();
            PropertyDTO propertyDTO = em.find(PropertyDTO.class,propertyId);

            UserDTO user = em.find(UserDTO.class,userId);
            biddDTO.setUserBid(user);
            user.getBids().add(biddDTO);

            biddDTO.setProperty(propertyDTO);
            propertyDTO.getBids().add(biddDTO);

            em.persist(biddDTO);
            em.getTransaction().commit();
        }catch(PersistenceException pe){
            System.err.println("Error in saving bid entry");
            em.getTransaction().rollback();
        }finally {
            em.close();
        }

    }

    @Override
    public List<BiddDTO> getUserPropertiesToSell(Integer userId) {
        List<BiddDTO> bids = new ArrayList<>();
        EntityManager em = factory.createEntityManager();
        UserDTO user = em.find(UserDTO.class,userId);
        bids = em.createNamedQuery("getUserPropertiesToSell").setParameter("userId",user).getResultList();
        return bids;
    }

    @Override
    public void sellProperty(Integer bidId,Integer sellerId) {
        EntityManager em = factory.createEntityManager();

        try{
            em.getTransaction().begin();
            SoldBoughtDTO soldBoughtDTO = new SoldBoughtDTO();
            BiddDTO biddDTO = em.find(BiddDTO.class,bidId);
            UserDTO seller = em.find(UserDTO.class,sellerId);
            UserDTO buyer = em.find(UserDTO.class,biddDTO.getUserBid().getUserId());

            if(!biddDTO.getProperty().getPropertyStatus().equals("SOLD")){
                soldBoughtDTO.setProperty(biddDTO.getProperty());
                Integer propertyId = biddDTO.getProperty().getPropertyId();
                em.createNamedQuery("setPropertyStatus").setParameter("pId",propertyId).executeUpdate();
            }
            soldBoughtDTO.setBuyer(buyer);
            soldBoughtDTO.setBoughtOrSoldOn(LocalDateTime.now());
            soldBoughtDTO.setSeller(seller);
            soldBoughtDTO.setBid(biddDTO);


            em.persist(soldBoughtDTO);
            em.getTransaction().commit();
        }catch(PersistenceException pe){
            System.out.println("Error in saving new record : "+pe.getMessage());
            em.getTransaction().rollback();
        }finally {
            em.close();
        }
    }

    @Override
    public List<SoldBoughtDTO> getPropertiesBoughtByUser(Integer userId) {
        EntityManager em = factory.createEntityManager();
        List<SoldBoughtDTO> buyed = new ArrayList<>();
        try{
            UserDTO userDTO = em.find(UserDTO.class,userId);
            buyed = em.createNamedQuery("propertiesBuyedByUser").setParameter("buyer",userDTO).getResultList();
        }catch(PersistenceException pe){
            System.err.println("   --- "+pe.getMessage());
        }finally {
            em.close();
        }
        return buyed;
    }

    @Override
    public List<SoldBoughtDTO> getPropertiesSoldByUser(Integer userId) {
        EntityManager em = factory.createEntityManager();
        List<SoldBoughtDTO> sold = new ArrayList<>();
        try{
            UserDTO userDTO = em.find(UserDTO.class,userId);
            sold = em.createNamedQuery("propertiesSoldByUser").setParameter("seller",userDTO).getResultList();
        }catch (PersistenceException pe){
            System.out.println(" ------- "+pe.getMessage());
        }finally {
            em.close();
        }
        return sold;
    }
}
