//
//  ViewController.swift
//  WalletAnimation
//
//  Created by Janum Trivedi.
//

import Foundation
import UIKit

import CoreMotion

class AppleCardView: UIViewController {
    
    let accelerometer = CMMotionManager()
    
    // Mark the initial position of the device in 3D space on launch
    var initialPitch: Double?
    var initialRoll: Double?
    var inbound: String?
    var outbound: String?
    var balance: String?
    var height: CGFloat = 0.0
    
    lazy var cardView: CardView = {
        let card = CardView(inbound: inbound!, outbound: outbound!, balance: balance!)
        let width = view.bounds.size.width * 0.94
        height = width * (2.0 / 3.0)
        card.bounds.size = CGSize(width: width, height: height)
        card.center = CGPoint(x: UIScreen.main.bounds.size.width * 0.48 , y: UIScreen.main.bounds.size.width * 0.94 * (1.0 / 3.0))
        card.setupDots()
        return card
    }()
    
    override func viewDidLoad() {
        setupSubviews()
        beginMotionUpdates()
    }
    
    func setupSubviews() {
        view.addSubview(cardView)
    }
    
    func beginMotionUpdates() {
        accelerometer.accelerometerUpdateInterval = 0.10
        accelerometer.startDeviceMotionUpdates(to: .main) { [weak self] (data, error) in
            guard let self = self, let data = data, error == nil else {
                return
            }
            
            // https://developer.apple.com/documentation/coremotion/getting_processed_device-motion_data/understanding_reference_frames_and_device_attitude
            let attitude = data.attitude
            
            if self.initialPitch == nil {
                self.initialPitch = attitude.pitch
            }
            
            if self.initialRoll == nil {
                self.initialRoll = attitude.roll
            }
            
            guard let initialPitch = self.initialPitch, let initialRoll = self.initialRoll else {
                return
            }
            
            let newPitch = attitude.pitch
            let deltaPitch = (newPitch - initialPitch)
            
            let newRoll = attitude.roll
            let deltaRoll = (newRoll - initialRoll)
            
            // Make tilting on the x-axis a bit slower than on the y.
            let maxRadiansX = 0.2
            let maxRadiansY = 0.1
            
            // How much the focal point moves when the device's orientation reaches the max radians above.
            // ex. when tilting the phone 0.2 radians to the side, the focal point moves about 100pts from its origin.
            let maxFocalPointAdjustment = 100.0
            
            let yAdjustment = mapRange(deltaPitch, -maxRadiansY, maxRadiansY, -maxFocalPointAdjustment, maxFocalPointAdjustment)
            let xAdjustment = mapRange(deltaRoll,  -maxRadiansX, maxRadiansX, -maxFocalPointAdjustment, maxFocalPointAdjustment)
            
            let originFocalPoint = self.cardView.originFocalPoint
            let newFocalPoint = CGPoint(
                x: originFocalPoint.x + xAdjustment,
                y: originFocalPoint.y + yAdjustment
            )
            
            // Update the dots and their gradients with the new focal point.
            self.cardView.updateColors(withFocalPoint: newFocalPoint)
        }
    }
}

