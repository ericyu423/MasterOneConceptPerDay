# usefulProtocolExtensions

//shake view

    protocol Shakeable { }

    extension Shakeable where Self: UIView {

        func shake() {
            let animation = CABasicAnimation(keyPath: "position")
            animation.duration = 0.05
            animation.repeatCount = 5
            animation.autoreverses = true


            animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 4.0, y: self.center.y))
            animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 4.0,y: self.center.y))
            layer.add(animation, forKey: "position")
        }
    }
//move View with combination 

    protocol MoveAcross{}

    extension MoveAcross where Self: UIView{

        func Move(duration: TimeInterval, moveThis imageView: UIView,  moveInView containerView : UIView) {

            let animator = UIViewPropertyAnimator(duration: duration, curve: .easeInOut)

            animator.addAnimations {
                (containerView as! NinjaContainerView).moveNinjaToBottomRight()
            }

           animator.startAnimation()

        }
    }
    
# following class need to be re-written 

    public class NinjaContainerView: UIView,MoveAcross {


        //UIimage View with certain size
        public let ninja: UIImageView = {
            let image = UIImage(named: "ninja")
            let view = UIImageView(image: image)
            view.frame = CGRect(x: 0, y: 0, width: 45, height: 39)
            return view
        }()

        public override init(frame: CGRect) {
            // Animating view
            super.init(frame: frame)
            backgroundColor = UIColor.clear

            // Position ninja in the bottom left of the view
            ninja.center = {
                let x = (frame.minX + ninja.frame.width / 2)
                let y = (frame.maxY - ninja.frame.height / 2)
                return CGPoint(x: x, y: y)
            }()

            // Add image to the container
            addSubview(ninja)
           // backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)

        }

        required public init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        /// Moves the ninja view to the bottom right of its container, positioned just inside.
        public func moveNinjaToBottomRight() {
            ninja.center = {
                let x = (frame.maxX - ninja.frame.width / 2)   // end of x  - why frrame / 2
                let y = (frame.maxY - ninja.frame.height / 2)
                return CGPoint(x: x, y: y)
            }()
        }
    }

