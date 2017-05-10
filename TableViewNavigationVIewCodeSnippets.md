# TabViewNavigationVIewCodeSnippets



// 2 views embed in TabBar
// 1 view as a rootView of Navbar
// 1 view is just a regular view
// -> appDelegate ->  window?.rootViewController = TabBarViewController() -> viewControllers = [UIView1,UIView2]



    class TabBarViewController: UITabBarController {
        let nc0: UIViewController = {
            let nc = MainViewController()
            return nc

        }()

        let nc1: UINavigationController = {
            let nc = UINavigationController(rootViewController: SessionViewController())
            nc.tabBarItem.image = #imageLiteral(resourceName: "profile_unselected").withRenderingMode(.alwaysOriginal)
            nc.tabBarItem.selectedImage = #imageLiteral(resourceName: "profile_selected").withRenderingMode(.alwaysOriginal)
            return nc
        }()

        override func viewDidLoad() {
            super.viewDidLoad()

            view.backgroundColor = .white



            viewControllers = [nc0,nc2]
        }

    }
    
    
// start off with Navigation Controller in appDelegate


        window = UIWindow()
        let navigation = UINavigationController()
        let mainView = MainViewController()

        navigation.viewControllers = [mainView]  //embed MainView in to navigationController
        
        self.window!.rootViewController = navigation //set the navigationController as your rootView
         window?.makeKeyAndVisible()
        return true
