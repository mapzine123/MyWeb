package com.firstSpring.app.controller;

import com.firstSpring.app.domain.BoardDto;
import com.firstSpring.app.domain.CommentDto;
import com.firstSpring.app.domain.PageHandler;
import com.firstSpring.app.domain.SearchCondition;
import com.firstSpring.app.service.BoardService;
import com.firstSpring.app.service.CommentService;
import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Controller
@RequestMapping("board")
public class BoardController {
    @Autowired
    private BoardService boardService;
    @Autowired
    private CommentService commentService;

    @PostMapping("/write")
    public String writeBoard(HttpSession session, BoardDto boardDto, Model m) {
        try {
            boardDto.setBauthor((String)session.getAttribute("uid"));
            boardService.write(boardDto);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/board/boardList";
    }

    @GetMapping("/write")
    public String writeBoard(HttpSession session) {
        if(session.getAttribute("uid") == null) {
            return "loginForm";
        }
        return "boardWrite";
    }

    @GetMapping("/boardList")
    public String openBoard(SearchCondition sc, Model m) {
        try {
            int totalCnt = boardService.getSearchResultCnt(sc);
            PageHandler pageHandler = new PageHandler(totalCnt, sc);

            List<BoardDto> list = boardService.getSearchResultPage(sc);
            m.addAttribute("list", list);
            m.addAttribute("totalCnt", totalCnt);
            m.addAttribute("ph", pageHandler);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "boardList";
    }

    @GetMapping("/board")
    public String viewBoard(int bno, Model m) {
        try {
            BoardDto boardDto = boardService.viewBoard(bno);
            m.addAttribute("boardDto", boardDto);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "board";
    }

    @ResponseBody
    @PostMapping("/comment")
    public String writeComment(@RequestBody CommentDto comment, @RequestBody int bno, HttpSession session, Model m) {
        try {
            System.out.println("comment = " + comment);
            List<CommentDto> list = commentService.selectAll(bno);
            comment.setCommenter((String)session.getAttribute("uid"));
            list.add(comment);
            m.addAttribute("list", list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "sibal";
    }


    @GetMapping("/uploadImage")
    public String uploadImage() {
        return "imageTest";
    }

    @PostMapping("/upload")
    public String handleUpload(HttpServletRequest request) {
        try {
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);

            DiskFileItemFactory factory = new DiskFileItemFactory();
            factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
            factory.setSizeThreshold(DiskFileItemFactory.DEFAULT_SIZE_THRESHOLD);
            factory.setFileCleaningTracker(null);

            ServletFileUpload upload = new ServletFileUpload(factory);
            List items = upload.parseRequest(request);

            Iterator itr = items.iterator();
            while(itr.hasNext()) {
                FileItem item = (FileItem) itr.next();
                if(!item.isFormField()) {
                    try (
                    InputStream is = item.getInputStream();
                    OutputStream os = new FileOutputStream("file.mov");) {
                        IOUtils.copy(is, os);
                    }
                }
            }
            return "success!";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "error";
    }

    @PostMapping("/uploadImage")
    public String uploadImage(HttpServletRequest request) {
        try {
            String fileUploadPath = "C:\\\\upload";
            DiskFileUpload upload = new DiskFileUpload();

            List items = upload.parseRequest(request);

            Iterator params = items.iterator();
            while(params.hasNext()) {
                FileItem fileItem = (FileItem)params.next();
                if(!fileItem.isFormField()) {
                    String fileName = fileItem.getName();
                    fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
                    File file = new File(fileUploadPath + "/" + fileName);
                    fileItem.write(file);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
