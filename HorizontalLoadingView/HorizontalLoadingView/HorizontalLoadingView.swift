//
//  HorizontalLoadingView.swift
//  MengGou
//
//  Created by liujianlin on 2016/11/8.
//  Copyright © 2016年 xdream. All rights reserved.
//

import UIKit

class HorizontalLoadingView: UIView {
    //MARK: - 属性定义
    private let layer1 = CALayer()
    private let layer2 = CALayer()
    private let layer3 = CALayer()
    fileprivate let layer4 = CALayer()
    private let duration:Double = 0.5
    private var allDuration:Double {
        guard let sublayers = layer.sublayers else { return 0 }
        return duration * Double(sublayers.count)
    }
    var completed = {}
    
    //MARK: - 生命周期
    init() {
        super.init(frame: CGRect.zero)
        setupLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayer()
    }
    
    private func setupLayer() {
        isHidden = true
        layer1.backgroundColor = UIColor(red: 255/255, green: 203/255, blue: 188/255, alpha: 1).cgColor
        layer2.backgroundColor = UIColor(red: 255/255, green: 168/255, blue: 149/255, alpha: 1).cgColor
        layer3.backgroundColor = UIColor(red: 255/255, green: 118/255, blue: 91/255, alpha: 1).cgColor
        layer4.backgroundColor = UIColor(red: 255/255, green: 80/255, blue: 48/255, alpha: 1).cgColor
        layer.backgroundColor = UIColor(red: 255/255, green: 80/255, blue: 48/255, alpha: 1).cgColor
        layer.addSublayer(layer1)
        layer.addSublayer(layer2)
        layer.addSublayer(layer3)
        layer.addSublayer(layer4)
    }
    
    private func addAnimation(layer: CALayer, beginTime: CFTimeInterval = 0) {
        layer.frame = bounds
        layer.opacity = 0
        let animation = CABasicAnimation(keyPath: "bounds.size.width")
        animation.fromValue = 0
        animation.toValue = bounds.width
        animation.duration = duration
        animation.beginTime = beginTime
        
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = 1
        opacityAnimation.toValue = 1
        opacityAnimation.duration = allDuration-beginTime
        opacityAnimation.beginTime = beginTime
        
        
        let animationGroup = CAAnimationGroup()
        animationGroup.duration = allDuration
        animationGroup.repeatCount = Float.infinity
        animationGroup.animations = [animation, opacityAnimation]
        
        layer.add(animationGroup, forKey: layer.name)
    }
    
    func start() {
        if !isHidden { return }
        isHidden = false
        addAnimation(layer: layer1)
        addAnimation(layer: layer2, beginTime: duration)
        addAnimation(layer: layer3, beginTime: duration*2)
        addAnimation(layer: layer4, beginTime: duration*3)
    }
    
    func stop() {
        isHidden = true
        layer.sublayers?.forEach { (layer) in
            layer.removeAllAnimations()
        }
        completed()
    }
    
    //MAKR: - 自定义方法
    private func setupConstraints() {
        
    }
}
