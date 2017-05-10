# UIViewCodeSnippets


//view can later be identified with .tag

      lazy var pView:[gamePieceView] = {
          var v = [gamePieceView]()
          for i in 0...8 {
              var bt = gamePieceView()
              bt.backgroundColor = .clear
              bt.tag = i
              bt.isUserInteractionEnabled = true
              bt.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapped)))
              bt.clearsContextBeforeDrawing = true

              v.append(bt)
          }
          return v
      }()
   
 //find view tapped by sender.view!.tag
   
      func handleTapped (_ sender: UITapGestureRecognizer){
          print((sender.view!).tag)

      }
