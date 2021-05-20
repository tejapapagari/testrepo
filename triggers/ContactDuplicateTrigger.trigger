trigger ContactDuplicateTrigger on Contact (before insert) {
   for (Contact c : Trigger.new){
   
   
  
    String head = '<a href="'; 
    String fullFileURL = URL.getSalesforceBaseUrl().toExternalForm();  
    String last = '" target="_blank">Click here for duplicate record</a>'; 
      Contact[] contacts= [select id from Contact where AccountId= :c.AccountId and FirstName = :c.FirstName and LastName = :c.LastName and Email = :c.Email];
      
      if (contacts.size() > 0) {
          c.addError('Contact cannot be created - Contact already exists');
          
          
         // c.addError('ERROR : There is already an identical record: (https://ap15.salesforce.com/'+contacts[0].Id+')'); 
         
         
         c.addError('There is duplicated value. '  + head + fullFileURL + '/' + contacts[0].id + last, false);
         
         // c.addError('ERROR: There is already an identical record: <a href=\'<a href="https://ap15.salesforce.com/'" target="_blank" rel="nofollow">https://ap15.salesforce.com/'</a> + c.Number + '\'>Record Number ' + c.Number + '</a>';
      }    
   }
}