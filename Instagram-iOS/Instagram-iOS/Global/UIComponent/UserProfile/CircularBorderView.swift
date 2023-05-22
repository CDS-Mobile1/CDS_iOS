//
//  CircularBorderView.swift
//  Instagram-iOS
//
//  Created by 이성민 on 2023/05/22.
//

import UIKit

import SnapKit

final class CircularBorderView: UIView {
    
    var circleLayer = CAShapeLayer()
    
    private let radius: CGFloat
    
    init(radius: CGFloat) {
        self.radius = radius
        super.init(frame: .zero)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        createCircularPath()
    }
    
    func createCircularPath() {
        self.backgroundColor = .white
        
        let path = UIBezierPath(arcCenter: .init(x: radius, y: radius), radius: radius, startAngle: 0, endAngle: .pi * 2, clockwise: true)
        circleLayer.path = path.cgPath
        circleLayer.lineWidth = 3
        circleLayer.strokeColor = UIColor.clear.cgColor
        circleLayer.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(circleLayer)
    }
}

