package not_yet;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Locale;

public class 서울_2반_송다은_Collection {

	public static void main(String[] args) {
		
		// 현재 연도, 월 구하기
		Calendar calendar = new GregorianCalendar(Locale.KOREA);
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH);
		int days = 0;
		
		// 해당 월을 일 구하기
		int[] Days = {31,28,31,30,31,30,31,31,30,31,30,31};
		
		// 윤달 구하기
		if(month==1 && (year%400 == 0 || (year%4 == 0 && year%100 != 0)))
		    days = 29;
		else 
			days = Days[month];
		
		
		System.out.println(days + " days for " + year + "-" + (month+1));
		
	}
}
