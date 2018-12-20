package com.rent.common;

import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.UUID;

@Component
public class ImageUpload {
    /**
     * 图片上传 upload; //文件 uploadContentType; //文件类型 uploadFileName; //文件名
     *
     * @return
     * @throws IOException
     */
    public String fileUpload(File upload, String uploadContentType,
                             String uploadFileName, HttpServletRequest request,
                             HttpServletResponse response) throws IOException {
        // HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        // CKEditor提交的很重要的一个参数
        String callback = request.getParameter("CKEditorFuncNum");
        String expandedName = ""; // 文件扩展名
        if (uploadContentType.equals("image/pjpeg")
                || uploadContentType.equals("image/jpeg")) {
            // IE6上传jpg图片的headimageContentType是image/pjpeg，而IE9以及火狐上传的jpg图片是image/jpeg
            expandedName = ".jpg";
        } else if (uploadContentType.equals("image/png")
                || uploadContentType.equals("image/x-png")) {
            // IE6上传的png图片的headimageContentType是"image/x-png"
            expandedName = ".png";
        } else if (uploadContentType.equals("image/gif")) {
            expandedName = ".gif";
        } else if (uploadContentType.equals("image/bmp")) {
            expandedName = ".bmp";
        } else {
            out.println("<script type=\"text/javascript\">");
            out.println("window.parent.CKEDITOR.tools.callFunction(" + callback
                    + ",''," + "'文件格式不正确（必须为.jpg/.gif/.bmp/.png文件）');");
            out.println("</script>");
            return null;
        }
        if (upload.length() > 600 * 1024) {
            out.println("<script type=\"text/javascript\">");
            out.println("window.parent.CKEDITOR.tools.callFunction(" + callback
                    + ",''," + "'文件大小不得大于600k');");
            out.println("</script>");
            return null;
        }
        InputStream is = new FileInputStream(upload);
        String uploadPath = request.getSession().getServletContext()
                .getRealPath("/img/uploadImg");
        String fileName = UUID.randomUUID().toString(); // 采用时间+UUID的方式随即命名
        fileName += expandedName;
        File file = new File(uploadPath);
        if (!file.exists()) { // 如果路径不存在，创建
            file.mkdirs();
        }
        File toFile = new File(uploadPath, fileName);
        OutputStream os = new FileOutputStream(toFile);
        byte[] buffer = new byte[1024];
        int length = 0;
        while ((length = is.read(buffer)) > 0) {
            os.write(buffer, 0, length);
        }
        is.close();
        os.close();

        // 返回"图像"选项卡并显示图片
        out.println("<script type=\"text/javascript\">");
        out.println("window.parent.CKEDITOR.tools.callFunction(" + callback
                + ",'" + "/img/uploadImg/" + fileName + "','')");
        out.println("</script>");
        return null;
    }
}
