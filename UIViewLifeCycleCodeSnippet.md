# UIViewControllerLifeCycleCodeSnippets




//called during screen rotation
     
     
     
     override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
          super.viewWillTransition(to: size, with: coordinator)
          coordinator.animate(alongsideTransition: nil, completion: {
              _ in

              self.textView.resignFirstResponder()
          })

      }

//dispatch main Queue to get the new bound.size when screen is roated

        override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
             DispatchQueue.main.async() {
                 self.width = self.view.bounds.size.width
             }
         }

