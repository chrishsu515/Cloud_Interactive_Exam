//
//  CcExtension.swift
//  Cloud_Interactive_Exam
//
//  Created by Chris on 2021/3/17.
//

import Foundation
import UIKit

extension UIColor {
    public class var random: UIColor {
        return UIColor(red: CGFloat(drand48()),
                       green: CGFloat(drand48()),
                       blue: CGFloat(drand48()), alpha: 1.0)
    }
}
