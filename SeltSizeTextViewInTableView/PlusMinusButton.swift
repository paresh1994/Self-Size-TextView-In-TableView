import UIKit

@IBDesignable
class PlusMinusButton: UIButton {
    
    @IBInspectable
    var highlightColor: UIColor = .yellow { didSet { setNeedsDisplay() } }
    
    @IBInspectable
    var fillColor: UIColor = .yellow { didSet { setNeedsDisplay() } }
    
    @IBInspectable
    var strokeColor: UIColor = .yellow { didSet { setNeedsDisplay() } }
    
    @IBInspectable
    var plusOrMinus: Bool = true { didSet { setNeedsDisplay() } }
    
    
    func getPath() -> UIBezierPath {
        
        let G = bounds.width / 5
        
        let path = UIBezierPath()
        
        switch plusOrMinus {
            
        case true:
            
            let startPoint = CGPoint(x:2*G,y:G)
            path.move(to: startPoint)
            path.addLine(to: CGPoint(x:2*G,y:2*G))
            path.addLine(to: CGPoint(x:G,y:2*G))
            path.addLine(to: CGPoint(x:G,y:3*G))
            path.addLine(to: CGPoint(x:2*G,y:3*G))
            path.addLine(to: CGPoint(x:2*G,y:4*G))
            path.addLine(to: CGPoint(x:3*G,y:4*G))
            path.addLine(to: CGPoint(x:3*G,y:3*G))
            path.addLine(to: CGPoint(x:4*G,y:3*G))
            path.addLine(to: CGPoint(x:4*G,y:2*G))
            path.addLine(to: CGPoint(x:3*G,y:2*G))
            path.addLine(to: CGPoint(x:3*G,y:G))
            path.addLine(to: startPoint)
            
        case false:
            
            let startPoint = CGPoint(x:G,y:3*G)
            
            path.move(to: startPoint)
            path.addLine(to: CGPoint(x:4*G,y:3*G))
            path.addLine(to: CGPoint(x:4*G,y:2*G))
            path.addLine(to: CGPoint(x:G,y:2*G))
            path.addLine(to: startPoint)
            
        }
        
        path.close()
        
        return path
        
    }
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? highlightColor : UIColor.white
        }
    }
    
    override var isSelected: Bool {
        didSet {
            backgroundColor = isSelected ? UIColor.blue : UIColor.white
        }
    }
    
    
    override func draw(_ rect: CGRect) {
        
        let path = getPath()
        
        fillColor.setFill()
        
        path.fill()
        
        strokeColor.setStroke()
        
        path.stroke()
        
    }
}
