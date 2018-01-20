package com.bl.service.impl;

import java.text.SimpleDateFormat;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bl.beans.bo.BookInfo;
import com.bl.service.BookService;
@RunWith(SpringJUnit4ClassRunner.class) 
@ContextConfiguration({"classpath:resource/dispatcherServlet.xml","classpath:resource/applicationContext.xml","classpath:resource/mybatis.xml"}) 
public class MainServiceImplTest {
	@Autowired
	BookService service;
	private Log logger = LogFactory.getLog(getClass());
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
	@Test
	public void testGetBookIntoTime() {
		String category = "I";
		String[] arrBarcode = {"9787201094014","9787535482051","9787535488473"};
		String[] arrTitle = {"浮生六记 ","孤独是生命的礼物","自在独行：贾平凹的独行世界 "};
		String[] arrAuthor = {"沈复","余光中，林清玄，白先勇 等","贾平凹"	};
		String[] arrPress = {"天津人民出版社","长江文艺出版社","长江文艺出版社"};
		String[] arrPublish = {"2015/08/01 ","2017/03/01","2016/06/01"};
		Double[] arrPrice = {15.7,25.9,26.5};
		try{
			for(int i = 10;i<13;i++){
				BookInfo book = new BookInfo();
				book.setBookCategoryId(category);
				book.setBookBarCode(arrBarcode[i-10]);
				book.setBookISBN(arrBarcode[i-10]);
				book.setBookTitle(arrTitle[i-10]);
				book.setBookAuthor(arrAuthor[i-10]);
				book.setBookPress(arrPress[i-10]);
				book.setBookPublish(sdf.parse(arrPublish[i-10]));
				book.setBookPrintCount(1);
				book.setBookPrice(arrPrice[i-10]);
				int count = service.insert(book);
				if(count == -1){
					logger.info("失败");
				}else if(count < 3){
					logger.info("失败");
				}else{
					logger.info("成功");
				}	
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
