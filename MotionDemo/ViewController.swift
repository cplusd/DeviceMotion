//
//  ViewController.swift
//  MotionDemo
//
//  Created by Danny.Qi on 2020/1/17.
//  Copyright © 2020 Danny.Qi. All rights reserved.
//

import UIKit
import CoreMotion


class ViewController: UIViewController {

    var motionManager:CMMotionManager?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        motionManager = CMMotionManager()
        if !motionManager!.isDeviceMotionAvailable {
            print("Device Motion is not available.")
            return
        }
        
        motionManager?.deviceMotionUpdateInterval = 1
        motionManager?.startDeviceMotionUpdates(to: OperationQueue.init(), withHandler: { (data:CMDeviceMotion?,error: Error?) in
            
            
            let gravityX:Double = data?.gravity.x ?? 0
            let gravityY:Double = data?.gravity.y ?? 0
            let gravityZ:Double =  data?.gravity.z ?? 0
                       
           // 获取手机的倾斜角度(zTheta是手机与水平面的夹角， xyTheta是手机绕自身旋转的角度)：
           
            let zTheta:Double = atan2(gravityZ,Double(sqrtf(Float(gravityX * gravityX + gravityY * gravityY)))) / Double.pi * 180.0;
            let xyTheta:Double = atan2(gravityX, gravityY) / Double.pi * 180.0;
           
           //水平 - 90
           print("与水平面角度： \(zTheta)  ---  自传角度 \(xyTheta)")
        })
        
    }
    
    
    
    
    
    
    

    

}

