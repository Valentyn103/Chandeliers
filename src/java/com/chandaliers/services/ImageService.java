package com.chandaliers.services;

import com.chandaliers.models.Chandelier;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

public interface ImageService {
    boolean hasCorrectType(String contentType);

    File createServerFile(String fileName);

    String uploadImage(MultipartFile imgFile);

    boolean writeDataToFile(File serverFile, MultipartFile imgFile);

    byte[] getImage(String filePath) throws IOException;

    String generateImageUrl(Chandelier chandelier);
}
