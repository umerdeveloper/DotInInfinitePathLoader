import CoreGraphics
import UIKit

class DotInfinitePathLoader: UIView {
    
    let standardPaddingSize: CGFloat = 64
    let lineSize: CGFloat = 24
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let radius = (min(frame.width, frame.height) - 2 * standardPaddingSize) / 2
        
        // MARK: - Left half top circle
        let leftTopPath = UIBezierPath(
            arcCenter: CGPoint(
                x: frame.minX + radius + lineSize / 2,
                y: frame.midY),
            radius: radius,
            startAngle: 3.14159,
            endAngle: 0,
            clockwise: true
        )

        let leftTopPathLayer = CAShapeLayer()
        leftTopPathLayer.lineWidth = lineSize
        leftTopPathLayer.fillColor = UIColor.clear.cgColor
        leftTopPathLayer.strokeColor = UIColor.systemBlue.withAlphaComponent(0.2).cgColor
        leftTopPathLayer.path = leftTopPath.cgPath
        
        // MARK: - Right bottom half circle
        let bottomRightPath = UIBezierPath(
            arcCenter: CGPoint(
                x: frame.midX + radius + lineSize / 2,
                y: frame.midY),
            radius: radius,
            startAngle: 3.14159,
            endAngle: 0,
            clockwise: false
        )
        
        let bottomRightPathLayer = CAShapeLayer()
        bottomRightPathLayer.lineWidth = lineSize
        bottomRightPathLayer.fillColor = UIColor.clear.cgColor
        bottomRightPathLayer.strokeColor = UIColor.systemBlue.withAlphaComponent(0.2).cgColor
        bottomRightPathLayer.path = bottomRightPath.cgPath
        
        // MARK: - Right top half circle
        let rightTopPath = UIBezierPath(
            arcCenter: CGPoint(
                x: frame.midX + radius + lineSize / 2,
                y: frame.midY),
            radius: radius,
            startAngle: 0,
            endAngle: 3.14159,
            clockwise: false
        )
        
        let rightTopPathLayer = CAShapeLayer()
        rightTopPathLayer.lineWidth = lineSize
        rightTopPathLayer.fillColor = UIColor.clear.cgColor
        rightTopPathLayer.strokeColor = UIColor.systemBlue.withAlphaComponent(0.2).cgColor
        rightTopPathLayer.path = rightTopPath.cgPath
        
        // MARK: - Left bottom  half circle
        let leftBottomPath = UIBezierPath(
            arcCenter: CGPoint(
                x: frame.minX + radius + lineSize / 2,
                y: frame.midY),
            radius: radius,
            startAngle: 0,
            endAngle: 3.14159,
            clockwise: true
        )
        
        let leftBottomLayer = CAShapeLayer()
        leftBottomLayer.lineWidth = lineSize
        leftBottomLayer.fillColor = UIColor.clear.cgColor
        leftBottomLayer.strokeColor = UIColor.systemBlue.withAlphaComponent(0.2).cgColor
        leftBottomLayer.path = leftBottomPath.cgPath

        // Dot layer setup
        let dotLayer = CAShapeLayer()
        dotLayer.lineWidth = 0
        dotLayer.fillColor = UIColor.systemBlue.cgColor
        dotLayer.path = UIBezierPath(
            arcCenter: CGPoint(x: 0, y: 0),
            radius: lineSize / 2,
            startAngle: 0,
            endAngle: .pi * 2,
            clockwise: true
        ).cgPath
        
        // Initial position should match the start of the first path
        dotLayer.position = CGPoint(
            x: frame.minX + radius + standardPaddingSize / 2 - lineSize / 2,
            y: frame.midY - radius
        )

        // Combine all paths
        let combinedPath = UIBezierPath()
        combinedPath.append(leftTopPath)
        combinedPath.append(bottomRightPath)
        combinedPath.append(rightTopPath)
        combinedPath.append(leftBottomPath)

        let animation = CAKeyframeAnimation(keyPath: #keyPath(CALayer.position))
        animation.path = combinedPath.cgPath
        animation.duration = 4 // Duration of the animation in seconds
        animation.repeatCount = .infinity // Repeat forever
        animation.timingFunction = CAMediaTimingFunction(name: .linear) // Smooth movement
        animation.calculationMode = .paced // smooth between position changes
        dotLayer.add(animation, forKey: "orbit")
//
        layer.insertSublayer(leftTopPathLayer, at: 0)
        layer.insertSublayer(bottomRightPathLayer, at: 0)
        layer.insertSublayer(rightTopPathLayer, at: 0)
        layer.insertSublayer(leftBottomLayer, at: 0)
        layer.insertSublayer(dotLayer, at: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
