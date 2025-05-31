//
//  Color+Ext.swift
//  Appetizers
//
//  Created by Mesum Syed on 29/05/2025.
//

import SwiftUI
import UIKit

enum AppColors {
    static let brandPrimarySwiftUI = Color("brandPrimary")
    static var brandPrimaryUIKit: UIColor {
        UIColor(named: "brandPrimary") ?? .black
    }
}

