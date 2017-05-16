# Concept learned

//reference: https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/CoreAnimation_guide/BuildingaLayerHierarchy/BuildingaLayerHierarchy.html

1. By implementing the code below the View will not be able to resize with constraint

        override init(frame: CGRect){
            super.init(frame: frame)
            
            //draw method here
            
        }
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        
2. to resize with constraint use:

        override func draw(_ rect: CGRect) {
            //draw method here: this allow autolayout to resize the drawing
        }
# Two Ways to draw path CGPath VS. UIBezierPath

        var path: CGMutablePath = CGMutablePath() //or CGPath
        path.addEllipse(in: frame, transform: .identity)
        face.path = path  
        layer.addSublayer(face)
       
   //Is probably better to use UIBezierPath as it conforms to NSCoding
   
        var path = UIBezierPath(ovalIn: frame)
        face.path = path.cgPath  //have to covert UIBezierPath to cgPath so you can set it to CAShapeLayer
        layer.addSublayer(face)
        
        
# Two way to draw a circle UIBezierPath vs path.addArc       

          let fc = CGPoint(x: frame.width/2, y: frame.height/2)
          path.addArc(withCenter: fc , radius: frame.height/2.2, startAngle: CGFloat(-Double.pi*(2/4)),         
                                endAngle:CGFloat(Double.pi*(6/4)) , clockwise: true)
                                
                                //or
        
          path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
          
          
//2nd method is easier, however, if you want to animte the drawing 2nd method will always start from 3 o'clock moving clockwise



# frame vs bounds

 var path = UIBezierPath(ovalIn: bounds)
 var path = UIBezierPath(ovalIn: frame)
 
 //bounds is relative to it's own, frame is relative to super view
 //using the wrong one will lead to incomplete drawing



# Drawing Gradient 

for viewController follow the below pattern:

helper class

        public struct Gradient {
            let startColor: UIColor
            let endColor: UIColor
        }

        public extension CAGradientLayer {

            static func gradientLayer(with gradient: Gradient) -> CAGradientLayer {
                let gradientLayer = CAGradientLayer()
                gradientLayer.colors = [gradient.startColor.cgColor, gradient.endColor.cgColor]
                gradientLayer.startPoint = CGPoint(x: 0.5, y: 0);
                gradientLayer.endPoint = CGPoint(x: 0.5, y: 1);
                gradientLayer.locations = [0.4, 1];
                return gradientLayer
            }
        }


//In ViewController


     let gradientLayer: CAGradientLayer = {
        let s = UIColor(colorLiteralRed: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        
        let 3 = UIColor(colorLiteralRed: 255/255, green: 255/255, blue: 1255/255, alpha: 1)
        let gradient = Gradient(startColor: s, endColor: e)
        
        return CAGradientLayer.gradientLayer(with: gradient)
    }()

           override func viewDidLayoutSubviews() {
                super.viewDidLayoutSubviews()
                gradientLayer.frame = view.bounds
            }



            override func viewDidLoad() {
                super.viewDidLoad()
                view.layer.addSublayer(gradientLayer)
             }
             

# Gradient control views

        class RDProgressView: UIView {
            private let gradient : CAGradientLayer = CAGradientLayer()
            var percentageCompleted: NSNumber = 0.0 {
                willSet{
                    gradient.locations = [newValue,newValue]
                }
            }
            override func draw(_ rect: CGRect) {
                draw()
            }
            func draw(){
                self.layer.cornerRadius = 4
                self.layer.masksToBounds = true //need or corner will not show

                let blue = UIColor(colorLiteralRed: 78/255, green: 200/255, blue: 255/255, alpha: 1)
                let green = UIColor(colorLiteralRed: 200/255, green: 255/255, blue: 192/255, alpha: 1)
                
                let arrayColors: [AnyObject] = [blue.cgColor,green.cgColor]
                gradient.colors = arrayColors
                
                gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
                gradient.locations = [percentageCompleted, percentageCompleted]
                gradient.endPoint = CGPoint(x: 1, y: 0.5)
                self.layer.insertSublayer(gradient, at: 0)
            }

            override func layoutSublayers(of layer: CALayer) {
                super.layoutSublayers(of: layer)
                gradient.frame = self.bounds
            }

        }
        
        
<p align="center">
  <img src="https://github.com/ericyu423/drawingAndAnimating/blob/master/bi.png" width="400"/>  
</p>
        
        
        
 # style 2
 
        gradient.locations = [percentageCompleted, 1]
        
<p align="center">
  <img src="https://github.com/ericyu423/drawingAndAnimating/blob/master/true.png" width="400"/>
</p>
 
 

