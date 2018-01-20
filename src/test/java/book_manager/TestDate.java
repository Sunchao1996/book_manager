package book_manager;

import java.util.Date;

import org.junit.Test;

public class TestDate {
	@Test
	public void testDate(){
		Date date = new Date();
		Long time = date.getTime();
		Long afterTime = (long)(4*30*24*60*60)*(long)1000;
		Date afterDate = new Date(time+afterTime);
		System.out.println(afterDate.toLocaleString());
	}
}
