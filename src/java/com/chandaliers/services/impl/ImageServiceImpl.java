package com.chandaliers.services.impl;

import com.chandaliers.models.Chandelier;
import com.chandaliers.services.ImageService;
import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

@Service
@Transactional
public class ImageServiceImpl implements ImageService {

    public static final Logger LOG = Logger.getLogger(ImageServiceImpl.class);

    public static final String PATH_LOCAL_CHAN = "resources/img/chandelier/";
    public static final String GET_IMAGE_URL = "/image/chandalier/";
    public static final String BASE_URL = System.getProperty("catalina.home") + "/";
    //  System.getProperty("catalina.base");
    public static final String[] arrTypes = {"img", "png", "jpg", "jpeg"};

    @Override
    public boolean hasCorrectType(String contentType) {
        for (String type : arrTypes) {
            if (contentType.contains(type)) {
                return true;
            }
        }
        return false;
    }

    @Override
    public File createServerFile(String fileName) {
        File dir = new File(BASE_URL + PATH_LOCAL_CHAN);
        if (!dir.exists()) {
            dir.mkdirs();
        }
        File serverFile = new File(dir.getAbsolutePath() + File.separator + fileName);
        return serverFile;
    }

    @Override
    public String uploadImage(MultipartFile imgFile) {
        if (!imgFile.isEmpty() && hasCorrectType(imgFile.getContentType()))  {
            String fileName = imgFile.getOriginalFilename();
            File serverFile = createServerFile(fileName);
            writeDataToFile(serverFile, imgFile);
            return fileName;
        }
        return null;
    }

    @Override
    public boolean writeDataToFile(File serverFile, MultipartFile imgFile) {
        try (FileOutputStream stream = new FileOutputStream(serverFile)) {
            byte[] bytes = imgFile.getBytes();
            stream.write(bytes);
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    @Override
    public byte[] getImage(String filePath) throws IOException {
        if (!filePath.isEmpty()) {
            String path = BASE_URL + PATH_LOCAL_CHAN + filePath;
            return FileUtils.readFileToByteArray(FileUtils.getFile(path));
        }
        return null;
    }

    @Override
    public String generateImageUrl(Chandelier chandelier) {
        return GET_IMAGE_URL + chandelier.getArticle();
    }

}
