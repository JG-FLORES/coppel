//
//  Overlay.swift
//  Coppel
//
//  Created by JG on 07/03/23.
//

import UIKit

open class Overlay{
    
    class var shared: Overlay {
        struct Static {
            static let instance: Overlay = Overlay()
        }
        return Static.instance
    }
    
    var overlayView = UIView()
    var activityIndicator = UIActivityIndicatorView()
    var labeTitle = UILabel()
        
    open func showOverlayBasic(_ view: UIView,_ title: String){
        overlayView.frame = CGRect(x: 0, y: 0, width: 125, height: 125)
        overlayView.center = view.center
        overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        overlayView.clipsToBounds = true
        overlayView.layer.cornerRadius = 14.0
        overlayView.clipsToBounds = true
        
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        activityIndicator.style = .large
        activityIndicator.center = CGPoint(x: overlayView.bounds.width / 2, y: overlayView.bounds.height / 2 - 10)
        activityIndicator.color = .white
        
        labeTitle.frame = CGRect(x: 0, y: 0, width: 96, height: 20)
        labeTitle.text = title
        labeTitle.font = UIFont(name: "Gotham-Book", size: 15)
        labeTitle.textColor = UIColor.white
        labeTitle.textAlignment = NSTextAlignment.center
        labeTitle.sizeToFit()
        labeTitle.center = CGPoint(x: overlayView.bounds.width / 2, y: overlayView.bounds.height / 2 + 32)
                
        overlayView.addSubview(activityIndicator)
        overlayView.addSubview(labeTitle)
        view.addSubview(overlayView)
        
        overlayView.bringSubviewToFront(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    open func hideOverlay(){
        activityIndicator.stopAnimating()
        overlayView.removeFromSuperview()
    }

}

