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
    fileprivate var stopFlag = false
    private let duration:Double = 0.5
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
        layer1.backgroundColor = UIColor(red: 255/255, green: 203/255, blue: 188/255, alpha: 1).cgColor
        layer2.backgroundColor = UIColor(red: 255/255, green: 168/255, blue: 149/255, alpha: 1).cgColor
        layer3.backgroundColor = UIColor(red: 255/255, green: 118/255, blue: 91/255, alpha: 1).cgColor
        layer4.backgroundColor = UIColor(red: 255/255, green: 80/255, blue: 48/255, alpha: 1).cgColor
    }
    
    private func addAnimation(layer: CALayer) {
        layer.removeAllAnimations()
        layer.frame = bounds
        self.layer.addSublayer(layer)
        let animation = CABasicAnimation(keyPath: "bounds.size.width")
        animation.fromValue = 0
        animation.toValue = bounds.width
        animation.duration = duration
        animation.delegate = self
        layer.add(animation, forKey: layer.name)
    }
    
    func start() {
        self.stopFlag = false
        addAnimation(layer: layer1)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) { [weak self] in
            if self == nil { return }
            self?.addAnimation(layer: self!.layer2)
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration*2) { [weak self] in
            if self == nil { return }
            self?.addAnimation(layer: self!.layer3)
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration*3) { [weak self] in
            if self == nil { return }
            self?.addAnimation(layer: self!.layer4)
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration*4) { [weak self] in
            if self == nil { return }
            if !self!.stopFlag {
                self!.start()
            }
        }
    }
    
    func stop() {
        stopFlag = true
    }
    
    //MAKR: - 自定义方法
    private func setupConstraints() {
        
    }
}

extension HorizontalLoadingView: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if self.stopFlag {
            completed()
        }
    }
}
