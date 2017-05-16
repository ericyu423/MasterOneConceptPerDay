
//Notes from Stanford University iOS10 lecture 8

Multithreading:

  you want to divide up the execusion path of your program to difefrent and distinct paths
  that are "possibably" running at the same time.
  
  At the stand point of a programmer they are running at the same time, but in reality might be not,
  ex. single core processors. but OS will make them to look like they are by
  "time slicing" given each one a little bit of time to seem like they are running at the same time
  
  Purpose:
  Main Thread: (serial queue - processed in order)
          * where user is touching , we want this to be VERY responsive 
          * we never want to block this
          * we use it for synchronization (keep everythign in synch in the UI side)
          * for everything that is UI related
          * iOS is acturally drawing in other queus
  
  What could stop the Main Thread: 
          Network calls that is waiting for response, you button actually stop responding 
          and you can not do anythnig else, as if program is frozed
          
          
   Queues: blocks waiting to be executed
   
   
   Getting a queue
   
   
              let mainQueue = DispatchQueue.main

//they are indepenent can't depend on eachother
//they are not run series
//high priority only do something short and quick
              
              let backgroundQueue1 = DispatchQueue.global(qos: .userInteractive)
              
//high priority but might take a little bit of time
             
             let backgroundQueue2 = DispatchQueue.global(qos: .userInitiated)
             
//not directly initiated by user, so can run as slow as needed

              let backgroundQueue3 = DispatchQueue.global(qos: .background)
              
 //long-running background process,low priority
 //probalby for updates clean up stuff
 
              let backgroundQueue4 = DispatchQueue.global(qos: .utility)
              
Put the code in to the block by:

#  ASYNC - put in line wait for it and return immedately (so this pretty much does nothing except put it in queue)

***** WE ALMOST ALWAYS USE THIS ONE **********

              backgroundQueue1.async {
                  //code
              }
              
              
#  SYNC  -  put in queue, block this thread untill the the code is done executing

YOU WILL NEVER DO THIS ON MAIN QUEUE

              backgroundQueue2.sync {
                  //code
              }
              
   but what we can do is...for example we are on another thread
   
   we call mainQueue.sync {  //code }  and put the result back to main queue 
   but we won't know how long this takes








# Create your own queue -rarely use it (Serial)

          let serialQueue = DispatchQueue(abel: "MySerialQ")
          
 compare global:let gQ =     DispatchQueue.global(qos: .userInteractive)
   
 label show up in the debugger
 
 
 # Create your own queue concurrent
 
            let concurrentQueue = Dispatch(label: MyConcurrentQ", attributes: .concurrent)
            
            
            
 # Example multithreaded iOS API
       let session = NUSRLSession(configuration: .default)
       if let url = NSURL(string: "http://........") {
        let task = session.dataTask(with:url) {(data: Data?, reponse, error) in

                //i want to do UI thing here
                //with the data of the download

                DispatchQueue.main.async{

                  //do UI stuff here

                }
                
                print("do stuff with UI")

              }
              task.resume()
          }
  print(" print me")

timiing:
1. let session = URL
2. let task = session.dataTask(with:url) {(data: Data?, reponse, error) in }  //return immedately it only create data task
does not do anything it take in a non-escaping closure u just hold on to it

3. task resume()  this also return immediately  ......but on a different queue it start the fetch
4. print me out side the closure is next also happens immedately

5. now we start to do codes in the closure (before dispatch) this can take a very long time (big file)
    make sure we still care about this data
    
6. DispatchQueue, return immedaitly

7. inside Dispatch have not executed yet
   
   
      
  
