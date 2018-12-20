package com.rent.common.file.img;

import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.geometry.Positions;

import javax.imageio.ImageIO;
import java.io.File;
import java.io.IOException;

@SuppressWarnings("restriction")
public class ImageUtil {

    /**
     * 缩放图像（按高度和宽度缩放）不遵循原图比例
     *
     * @param srcImageFile 源图像文件地址
     * @param newImageFile 缩放后的图像地址
     * @param height       缩放后的高度
     * @param width        缩放后的宽度
     * @throws IOException
     */
    public final static void scaleForWithAndHeight(String srcImageFile, String newImageFile, int width, int height) throws IOException {
        Thumbnails.of(srcImageFile)
                .size(width, height)
                .toFile(newImageFile);
    }

    /**
     * 缩放图像（不遵循原图比例）
     *
     * @param srcImageFile 源图像文件地址
     * @param newImageFile 缩放后的图像地址
     * @param height       缩放后的高度
     * @param width        缩放后的宽度
     * @throws IOException
     */
    public final static void scaleForWithAndHeightForce(String srcImageFile, String newImageFile, int width, int height) throws IOException {
        Thumbnails.of(srcImageFile)
                .forceSize(width, height)
                .toFile(newImageFile);
    }

    /**
     * 按照比例系数缩放，放大缩小都可以
     *
     * @param srcImageFile 源图像文件地址
     * @param newImageFile 缩放后的图像地址
     * @param d            缩放比例系数
     * @throws IOException
     */
    public final static void scaleForProportion(String srcImageFile, String newImageFile, double d) throws IOException {
        Thumbnails.of(srcImageFile)
                .scale(d)
                .toFile(newImageFile);
    }

    /**
     * 添加图片水印
     *
     * @param targetImg 目标图片路径，如：C:\\myPictrue\\1.jpg
     * @param waterImg  水印图片路径，如：C:\\myPictrue\\logo.png
     * @param positions 水印图片所在位置
     * @param alpha     透明度(0.0 -- 1.0, 0.0为完全透明，1.0为完全不透明) * @param quality 压缩清晰度
     *                  <b>建议为1.0</b>
     * @throws IOException
     */
    public final static void pressImage(String targetImg, File waterImg, Positions positions, float alpha) throws IOException {
        Thumbnails.of(targetImg)
                .watermark(positions, ImageIO.read(waterImg), alpha)
                .scale(1)//缩放比例
                .toFile(targetImg);
    }

    /**
     * 把图片印刷到图片上
     *
     * @param pressImg  -- 水印文件
     * @param targetImg -- 目标文件
     * @param alpha     透明度(0.0 -- 1.0, 0.0为完全透明，1.0为完全不透明) * @param quality 压缩清晰度
     *                  <b>建议为1.0</b>
     * @throws IOException
     */
    public final static void pressImage(String targetImg, String pressImg, float alpha) throws IOException {
        Thumbnails.of(targetImg)
                .watermark(Positions.TOP_LEFT, ImageIO.read(new File(pressImg)), alpha)
                .outputQuality(1)//生成质量100%
                .scale(1)//缩放比例
                .toFile(targetImg);
    }

    /**
     * 把图片印刷到图片上
     *
     * @param pressImg  -- 水印文件
     * @param targetImg -- 目标文件
     * @param position
     * @param alpha     透明度(0.0 -- 1.0, 0.0为完全透明，1.0为完全不透明) * @param quality 压缩清晰度
     *                  <b>建议为1.0</b>
     * @throws IOException
     */
    public final static void pressImage(String targetImg, String pressImg, Positions position, float alpha) throws IOException {
        Thumbnails.of(targetImg)
                .watermark(position, ImageIO.read(new File(pressImg)), alpha)
                .outputQuality(1)//生成质量100%
                .scale(1)//缩放比例
                .toFile(targetImg);
    }

    /**
     * 裁剪图片
     *
     * @param sourceImg  原图片
     * @param newImgPath 生成的新图片
     * @param x          x轴
     * @param y          y轴
     * @param width      裁剪宽
     * @param height     裁剪高
     * @throws IOException
     */
    public static void region(String sourceImg, String newImgPath, int x, int y, int width, int height) throws IOException {
        //指定坐标
        Thumbnails.of(sourceImg)
                .sourceRegion(x, y, width, height)//x轴、y轴，裁剪宽、裁剪高
                .size(width, height)//裁剪后的图片生成的尺寸
                //设置是否按比例  false,图片可能会走形 默认true,必须在设置尺寸后设置
                .keepAspectRatio(false)
                .toFile(newImgPath);
    }

    /**
     * 旋转图片
     *
     * @param sourceImage 原图片
     * @param newImage    生成的新图片
     * @param degrees     旋转度数
     * @throws IOException
     */
    public static void rorate(String sourceImage, String newImage, double degrees) throws IOException {
        Thumbnails.of(sourceImage)
                .rotate(degrees)//旋转度数
                .scale(1)//缩放比例
                .toFile(newImage);
    }

    /**
     * 转换图片格式
     *
     * @param sourceImg 原图
     * @param newImg    转换后的新图
     * @param format    格式
     * @throws IOException
     */
    public static void transferImageFormat(String sourceImg, String newImg, String format) throws IOException {
        Thumbnails.of(sourceImg)
                .outputFormat(format)
                .scale(1)
                .toFile(newImg);
    }

    /**
     * 压缩图片
     *
     * @param sourceImg 原图
     * @param newImg    压缩后的新图
     * @throws IOException
     */
    public static void zipImage(String sourceImg, String newImg) throws IOException {
        //图片尺寸不变，压缩图片文件大小outputQuality实现,参数1为最高质量
        Thumbnails.of(sourceImg).scale(1f).outputQuality(0.25f).toFile(newImg);
    }

    public static void main(String[] args) {
        try {
            //ImageUtil2.scale("C:\\Users\\chengjiangbo\\Desktop\\images\\c743d228-3ecf-4711-9187-725f252d14b1.jpg", "C:\\Users\\chengjiangbo\\Desktop\\images\\480_300.jpg", 480, 300, true, false);
            //ImageUtil2.pressImage("C:\\Users\\chengjiangbo\\Desktop\\images\\IMG_waterImage.jpg", "C:\\Users\\chengjiangbo\\Desktop\\images\\QRCode.png",Positions.BOTTOM_CENTER, 1);
            //ImageUtil2.region("C:\\Users\\chengjiangbo\\Desktop\\images\\IMG_waterImage.jpg", "C:\\Users\\chengjiangbo\\Desktop\\images\\IMG_waterImage123.jpg",0,0,100,100);
            //ImageUtil2.rorate("C:\\Users\\chengjiangbo\\Desktop\\images\\IMG_waterImage.jpg", "C:\\Users\\chengjiangbo\\Desktop\\images\\IMG_waterImage111.jpg", 90);
            ImageUtil.transferImageFormat("C:\\Users\\chengjiangbo\\Desktop\\images\\QRCode.png", "C:\\Users\\chengjiangbo\\Desktop\\images\\QRCode.jpg", "JPEG");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}