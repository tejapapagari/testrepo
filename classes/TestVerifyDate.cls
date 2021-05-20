@isTest
public class TestVerifyDate {
@isTest static void testCheckDates(){
Date chDate = VerifyDate.CheckDates(date.today(),date.today().addDays(1));
system.assertEquals(date.today().addDays(1), chDate);
}
@isTest static void testCheckDatesForElse(){
Date date1=date.today();
Integer totalDays = Date.daysInMonth(date1.year(), date1.month());
Date lastDay = Date.newInstance(date1.year(), date1.month(), totalDays);
Date dateFlag = VerifyDate.CheckDates(lastDay,date.today().addDays(1));
system.assertEquals(lastDay, dateFlag);
}
}