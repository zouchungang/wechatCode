package com.rent.common.util;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * excel相关的操作类
 *
 * @author lgl
 * @time 2017-8-1
 */
public class HxExcelUtil {
    private static Logger logger = LoggerFactory.getLogger(HxExcelUtil.class);
    private static final int MEMORY_LIMIT_NUMBER = 100;//内存中存储的条数，超过这个条数，刷新到硬盘临时文件
    private static final int SHEET_LIMIT_NUMBER = 100000;//每个sheet中最大存储的数据量

    /**
     * @param fileName 导出文件的名称，最好是生产随机数
     * @param dataList 需要输出的数据，数据格式问List<Map<String,Object>>
     * @throws Exception
     */
    public static String export(String fileName, List<Map<String, Object>> dataList) throws Exception {

        PropertiesUtils propertiesUtils = new PropertiesUtils();
        //String xlsFile = propertiesUtils.getConfig("", "commonFiles") + "/" + UUID.randomUUID() + ".xlsx";//输出文件
        String xlsFile = propertiesUtils.getConfig("", "commonFiles") + "/" + fileName + ".xlsx";//输出文件
        //内存中只创建100个对象，写临时文件，当超过100条，就将内存中不用的对象释放。
        Workbook wb = new SXSSFWorkbook(MEMORY_LIMIT_NUMBER);//关键语句
        Sheet sheet = null;        //工作表对象
        Row nRow = null;        //行对象
        Cell nCell = null;        //列对象

        long startTime = System.currentTimeMillis();    //开始时间
        logger.info("strat execute time: " + startTime);

        int rowNo = 0; //总行号
        int pageRowNo = 0;//页行号
        for (Map<String, Object> map : dataList) {
            int currentSheet = rowNo % SHEET_LIMIT_NUMBER;//计算第几个sheet
            if (currentSheet == 0) { //打印${SHEET_LIMIT_NUMBER}条后切换到下个工作表，可根据需要自行拓展，2百万，3百万...数据一样操作，只要不超过1048576就可以
                logger.info("Current Sheet:" + currentSheet);
                sheet = wb.createSheet("第" + (currentSheet) + "个工作簿");//建立新的sheet对象
                sheet = wb.getSheetAt(currentSheet);//动态指定当前的工作表
                pageRowNo = 0;//每当新建了工作表就将当前工作表的行号重置为0
            }
            rowNo++;
            nRow = sheet.createRow(pageRowNo++);//新建行对象

            /**
             * 把map中的值处理成List，方便创建每行单元格（cell）
             */
            List<Object> list = new ArrayList<Object>();
            for (String key : map.keySet()) {
                list.add(map.get(key));
            }
            /**
             * 遍历输出数据到excel
             */
            for (int j = 0; j < list.size(); j++) {
                nCell = nRow.createCell(j);
                nCell.setCellValue(list.get(j) == null ? "" : list.get(j).toString());
            }
        }
        long finishedTime = System.currentTimeMillis();//处理完成时间
        logger.info("finished execute  time: " + (finishedTime - startTime) / 1000 + "m");
        FileOutputStream fOut = new FileOutputStream(xlsFile);//数据写入文件
        wb.write(fOut);//临时的excel写入文件中
        fOut.flush();//刷新缓冲区
        fOut.close();//关闭文件输出
        long stopTime = System.currentTimeMillis();//写文件时间
        logger.info("write xlsx file time: " + (stopTime - startTime) / 1000 + "m");
        return xlsFile;
    }


}
