//
//  ACYAlertEntity.swift
//  Aiachy
//
//  Created by Mert Türedü on 14.08.2023.
//

import Foundation

/// - TypeError 0: Tittle with Button
/// - TypeError 1: Tittle with Two Button
/// - TypeError 2: Tittle, image  and button
/// - TypeError 3: Tittle, image  and two button
struct ACYAlertEntity {
    var title: TextHelper.AlertCompletion.alert?
    var description: TextHelper.AlertCompletion.alert? 
    var image: ImageHelper.AlertCompletion.alert?
    var firstButtonText: TextHelper.AlertCompletion.button?
    var secondButtonText: TextHelper.AlertCompletion.button?
    var isShowingAlert: Bool = false
    var levelError: Int?
    var typeError: Int?
    var firstAction: (() -> ())?
    var secondAction: (() -> ())?
}
