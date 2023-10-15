//
//  View+Extension.swift
//  Aiachy
//
//  Created by Mert Türedü on 16.05.2023.
//

import SwiftUI

extension View {
    
    func disabledOpacited(bool: Bool, disabledOpacity: Double) -> some View {
        self
            .disabled(bool)
            .compositingGroup()
            .opacity(bool ? disabledOpacity : 1)
    }
    
    func rotate(_ degrees: Double) -> some View {
        return self.rotationEffect(Angle(degrees: degrees))
    }
    /// ACY Dynamic Width
    /// - Parameters:
    ///   - aiachy: I use the aiachy parameter to set your phone according to what it is to you.
    ///   - double: In order to value
    /// - Returns: Resulting in the value we set according to the phone's screen
    func ACYdw(_ aiachy: AiachyState,d double: Double) -> CGFloat {
        return (aiachy.user.deviceInfo.phoneWidth!) * double
    }
    /// ACY Dynamic Width
    /// - Parameters:
    ///   - aiachy: I use the aiachy parameter to set your phone according to what it is to you.
    ///   - double: In order to value
    /// - Returns: Resulting in the value we set according to the phone's screen
    func ACYdh(_ aiachy: AiachyState,d double: Double) -> CGFloat {
        return (aiachy.user.deviceInfo.phoneHeight!) * double
    }
    
    func makeAccessibilitysForUITest(identifier: String) -> some View {
        self
        .accessibilityElement(children: .ignore)
        .accessibility(identifier: identifier)
    }
}
