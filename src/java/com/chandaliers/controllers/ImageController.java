package com.chandaliers.controllers;

import com.chandaliers.services.ChandelierService;
import com.chandaliers.services.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.IOException;

@Controller
@RequestMapping(value = "image")
public class ImageController {
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
}