# CoreDataCodeSnippets


//creating a protocol and pass context around


    protocol ContextProtocol {

        func receiveContext(_ incomingContext: NSManagedObjectContext)
    }
    
//to pass the protocol
          
     //1. in appDelegate (two ways)
          
        let contextProtocol = self.window?.rootViewController as! ContextProtocol
        contextProtocol.receiveContext(self.persistentContainer.viewContext)
                  
      //or acess directly          
                   
         mainView.receiveContext(self.persistentContainer.viewContext)
          
     
     
     //2. in ViewController
         vc.receiveContext(managedObjectContext)
    


//to use the protocol

    ViewController:UIVIewController,ContextProtocol {
        fileprivate var  managedObjectContext: NSManagedObjectContext!
        
         func receiveContext(_ incomingContext: NSManagedObjectContext){
            managedObjectContext = incomingContext
        }
    }
    
    
    
    
