# AppDelegateCodeSnippets


#Most Basic rootViewController without storyboard
        
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
       
        window = UIWindow()
        window?.rootViewController = TabBarViewController()
        window?.makeKeyAndVisible()
        return true
    }



# AppDelegate: navigationController, coreData and Goolge banner Ads
//with navigationController, coreData and Goolge banner Ads

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        
        FIRApp.configure()
       
        GADMobileAds.configure(withApplicationID: adUnitID)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
       
        let nav = UINavigationController()
        let mainView = MainViewController(nibName: nil, bundle: nil)
        
        //let contextProtocol = self.window?.rootViewController as! ContextProtocol
        
        mainView.receiveContext(self.persistentContainer.viewContext)
        nav.viewControllers = [mainView]
        self.window!.rootViewController = nav1
        self.window?.makeKeyAndVisible()
 
        return true
    }
    
//context protocol example in CoreDataCodeSnippets


# AppDelegate: navigationController, Facebook,FireBase,Twistter login
    import UIKit
    import CoreData
    import Firebase
    import FBSDKCoreKit

    import GoogleSignIn

    import Fabric
    import TwitterKit

    @UIApplicationMain
    class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.rootViewController = MainTabBarController()
        
        //twitter
        Fabric.with([Twitter.self])

        //google sign in
        FIRApp.configure()
     
        GIDSignIn.sharedInstance().clientID = FIRApp.defaultApp()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
 
 
        //facebook sign in
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        return true
    }

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let err = error {
        print("Failed to log into Goolge",err)
        return
        }
        print("Sucessfully logged into Google", user)
        
        guard let idToken = user.authentication.idToken else {return}
        guard let accessToken = user.authentication.accessToken else { return }
      
        let credential = FIRGoogleAuthProvider.credential(withIDToken: idToken,
                                                          accessToken: accessToken)
        
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, err) in
            if err != nil {
                print("failed to create firbase user with google account: ",err ?? "")
                return
            }
            
            guard let uid = user?.uid else {return}
            print("Successfully logged into Firebase with Google", uid)
        })
    }
    
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {

        let handled = FBSDKApplicationDelegate.sharedInstance().application(app, open: url, sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as! String , annotation: options[UIApplicationOpenURLOptionsKey.annotation])
        
       GIDSignIn.sharedInstance().handle(url,
                                                 sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as! String,
                                                 annotation: options[UIApplicationOpenURLOptionsKey.annotation])
        

        
          return handled
        
    }
    

