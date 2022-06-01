package com.firstSpring.app.controller;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;

@Controller
@RequestMapping("image")
public class ImageController {
    @PostMapping("/upload")
    public String upload(HttpServletRequest request) {
//        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
//
//        if (isMultipart) { // enctype="multipart"인지 확인 ( 첨부파일 있는지 )
//            DiskFileItemFactory factory = new DiskFileItemFactory();
//            ServletFileUpload upload = new ServletFileUpload(factory);
//
//            try {
//                // parseRequest : [filename, StoreLocation, size, isFormField, FieldName]
//                List<FileItem> items = upload.parseRequest(request);
//
//                for(FileItem item : items) {
//                    if(!item.isFormField()) { // 필드타입 확인 (text,password,contents가 아닌것) > type="file"
//                        String fieldName = item.getFieldName(); // 태그 이름 ( name = "" )
//                        String fileName = item.getName(); // 첨부파일 이름
//                        long sizeInBytes = item.getSize(); // 파일 사이즈
//                        // IE기반 웹브라우저는 파일명에 경로가 추가되서 오기때문에 다음과 같이 처리
////                        fileName = fileName.substring(fileName.lastIndexOf("\\" + 1));
//
//                        if(!fileName.isEmpty()) {
//                            File file = new File("c:/upload/" + fileName);
//                            item.write(file); // 업로드된 파일을 지정한 경로에 저장
//                        }
//                    }
//                }
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        }
//        return null;

        boolean isMultipart = ServletFileUpload.isMultipartContent(request);

        if(isMultipart) {
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);

            try {
                List<FileItem> items = upload.parseRequest(request);

                for(FileItem item : items) {
                    if(!item.isFormField()) {
                        String fieldName = item.getFieldName();
                        String fileName = item.getName();
                        long sizeInBytes = item.getSize();

                        if(!fileName.isEmpty()) {
                            File file = new File("c:/upload/" + fileName);
                            item.write(file);
                        }
                    }
                }
            } catch(Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }
}
