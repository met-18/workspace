package com.utils.pdftoword;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;

import java.io.*;

public class Pdf2word {
    public static void main(String[] args) {
        try {
            String pdfFile = "E:\\tmp\\pdf\\4.8+2021年第14周“智慧交通”监测分析统计表.pdf";
            PDDocument doc = PDDocument.load(new File(pdfFile));
            int pagenumber = doc.getNumberOfPages();
            pdfFile = pdfFile.substring(0, pdfFile.lastIndexOf("."));
            String fileName = pdfFile + ".doc";
            File file = new File(fileName);
            if (!file.exists()) {
                file.createNewFile();
            }
            FileOutputStream fos = new FileOutputStream(fileName);
            Writer writer = new OutputStreamWriter(fos, "UTF-8");
            PDFTextStripper stripper = new PDFTextStripper();
            stripper.setSortByPosition(true);// 排序
            stripper.setStartPage(1);// 设置转换的开始页
            stripper.setEndPage(pagenumber);// 设置转换的结束页
            stripper.writeText(doc, writer);
            writer.close();
            doc.close();
            System.out.println("pdf转换word成功！");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}