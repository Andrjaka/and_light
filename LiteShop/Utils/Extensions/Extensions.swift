//
//  Extensions.swift
//  LiteShop
//
//  Created by Andrius J on 2023-01-30.
//

import UIKit
import NVActivityIndicatorView
import SwiftEntryKit


extension UIView {
        
    func shakeUI() {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.05
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: "position")
    }
}

extension UIButton {
    func loadingIndicator(_ show: Bool, backToColor: UIColor = UIColor.white, circleColor: UIColor = UIColor.white, imageTint: UIColor = .black, imageTintBack: UIColor = .white, backImage: UIImage? = nil) {
        let tag = 808404
        if show {
            self.isEnabled = false
            let indicator = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 15, height: 15), type: .circleStrokeSpin, color: circleColor, padding: 0)
            let buttonHeight = self.bounds.size.height
            let buttonWidth = self.bounds.size.width
            indicator.center = CGPoint(x: buttonWidth / 2, y: buttonHeight / 2)
            indicator.tag = tag
            self.addSubview(indicator)
            setTitleColor(.clear, for: .normal)
            
            if let _ = backImage {
                setImage(nil, for: .normal)
            }
            
            self.tintColor = imageTint
            indicator.startAnimating()
        } else {
            self.isEnabled = true
            if let indicator = self.viewWithTag(tag) as? NVActivityIndicatorView {
                self.setTitleColor(backToColor, for: .normal)
                self.setTitleColor(backToColor, for: .highlighted)
                self.tintColor = imageTintBack
                
                if let backImage = backImage {
                    setImage(backImage, for: .normal)
                }
                
                indicator.stopAnimating()
                indicator.removeFromSuperview()
            }
        }
    }
}

extension UIViewController {
    
    func presentWarning(text: String) {
        var attributes = EKAttributes.topFloat
        attributes.displayMode = .inferred
        attributes.name = "lite_shop"
        attributes.hapticFeedbackType = .warning
        attributes.scroll = .enabled(swipeable: true, pullbackAnimation: .jolt)
        attributes.positionConstraints.verticalOffset = -4
        attributes.positionConstraints.size = .init(width: .offset(value: 16), height: .intrinsic)
        
        attributes.entryBackground = .color(color: .init(red: 255, green: 158, blue: 201))
        
        attributes.positionConstraints.size = .init(width: .offset(value: 16), height: .intrinsic)
        attributes.statusBar = .dark
        
        
        let contentView: UIView
        let style = EKProperty.LabelStyle(font: UIFont.systemFont(ofSize: 16, weight: .regular), color: .white, alignment: .center)
        let labelContent = EKProperty.LabelContent(text: text, style: style)
        
        let noteView = EKNoteMessageView(with: labelContent)
        noteView.verticalOffset = 0
        
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.windows[0]
            noteView.set(.height, of: window.safeAreaInsets.top + 30)
        } else {
            noteView.set(.height, of: 55)
        }
        
        contentView = noteView
        
        SwiftEntryKit.display(entry: contentView, using: attributes)
    }
    
    func addKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func removeKeyboardObserver() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
    }
}

extension UIColor {

    func rgb() -> Int? {
        var fRed : CGFloat = 0
        var fGreen : CGFloat = 0
        var fBlue : CGFloat = 0
        var fAlpha: CGFloat = 0
        if self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha) {
            let iRed = Int(fRed * 255.0)
            let iGreen = Int(fGreen * 255.0)
            let iBlue = Int(fBlue * 255.0)
            let iAlpha = Int(fAlpha * 255.0)

            //  (Bits 24-31 are alpha, 16-23 are red, 8-15 are green, 0-7 are blue).
            let rgb = (iAlpha << 24) + (iRed << 16) + (iGreen << 8) + iBlue
            return rgb
        } else {
            // Could not extract RGBA components:
            return nil
        }
    }
}
