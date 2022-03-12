package com.dayan.servlet;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/news")
public class NewsServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 实例化模板对象
        Configuration configuration = new Configuration();
        // 设置加载模板的上下文 以及加载模板的路径 （模板存放路径）
        configuration.setServletContextForTemplateLoading(getServletContext(),"/template");
        // 设置模板的编码格式
        configuration.setDefaultEncoding("UTF-8");
        // 加载模板文件 获取模板对象
        Template template = configuration.getTemplate("news.ftl");

        // 设置数据模型
        Map<String,Object>  map = new HashMap<>();
        map.put("title","【战“疫”说理】良好的公民素养和国民心态是“硬核”力量");
        map.put("source","经济日报-中国经济网");
        map.put("pubTime","2020年03月16日 10:00");
        map.put("content","公共性的社会大事件，是检验和透视公民素养和国民心态的一个重要窗口。" +
                "在突袭而至的新冠肺炎疫情面前，一方面，抗击疫情的过程就是淬炼公民素养和国民心态的熔炉；另一方面，良好的公民素养和国民心态也是疫情防控的“硬核”力量，更是推动战“疫”积极向好态势不断拓展的精神之盾。\n" +
                "\n疫情防控，既是大战，也是大考。涵养良好的公民素养和国民心态，是疫情期间摆在我们面前的考题，同时也是提升国家治理能力过程中需要面对的课题。\n" +
                "\n着眼三个方面 提升科学素养\n\n疫情面前，每个人都是防控链条中的重要一环。做好自我保护，既是对自己、家人负责，也是对社会负责。有效做好科学防控，每个人都应具备必要的科学素养。");

        // 获取项目的根目录
        String basePath = req.getServletContext().getRealPath("/");
        // 设置html的存放路径
        File htmlFile = new File(basePath + "/html");
        // 判断文件（目录）是否存在
        if (!htmlFile.exists()) {
            // 如果文件目录不存在，则新建文件目录
            htmlFile.mkdir();
        }
        // 得到生成的文件名 （生成随机不重复的文件名）
        String fileName = System.currentTimeMillis() + ".html";
        // 创建html文件
        File file = new File(htmlFile,fileName);
        // 获取文件输出流
        FileWriter writer = new FileWriter(file);


        // 生成html （将数据模型填充到模板中）
        try {
            template.process(map,writer);
        } catch (TemplateException e) {
            e.printStackTrace();
        } finally {
            // 关闭资源
            writer.flush();
            writer.close();
        }
    }
}
