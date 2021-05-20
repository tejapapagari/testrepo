@isTest
public class MaintenanceRequestTest {
    
    @isTest
    public static void test()
    {
        List<Case> caseList = new List<Case>();
        Product2 product = new Product2();
        product.Cost__c = 50;
        product.Name = 'Test Product';
        product.Lifespan_Months__c = 8;
        product.Maintenance_Cycle__c = 365;
        product.Current_Inventory__c = 40;
        product.Replacement_Part__c = true;
        product.Warehouse_SKU__c = '100078';
        insert product;
        
        System.assertEquals(1, [SELECT count() FROM Product2 WHERE Name = 'Test Product']);
        
        for(Integer i=1;i<=300;i++) {
            Case caseNew = new Case();
            caseNew.Subject = 'Maintenance';
            caseNew.Type = 'Other';
            caseNew.Status = 'New';
            caseNew.Equipment__c = product.Id;
            caseList.add(caseNew);   
        }
        
        Test.startTest();
        
        insert caseList;
        System.assertEquals(300, [SELECT count() FROM Case WHERE Type = 'Other']);
        
        for(Case a : caseList){
            a.Type = 'Repair';
            a.Status = 'Closed';
        }
        update caseList;
        System.assertEquals(300, [SELECT count() FROM Case WHERE Type = 'Repair']);
        Test.stopTest();
        
    }

}