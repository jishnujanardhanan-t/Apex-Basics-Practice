public class CreateTaskForAccount {
    
    public static List<Task> createTasks(Map<Id, Account> accMap, String billingState, String customerTier) {
        
        List<Id> accIds = new List<Id>();
        for (Account acc : accMap.values()) {
            if (acc.BillingState == billingState || acc.CustomerTier__c == customerTier) {
                accIds.add(acc.Id);
            }
        }
        
        Map<Id, Task> existingTasks = new Map<Id, Task>();
        List<Task> tasksList = [SELECT Id, WhatId FROM Task WHERE WhatId IN :accIds];
        for (Task taskRecord : tasksList) {
            existingTasks.put(taskRecord.WhatId, taskRecord);
        }
        
        List<Task> taskList = new List<Task>();
        for (Id accId : accIds) {
            if (!existingTasks.containsKey(accId)) {
                Task tasks = new Task();
                
                tasks.WhatId = accId;
                tasks.Subject = 'Follow-up';
                tasks.Status = 'Not Started';
                
                taskList.add(tasks);
            }
        }
        if(!taskList.isEmpty()) {
            insert taskList;
        }
        
        return taskList;
    }
}

/**Map<Id, Account> accMap = new Map<Id, Account>([SELECT Id, Name, BillingState, CustomerTier__c FROM Account LIMIT 5]);
List<Task> createdTasks = CreateTaskForAccount.createTasks(accMap, 'CA', 'Gold');
System.debug(createdTasks);*/