# TextViewCodeSnippets

//most used declarations

    lazy var textView: UITextView = {
          let tv = UITextView()
          tv.layer.borderWidth = 1
          tv.layer.cornerRadius = 1
          tv.textAlignment = .center
          tv.layer.borderColor = UIColor.orange.cgColor
          tv.backgroundColor = .clear
          tv.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
          tv.delegate = self
          self.automaticallyAdjustsScrollViewInsets = false
          tv.translatesAutoresizingMaskIntoConstraints = false

          return tv
     }()
 //useful textViewDelegate methods. In this example there are two layer views one provide placeholder
          
          func textViewDidChange(_ textView: UITextView) {
            if textView.text == "" {
                placeHolderText.isHidden = false
          }else{
               placeHolderText.isHidden = true
          }
        }

    
//custom Font example

    var placeHolderText: UITextView = {
        let tv = UITextView()
  
        
        let text = NSMutableAttributedString(string: "some sentance", 
                                             attributes: 
        [NSForegroundColorAttributeName: UIColor.lightGray,
         NSFontAttributeName: UIFont.systemFont(ofSize:UIFont.systemFontSize)])
        
        tv.attributedText = text
        return tv
    }()
    
    
 //touch outside to close keyboard
 
 
     override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
       self.view.endEditing(true)
        
        
    }
    
    
# TextView Animate TextBox


//use notification to keep track of keyboard 

    override func viewDidLoad() {
            super.viewDidLoad()

            NotificationCenter.default.addObserver(self, 
                            selector: #selector(moveKeyboardWillShowNotification(_:)),
                            name: NSNotification.Name.UIKeyboardWillShow, 
                            object: nil) 
            NotificationCenter.default.addObserver(self,
                            selector: #selector(moveKeyboardWillHideNotification(_:)), 
                            name:   NSNotification.Name.UIKeyboardWillHide, 
                            object: nil)

            NotificationCenter.default.addObserver(self, 
                            selector: #selector(adjustSubViews(_:)), 
                            name:   NSNotification.Name.UIKeyboardDidHide, 
                            object: nil)

        }
        deinit{
            NotificationCenter.default.removeObserver(self,
                                                      name: NSNotification.Name.UIKeyboardWillShow,
                                                      object: nil)

            NotificationCenter.default.removeObserver(self,
                                                      name: NSNotification.Name.UIKeyboardWillHide,
                                                      object: nil)
            NotificationCenter.default.removeObserver(self,
                                                      name: NSNotification.Name.UIKeyboardDidHide,
                                                      object: nil)
        }
        
//example in my TimeManger proj 
//constraint are set in code so it can be manipulated later on

        
        func moveKeyboardWillShowNotification(_ notification: Notification){
        
            let info = (notification as NSNotification).userInfo
            let keyframe = info![UIKeyboardFrameBeginUserInfoKey] as! NSValue
            let frameValue = keyframe.cgRectValue
            let heightOfKeyboard = keyboardHeight(frameValue)
            let height = view.frame.height - heightOfKeyboard + 20


            self.textViewBottomConstraint?.constant =  -height
            self.placeHolderBottomConstraint?.constant = -height
            self.imageViewBottomConstraint?.constant = -height


            self.textView.setNeedsDisplay()
            self.view.layoutSubviews()
        }
    
        func keyboardHeight(_ keyboardFrame:CGRect)->CGFloat{
            let iphoneView = UIViewController()
            return iphoneView.view.bounds.height -  keyboardFrame.height
        }

        func moveKeyboardWillHideNotification(_ notification: Notification){


            textViewBottomConstraint?.constant = textViewBottomConstraintConstant
            placeHolderBottomConstraint?.constant = placeHolderBottomConstraintConstant

            imageViewBottomConstraint?.constant = imageViewBottomConstraintConstant

            self.textView.setNeedsDisplay()
            self.view.layoutSubviews()
     }

