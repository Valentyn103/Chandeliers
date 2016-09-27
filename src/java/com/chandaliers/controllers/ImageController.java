package com.chandaliers.controllers;

import com.chandaliers.services.ChandelierService;
import com.chandaliers.services.ImageService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.IOException;

/**
 * Controller for image manipulation
 */
@Controller
@RequestMapping(value = "image")
public class ImageController {

    public static final Logger LOG = Logger.getLogger(ImageController.class);

    public static final String SUCCESS = "Success";
    public static final String ERROR = "Error";
    public static final String SUCCESS_UPDLOAD_AVATAR = "Success. Avatar has been loaded.";
    public static final String FAILURE_UPDLOAD_AVATAR = "Failure. Avatar hasn't been loaded.";
    public static final String SUCCESS_DELETE = "Success. Avatar has been removed.";
    public static final String FAILURE_DELETE = "Failed. Avatar hasn't been removed.";

    @Autowired
    private ImageService imageService;

    @Autowired
    private ChandelierService chandelierService;


    @RequestMapping(value="chandalier/{article}", method = RequestMethod.GET)
    public  ResponseEntity<byte[]> getImage(@PathVariable("article") String article) {
        byte [] bytes = null;
        try {
            String fileName = chandelierService.getChandelierByArticle(article).getImage();
            bytes = imageService.getImage(fileName);
        } catch (IOException e) {
            return new ResponseEntity<>(bytes, HttpStatus.CONFLICT);
        }
        return new ResponseEntity<>(bytes, HttpStatus.OK);
    }

//    @RequestMapping(value="avatar", method = RequestMethod.DELETE)
//    @ResponseBody
//    public ResponseDTO deleteOwnAvatar() {
//        UserModel user = getCurrentUser();
//        ResponseDTO responseDTO = new ResponseDTO();
//        try {
//            user.setAvatar("");
//            userService.editUser(user);
//            responseDTO.setMessage(SUCCESS_DELETE);
//        } catch (Exception ex){
//            responseDTO.setMessage(FAILURE_DELETE);
//        }
//        return responseDTO;
//    }
//
//    @RequestMapping(value="avatar/{fileName:.+}", method = RequestMethod.GET)
//    @ResponseBody
//    public ResponseEntity<byte[]> getUserAvatar(@PathVariable String fileName) {
//        byte [] bytes = null;
//        try {
//            bytes = imageService.getImage(fileName);
//        } catch (IOException e) {
//            return new ResponseEntity<>(bytes, HttpStatus.CONFLICT);
//        }
//        return new ResponseEntity<>(bytes, HttpStatus.OK);
//    }
//
//    private UserModel getCurrentUser() {
//        final String currentUserLoginName = SecurityContextHolder.getContext().getAuthentication().getName();
//        return userService.getByLogin(currentUserLoginName);
//    }

}