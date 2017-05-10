# DelegateCodePatternSnippets



//declare protocol

    protocol UIPickerLauncherDelegate{
        func getDate(date: UIDatePicker)

    }
    class PickerClass {
       var delegate:UIPickerLauncherDelegate?
       
       
       
       delegate?.getDate(date: "stuff to be sent out") // this sent it out
       
       
    }
    
//implement it by 
//1. add Delegate 2. initialize Class. 3 set Delegate

        MyViewController: UIViewController, UIPickerLauncherDelegate {

             let upl = UIPickerLauncher()
            
             func viewDidLoad{
                upl.delegate = self
             }

            func getDate(date: String){
                //active when data is sent by parent
            }
        }
        
 //Do this so you don't need to set delegate in viewDidLoad

             lazy var upl: UIPickerLauncher = {
                  let pk = UIPickerLauncher
                  pk.delegate = self
                  return pk  
              }()
            
        
 


