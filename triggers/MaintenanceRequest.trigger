trigger MaintenanceRequest on Case (before update, after update) {
    // ToDo: Call MaintenanceRequestHelper.updateWorkOrders
        Map<Id,Case> csLst = new Map<Id,Case>();
    
    if(Trigger.isUpdate  && Trigger.isAfter){
        for(Case cs: Trigger.new){
            if (cs.IsClosed && (cs.Type.equals('Repair') || cs.Type.equals('Routine Maintenance'))){
                csLst.put(cs.Id, cs);
            }
        }
        if(csLst.size() > 0){
            MaintenanceRequestHelper.updateWorkOrders(csLst);    
        }        
    } 
}