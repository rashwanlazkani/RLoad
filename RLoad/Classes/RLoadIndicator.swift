import Foundation
import UIKit

public class RLoadIndicator: UIView {
    private var bgPath: UIBezierPath!
    private var shapeLayer: CAShapeLayer!
    private var progressLayer: CAShapeLayer!
    private var timer: Timer!
    private var progressCounter: Float = 0
    private var progressIncrement: Float = 0.1
    
    public var colors: [UIColor] = [.black, .blue, .brown, .cyan, .green, .magenta, .orange, .purple, .red]
    public var progress: Float = 0 {
        willSet(value) {
            let rounded = String(format: "%.1f", value)
            if let newValue = Double(rounded) {
                if newValue.truncatingRemainder(dividingBy: 1) == 0 && newValue != 0.0 {
                    CATransaction.begin()
                    CATransaction.setDisableActions(true)
                    shapeLayer.strokeEnd = 1.0
                    shapeLayer.strokeColor = progressLayer.strokeColor
                    progressLayer.strokeEnd = -1.0
                    progressLayer.strokeColor = colors.randomElement()?.cgColor
                    CATransaction.commit()
                } else {
                    progressLayer.strokeEnd = CGFloat(value)
                }
            }
        }
    }
    
    public func create(x: CGFloat, y: CGFloat, radius: CGFloat, begin: Bool) {
        
        self.frame = CGRect(x: x, y: y, width: radius * 2, height: radius * 2)
        bgPath = UIBezierPath()
        
        if begin {
            start()
        }
    }
    
    public func start() {
        createShapes()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(showProgress), userInfo: nil, repeats: true)
    }
    
    public func stop() {
        timer.invalidate()
    }
    
    public func remove() {
        timer.invalidate()
        self.removeFromSuperview()
    }
    
    private func createCirclePath() {
        let x = self.frame.width / 2
        let y = self.frame.height / 2
        let center = CGPoint(x: x, y: y)
        bgPath.addArc(withCenter: center, radius: x/CGFloat(2), startAngle: CGFloat(0), endAngle: CGFloat(6.28), clockwise: true)
        bgPath.close()
    }
    
    private func createShapes() {
        createCirclePath()
        shapeLayer = CAShapeLayer()
        shapeLayer.path = bgPath.cgPath
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = nil
        shapeLayer.borderColor = UIColor.black.cgColor
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        progressLayer = CAShapeLayer()
        progressLayer.path = bgPath.cgPath
        progressLayer.lineWidth = 10
        //progressLayer.lineCap = .round
        progressLayer.fillColor = nil
        progressLayer.strokeColor = colors.randomElement()?.cgColor
        progressLayer.strokeEnd = 0.0
        self.layer.addSublayer(shapeLayer)
        self.layer.addSublayer(progressLayer)
    }
    
    @objc private func showProgress() {
        progressCounter = self.progress > 1.0 ? 0.0 : progressCounter + progressIncrement
        self.progress = progressCounter
        
    }
}

