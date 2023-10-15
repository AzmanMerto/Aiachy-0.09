//
//  AscendantSelectionViewUITest.swift
//  AiachyUITests
//
//  Created by Mert Türedü on 10.08.2023.
//

import XCTest

//NexitPatchTODO
final class AscendantSelectionViewUITest: XCTestCase {
    
    let app = XCUIApplication()
    let aiachyUITest = AiachyUITests()
    let topElement: UITestNames = .ascendantSelectionViewID
    let selectedZodiac: ACYTextHelper.ACYZodiacText.ACYzodiacNameText = .AquariusZodiac
    
    override func setUpWithError() throws {
        super.setUp()
        continueAfterFailure = false
        app.launch()
        aiachyUITest.skipToAscendantSelection()
    }
    
}
