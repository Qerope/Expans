//
//  HelperMethods.swift
//  Expans
//
//  Created by Qerope31/01/21.
//

import UIKit

public func keyboardEndEditing() {
    UIApplication.shared.connectedScenes
        .filter {$0.activationState == .foregroundActive}
        .map {$0 as? UIWindowScene}
        .compactMap({$0})
        .first?.windows
        .filter {$0.isKeyWindow}
        .first?.endEditing(true)
}
