//
//  SLoadingBarView.swift
//  SLoadingBar
//
//  Created by Francesco Thiery on 25/06/16.
//  Copyright © 2016 Francesco Thiery. All rights reserved.
//

import UIKit

class SLoadingBarView : UIView {
    
    private var barView : UIView?
    private var currentPercentage : Double = 0.0
    
    var progressBarColor : UIColor?{
        get{
            if _progressBarColor == nil{
                self._progressBarColor = SLBVUtils.UIColorFromHex(0x228cd8)
            }
            return self._progressBarColor!
        }
        set{
            self._progressBarColor = self.progressBarColor
            self.barView?.backgroundColor = self.progressBarColor
        }
    }
    
    var errorColor : UIColor{
        get{
            if self._errorColor == nil{
                self._errorColor = SLBVUtils.UIColorFromHex(0xd8223a)
            }
            return _errorColor!
        }
    }
    
    private var _errorColor : UIColor?
    private var _progressBarColor : UIColor?
    
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    internal required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private init(){
        super.init(frame : CGRectZero)
    }
    
    class func GetLoadingBar() -> SLoadingBarView {
        let bar = SLoadingBarView()
//        NSNotificationCenter.defaultCenter().addObserver(bar, selector: #selector(SLoadingBarView.reloadBar), name: UIDeviceOrientationDidChangeNotification, object: nil)
        bar.backgroundColor = UIColor.lightGrayColor()
        bar.barView = UIView()
        bar.barView?.backgroundColor = bar.progressBarColor
        bar.addSubview(bar.barView!)
        return bar
    }
    
    
    func setPercentage(doubleValue value : Double){
        self.currentPercentage = value
        self.barView?.backgroundColor = progressBarColor
        let height = self.frame.height
        let width = (self.frame.width/100) * CGFloat(value)
        UIView.animateWithDuration(0.1) {
            self.barView?.frame = CGRect(x: 0,
                                         y: 0,
                                         width: width,
                                         height: height)
            print(self.barView?.frame)
        }
    }
    
    func setPercentage(intValue value : Int){
        let doubleValue = Double(value)
        self.setPercentage(doubleValue: doubleValue)
    }
    
    func setError(){
        UIView.animateWithDuration(0.4) {
            self.barView?.backgroundColor = self.errorColor
            self.barView?.frame = CGRect(x: 0,
                                         y: 0,
                                         width: self.frame.width,
                                         height: self.frame.height)
        }
        
    }
    
//    func reloadBar(){
//        dispatch_sync(dispatch_get_main_queue()) {
//            self.setPercentage(doubleValue: self.currentPercentage)
//        }
//    }
//    
//    
//    deinit{
//        NSNotificationCenter.defaultCenter().removeObserver(self)
//    }
}


class SLBVUtils {
    class func UIColorFromRGB(red: Int, green: Int, blue: Int) -> UIColor{
        assert(red >= 0 && red <= 255, "Invalid red value")
        assert(green >= 0 && green <= 255, "Invalid green value")
        assert(blue >= 0 && blue <= 255, "Invalid blue value")
        
        return UIColor(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    class func UIColorFromHex(netHex:Int) -> UIColor{
        return SLBVUtils.UIColorFromRGB((netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}