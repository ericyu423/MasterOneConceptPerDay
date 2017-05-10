# stackViewCodeSnippets

//declare it first


    let stackView: [UIStackView] = {
         var sv = [UIStackView]()
          for i in 0...2 {
              let stackView = UIStackView()
              stackView.translatesAutoresizingMaskIntoConstraints = false
              stackView.distribution = .fillEqually
              stackView.axis = .horizontal
              stackView.spacing = 25
              stackView.backgroundColor = .red
              sv.append(stackView)
          }
          return sv
      }()
      
      
//use it: 3 rows each row contain 3 elements, autolayout is done after for loop

          boardView.addSubview(stackView[0])
          boardView.addSubview(stackView[1])
          boardView.addSubview(stackView[2])

          for i in 0...2 {
              for j in 0...2 {
                  stackView[i].addArrangedSubview(pView[j + (i * 3)])
              }  //(0,0),(0,1),(0,2),(1,3),(1,4),(1,5)...(2,8)
          }
      
      
      
      
