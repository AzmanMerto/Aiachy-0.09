//
//  AuthBackground.swift
//  Aiachy
//
//  Created by Mert Türedü on 16.05.2023.
//

import SwiftUI
import Combine

struct AuthBackground: View {
    
    @EnvironmentObject var aiachyState: AiachyState
    @State private var cancellable: AnyCancellable?
    @State private var authBackgroundEntityData: [ACYAuthBackgroundEntity]? = nil
    
    var body: some View {
        ZStack {
            //MARK: AuthBackground - ForEach
            Color.makeAiachyColor(aiachyState, aiachyColor: .backgroundColor)
                .ignoresSafeArea(.all, edges: .all)
            //MARK: AuthBackground - ForEach Static Background Image
            ForEach(authBackgroundEntityData ?? dataloski, id:\.id) { image in
                withAnimation(.easeInOut(duration: 1)) {
                    Image(ImageHandler.makeAuthString(aiachyState,
                                                      auth: image.image))
                        .resizable()
                        .scaledToFit()
                        .frame(width: image.frameW, height: image.framwH)
                        .rotate(image.rotated)
                        .opacity(image.opaqued)
                        .position(x: image.positionX, y: image.positionY)
                }
            }
        }
        .ignoresSafeArea(.all, edges: .all)
        .onAppear {
            setupTimer()
        }
        .onDisappear {
            self.cancellable?.cancel()
        }
    }
}
// WillAdded:
/*
//MARK: AuthBackground - Preview
#Preview {
    AuthBackground()
        .environmentObject(ACY_PREVIEWS_STATE)
}
 */
//MARK: AuthBackground - extension
extension AuthBackground {
    private func setupTimer() {
        let formatter = DateFormatter()
        formatter.dateFormat = "ss"
        
        cancellable = Timer.publish(every: 1, on: .current, in: .common)
            .autoconnect()
            .subscribe(on: DispatchQueue.main)
            .sink { _ in
                let currentTime = Date()
                let currentSecondString = formatter.string(from: currentTime)
                if let currentSecondInt = Int(currentSecondString) {
                    checkSecondAndSetBackground(newValue: currentSecondInt)
                }
            }
    }
    
    private func checkSecondAndSetBackground(newValue: Int) {
        
        let firstOpaqued = 0.05
        let midOpaqued = 0.4
        let lastOpaqued = 0.05
        let midDurationTime = 2.5
        let lastDurationTime = 2.0
        //MARK: AuthBackground checkSecondAndSetBackground Test object
        //        switch newValue {
        //        case 0..<60:
        //            self.authBackgroundEntityData = changeAuthBackgroundModel(id: 0,
        //                                                                     positionX: 0,
        //                                                                     positionY: 0,
        //                                                                     opaqued: midOpaqued,
        //                                                                     planeX: true,
        //                                                                     planeY: true)
        //        default:
        //            break
        //        }
        
        switch newValue {
        case 0..<10:
            if newValue == 0 {
                self.authBackgroundEntityData = changeAuthBackgroundModel(id: 100,
                                                                         positionX: 0,
                                                                         positionY: 0,
                                                                         opaqued: firstOpaqued,
                                                                         planeX: true,
                                                                         planeY: true)
            }
            if newValue == 1 {
                self.setDispatchedQueueForBackground(durationTime: midDurationTime) {
                    self.authBackgroundEntityData = changeAuthBackgroundModel(id: 100,
                                                                             positionX: 0,
                                                                             positionY: 0,
                                                                             opaqued: midOpaqued,
                                                                             planeX: true,
                                                                             planeY: true)
                }
            }
            if newValue == 8 {
                self.setDispatchedQueueForBackground(durationTime: lastDurationTime) {
                    self.authBackgroundEntityData = changeAuthBackgroundModel(id: 100,
                                                                             positionX: 0,
                                                                             positionY: 0,
                                                                             opaqued: lastOpaqued,
                                                                             planeX: true,
                                                                             planeY: true)
                }
            }
        case 10..<20:
            if newValue == 11 {
                self.authBackgroundEntityData = changeAuthBackgroundModel(id: 100,
                                                                         positionX: 0,
                                                                         positionY: 0,
                                                                         opaqued: firstOpaqued,
                                                                         planeX: true,
                                                                         planeY: true)
            }
            if newValue == 11 {
                self.setDispatchedQueueForBackground(durationTime: midDurationTime) {
                    self.authBackgroundEntityData = changeAuthBackgroundModel(id: 100,
                                                                             positionX: 0,
                                                                             positionY: 0,
                                                                             opaqued: midOpaqued,
                                                                             planeX: true,
                                                                             planeY: true)
                }
            }
            if newValue == 18 {
                self.setDispatchedQueueForBackground(durationTime: lastDurationTime) {
                    self.authBackgroundEntityData = changeAuthBackgroundModel(id: 100,
                                                                             positionX: 0,
                                                                             positionY: 0,
                                                                             opaqued: lastOpaqued,
                                                                             planeX: true,
                                                                             planeY: true)
                }
            }
        case 20..<30:
            if newValue == 20 {
                self.authBackgroundEntityData = changeAuthBackgroundModel(id: 100,
                                                                         positionX: 0,
                                                                         positionY: 0,
                                                                         opaqued: firstOpaqued,
                                                                         planeX: true,
                                                                         planeY: true)
            }
            if newValue == 21 {
                self.setDispatchedQueueForBackground(durationTime: midDurationTime) {
                    self.authBackgroundEntityData = changeAuthBackgroundModel(id: 100,
                                                                             positionX: 0,
                                                                             positionY: 0,
                                                                             opaqued: midOpaqued,
                                                                             planeX: true,
                                                                             planeY: true)
                }
            }
            if newValue == 28 {
                self.setDispatchedQueueForBackground(durationTime: lastDurationTime) {
                    self.authBackgroundEntityData = changeAuthBackgroundModel(id: 100,
                                                                             positionX: 0,
                                                                             positionY: 0,
                                                                             opaqued: lastOpaqued,
                                                                             planeX: true,
                                                                             planeY: true)
                }
            }
        case 30..<40:
            if newValue == 30 {
                self.authBackgroundEntityData = changeAuthBackgroundModel(id: 100,
                                                                         positionX: 0,
                                                                         positionY: 0,
                                                                         opaqued: firstOpaqued,
                                                                         planeX: true,
                                                                         planeY: true)
            }
            if newValue == 32 {
                self.setDispatchedQueueForBackground(durationTime: midDurationTime) {
                    self.authBackgroundEntityData = changeAuthBackgroundModel(id: 100,
                                                                             positionX: 0,
                                                                             positionY: 0,
                                                                             opaqued: midOpaqued,
                                                                             planeX: true,
                                                                             planeY: true)
                }
            }
            if newValue == 38 {
                self.setDispatchedQueueForBackground(durationTime: lastDurationTime) {
                    self.authBackgroundEntityData = changeAuthBackgroundModel(id: 100,
                                                                             positionX: 0,
                                                                             positionY: 0,
                                                                             opaqued: lastOpaqued,
                                                                             planeX: true,
                                                                             planeY: true)
                }
            }
        case 40..<50:
            if newValue == 40 {
                self.authBackgroundEntityData = changeAuthBackgroundModel(id: 100,
                                                                         positionX: 0,
                                                                         positionY: 0,
                                                                         opaqued: firstOpaqued,
                                                                         planeX: true,
                                                                         planeY: true)
            }
            if newValue == 42 {
                self.setDispatchedQueueForBackground(durationTime: midDurationTime) {
                    self.authBackgroundEntityData = changeAuthBackgroundModel(id: 100,
                                                                             positionX: 0,
                                                                             positionY: 0,
                                                                             opaqued: midOpaqued,
                                                                             planeX: true,
                                                                             planeY: true)
                }
            }
            if newValue == 48 {
                self.setDispatchedQueueForBackground(durationTime: lastDurationTime) {
                    self.authBackgroundEntityData = changeAuthBackgroundModel(id: 100,
                                                                             positionX: 0,
                                                                             positionY: 0,
                                                                             opaqued: lastOpaqued,
                                                                             planeX: true,
                                                                             planeY: true)
                }
            }
        case 50..<60:
            if newValue == 50 {
                self.authBackgroundEntityData = changeAuthBackgroundModel(id: 100,
                                                                         positionX: 0,
                                                                         positionY: 0,
                                                                         opaqued: firstOpaqued,
                                                                         planeX: true,
                                                                         planeY: true)
            }
            if newValue == 52 {
                self.setDispatchedQueueForBackground(durationTime: midDurationTime) {
                    self.authBackgroundEntityData = changeAuthBackgroundModel(id: 100,
                                                                             positionX: 0,
                                                                             positionY: 0,
                                                                             opaqued: midOpaqued,
                                                                             planeX: true,
                                                                             planeY: true)
                }
            }
            if newValue == 58 {
                self.setDispatchedQueueForBackground(durationTime: lastDurationTime) {
                    self.authBackgroundEntityData = changeAuthBackgroundModel(id: 100,
                                                                             positionX: 0,
                                                                             positionY: 0,
                                                                             opaqued: lastOpaqued,
                                                                             planeX: true,
                                                                             planeY: true)
                }
            }
        default:
            break
        }
    }
    
    /// For gradually disappearing and identifying background objects.
    /// - Parameters:
    ///   - durationTime: The value we set in how many seconds it will disappear and the time we will determine.
    ///   - closure: The changeAuthBackgroundModel value needs to be here.
    private func setDispatchedQueueForBackground(durationTime: Double, closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(.easeInOut(duration: durationTime)) {
                closure()
            }
        }
    }
}

extension AuthBackground {
    /// We use this func to give all background objects different values and create them with these values.
    /// - Parameters:
    ///   - id: Here we set the ID. Objects on the back are the reason why we are unique.
    ///   - positionX: CheckSecondAndSetBackground also creates a position by adding it above the values we will specify. (X Values)
    ///   - positionY: CheckSecondAndSetBackground also creates a position by adding it above the values we will specify. (Y Values)
    ///   - opaqued: checkSecondAndSetBackground is also intended to make it disappear gradually and make it appear.
    ///   - planeX: checkSecondAndSetBackground here I thought I created geometry plane and we can set (+) (+) or (+) (-) positions and show them as we want. (X Values)
    ///   - planeY: checkSecondAndSetBackground here I thought I created geometry plane and we can set (+) (+) or (+) (-) positions and show them as we want. (Y Values)
    /// - Returns: We return it as [AuthBackgroundEntity].
    private func changeAuthBackgroundModel(id: Int, positionX: CGFloat, positionY: CGFloat, opaqued: Double, planeX: Bool, planeY: Bool ) -> [ACYAuthBackgroundEntity] {
        
        let frameWSettedSymbol1 = 20.0
        let frameHSettedSymbol1 = 21.0
        
        let frameWSettedSymbol2 = 10.0
        let frameHSettedSymbol2 = 15.0
        
        let authBackgroundModelData: [ACYAuthBackgroundEntity] = [
            // MARK: - AuthBackground changeAuthBackgroundModel authBackgroundSymbol1 Start
            ACYAuthBackgroundEntity(id: id + 0,
                                image: .authBackgroundSymbol1,
                                frameW: frameWSettedSymbol1,
                                framwH: frameHSettedSymbol1,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.05),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.01),
                                opaqued: opaqued,
                                rotated: 21),
            ACYAuthBackgroundEntity(id: id + 1,
                                image: .authBackgroundSymbol1,
                                frameW: frameWSettedSymbol1,
                                framwH: frameHSettedSymbol1,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.55),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.11),
                                opaqued: opaqued,
                                rotated: 78),
            ACYAuthBackgroundEntity(id: id + 2,
                                image: .authBackgroundSymbol1,
                                frameW: frameWSettedSymbol1,
                                framwH: frameHSettedSymbol1,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.15),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.09),
                                opaqued: opaqued,
                                rotated: 141),
            ACYAuthBackgroundEntity(id: id + 3,
                                image: .authBackgroundSymbol1,
                                frameW: frameWSettedSymbol1,
                                framwH: frameHSettedSymbol1,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.75),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.07),
                                opaqued: opaqued,
                                rotated: 120),
            ACYAuthBackgroundEntity(id: id + 4,
                                image: .authBackgroundSymbol1,
                                frameW: frameWSettedSymbol1,
                                framwH: frameHSettedSymbol1,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.05),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.27),
                                opaqued: opaqued,
                                rotated: 230),
            ACYAuthBackgroundEntity(id: id + 5,
                                image: .authBackgroundSymbol1,
                                frameW: frameWSettedSymbol1,
                                framwH: frameHSettedSymbol1,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.45),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.23),
                                opaqued: opaqued,
                                rotated: 310),
            ACYAuthBackgroundEntity(id: id + 6,
                                image: .authBackgroundSymbol1,
                                frameW: frameWSettedSymbol1,
                                framwH: frameHSettedSymbol1,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.75),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.28),
                                opaqued: opaqued,
                                rotated: 69),
            ACYAuthBackgroundEntity(id: id + 7,
                                image: .authBackgroundSymbol1,
                                frameW: frameWSettedSymbol1,
                                framwH: frameHSettedSymbol1,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.25),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.43),
                                opaqued: opaqued,
                                rotated: 69),
            ACYAuthBackgroundEntity(id: id + 8,
                                image: .authBackgroundSymbol1,
                                frameW: frameWSettedSymbol1,
                                framwH: frameHSettedSymbol1,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.7),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.45),
                                opaqued: opaqued,
                                rotated: 69),
            ACYAuthBackgroundEntity(id: id + 9,
                                image: .authBackgroundSymbol1,
                                frameW: frameWSettedSymbol1,
                                framwH: frameHSettedSymbol1,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.5),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.53),
                                opaqued: opaqued,
                                rotated: 69),
            ACYAuthBackgroundEntity(id: id + 10,
                                image: .authBackgroundSymbol1,
                                frameW: frameWSettedSymbol1,
                                framwH: frameHSettedSymbol1,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.1),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.59),
                                opaqued: opaqued,
                                rotated: 69),
            ACYAuthBackgroundEntity(id: id + 11,
                                image: .authBackgroundSymbol1,
                                frameW: frameWSettedSymbol1,
                                framwH: frameHSettedSymbol1,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.9),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.62),
                                opaqued: opaqued,
                                rotated: 69),
            ACYAuthBackgroundEntity(id: id + 12,
                                image: .authBackgroundSymbol1,
                                frameW: frameWSettedSymbol1,
                                framwH: frameHSettedSymbol1,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.39),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.72),
                                opaqued: opaqued,
                                rotated: 23),
            ACYAuthBackgroundEntity(id: id + 13,
                                image: .authBackgroundSymbol1,
                                frameW: frameWSettedSymbol1,
                                framwH: frameHSettedSymbol1,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.79),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.79),
                                opaqued: opaqued,
                                rotated: 30),
            ACYAuthBackgroundEntity(id: id + 14,
                                image: .authBackgroundSymbol1,
                                frameW: frameWSettedSymbol1,
                                framwH: frameHSettedSymbol1,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.19),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.79),
                                opaqued: opaqued,
                                rotated: 90),
            ACYAuthBackgroundEntity(id: id + 15,
                                image: .authBackgroundSymbol1,
                                frameW: frameWSettedSymbol1,
                                framwH: frameHSettedSymbol1,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.39),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.89),
                                opaqued: opaqued,
                                rotated: 21),
            ACYAuthBackgroundEntity(id: id + 16,
                                image: .authBackgroundSymbol1,
                                frameW: frameWSettedSymbol1,
                                framwH: frameHSettedSymbol1,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.79),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.89),
                                opaqued: opaqued,
                                rotated: 19),
            ACYAuthBackgroundEntity(id: id + 17,
                                image: .authBackgroundSymbol1,
                                frameW: frameWSettedSymbol1,
                                framwH: frameHSettedSymbol1,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.09),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.69),
                                opaqued: opaqued,
                                rotated: 230),
            ACYAuthBackgroundEntity(id: id + 18,
                                image: .authBackgroundSymbol1,
                                frameW: frameWSettedSymbol1,
                                framwH: frameHSettedSymbol1,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.59),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.69),
                                opaqued: opaqued,
                                rotated: 80),
            ACYAuthBackgroundEntity(id: id + 19,
                                image: .authBackgroundSymbol1,
                                frameW: frameWSettedSymbol1,
                                framwH: frameHSettedSymbol1,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.29),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.28),
                                opaqued: opaqued,
                                rotated: 71),
            ACYAuthBackgroundEntity(id: id + 20,
                                image: .authBackgroundSymbol1,
                                frameW: frameWSettedSymbol1,
                                framwH: frameHSettedSymbol1,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.1),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.89),
                                opaqued: opaqued,
                                rotated: 281),
            ACYAuthBackgroundEntity(id: id + 21,
                                image: .authBackgroundSymbol1,
                                frameW: frameWSettedSymbol1,
                                framwH: frameHSettedSymbol1,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.7),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.36),
                                opaqued: opaqued,
                                rotated: 61),
            ACYAuthBackgroundEntity(id: id + 22,
                                image: .authBackgroundSymbol1,
                                frameW: frameWSettedSymbol1,
                                framwH: frameHSettedSymbol1,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.1),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.16),
                                opaqued: opaqued,
                                rotated: 69),
            ACYAuthBackgroundEntity(id: id + 23,
                                image: .authBackgroundSymbol1,
                                frameW: frameWSettedSymbol1,
                                framwH: frameHSettedSymbol1,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.71),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.6),
                                opaqued: opaqued,
                                rotated: 69),
            ACYAuthBackgroundEntity(id: id + 24,
                                image: .authBackgroundSymbol1,
                                frameW: frameWSettedSymbol1,
                                framwH: frameHSettedSymbol1,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.61),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.6),
                                opaqued: opaqued,
                                rotated: 69),
            ACYAuthBackgroundEntity(id: id + 25,
                                image: .authBackgroundSymbol1,
                                frameW: frameWSettedSymbol1,
                                framwH: frameHSettedSymbol1,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.71),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.6),
                                opaqued: opaqued,
                                rotated: 69),
            ACYAuthBackgroundEntity(id: id + 26,
                                image: .authBackgroundSymbol1,
                                frameW: frameWSettedSymbol1,
                                framwH: frameHSettedSymbol1,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.81),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: -0.02),
                                opaqued: opaqued,
                                rotated: 69),
            ACYAuthBackgroundEntity(id: id + 27,
                                image: .authBackgroundSymbol1,
                                frameW: frameWSettedSymbol1,
                                framwH: frameHSettedSymbol1,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.71),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.6),
                                opaqued: opaqued,
                                rotated: 69),
            // MARK: AuthBackground changeAuthBackgroundModel authBackgroundSymbol1 End -
            // MARK: - AuthBackground changeAuthBackgroundMode2 authBackgroundSymbol1 Start
            ACYAuthBackgroundEntity(id: id + 50,
                                image: .authBackgroundSymbol2,
                                frameW: frameWSettedSymbol2,
                                framwH: frameHSettedSymbol2,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.19),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.01),
                                opaqued: opaqued,
                                rotated: 0),
            ACYAuthBackgroundEntity(id: id + 51,
                                image: .authBackgroundSymbol2,
                                frameW: frameWSettedSymbol2,
                                framwH: frameHSettedSymbol2,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.25),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.11),
                                opaqued: opaqued,
                                rotated: 21),
            ACYAuthBackgroundEntity(id: id + 52,
                                image: .authBackgroundSymbol2,
                                frameW: frameWSettedSymbol2,
                                framwH: frameHSettedSymbol2,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.45),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.09),
                                opaqued: opaqued,
                                rotated: 39),
            ACYAuthBackgroundEntity(id: id + 53,
                                image: .authBackgroundSymbol2,
                                frameW: frameWSettedSymbol2,
                                framwH: frameHSettedSymbol2,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.6),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.07),
                                opaqued: opaqued,
                                rotated: 359),
            ACYAuthBackgroundEntity(id: id + 54,
                                image: .authBackgroundSymbol2,
                                frameW: frameWSettedSymbol2,
                                framwH: frameHSettedSymbol2,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.15),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.22),
                                opaqued: opaqued,
                                rotated: 69),
            ACYAuthBackgroundEntity(id: id + 55,
                                image: .authBackgroundSymbol2,
                                frameW: frameWSettedSymbol2,
                                framwH: frameHSettedSymbol2,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.65),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.17),
                                opaqued: opaqued,
                                rotated: 69),
            ACYAuthBackgroundEntity(id: id + 56,
                                image: .authBackgroundSymbol2,
                                frameW: frameWSettedSymbol2,
                                framwH: frameHSettedSymbol2,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.45),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.34),
                                opaqued: opaqued,
                                rotated: 69),
            ACYAuthBackgroundEntity(id: id + 57,
                                image: .authBackgroundSymbol2,
                                frameW: frameWSettedSymbol2,
                                framwH: frameHSettedSymbol2,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.05),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.36),
                                opaqued: opaqued,
                                rotated: 69),
            ACYAuthBackgroundEntity(id: id + 58,
                                image: .authBackgroundSymbol2,
                                frameW: frameWSettedSymbol2,
                                framwH: frameHSettedSymbol2,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.50),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.45),
                                opaqued: opaqued,
                                rotated: 69),
            ACYAuthBackgroundEntity(id: id + 59,
                                image: .authBackgroundSymbol2,
                                frameW: frameWSettedSymbol2,
                                framwH: frameHSettedSymbol2,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.8),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.53),
                                opaqued: opaqued,
                                rotated: 69),
            ACYAuthBackgroundEntity(id: id + 60,
                                image: .authBackgroundSymbol2,
                                frameW: frameWSettedSymbol2,
                                framwH: frameHSettedSymbol2,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.1),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.49),
                                opaqued: opaqued,
                                rotated: 69),
            ACYAuthBackgroundEntity(id: id + 61,
                                image: .authBackgroundSymbol2,
                                frameW: frameWSettedSymbol2,
                                framwH: frameHSettedSymbol2,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.5),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.62),
                                opaqued: opaqued,
                                rotated: 69),
            ACYAuthBackgroundEntity(id: id + 62,
                                image: .authBackgroundSymbol2,
                                frameW: frameWSettedSymbol2,
                                framwH: frameHSettedSymbol2,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.19),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.68),
                                opaqued: opaqued,
                                rotated: 69),
            ACYAuthBackgroundEntity(id: id + 63,
                                image: .authBackgroundSymbol2,
                                frameW: frameWSettedSymbol2,
                                framwH: frameHSettedSymbol2,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.59),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.79),
                                opaqued: opaqued,
                                rotated: 69),
            ACYAuthBackgroundEntity(id: id + 64,
                                image: .authBackgroundSymbol2,
                                frameW: frameWSettedSymbol2,
                                framwH: frameHSettedSymbol2,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.39),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.79),
                                opaqued: opaqued,
                                rotated: 69),
            ACYAuthBackgroundEntity(id: id + 65,
                                image: .authBackgroundSymbol2,
                                frameW: frameWSettedSymbol2,
                                framwH: frameHSettedSymbol2,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.19),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.86),
                                opaqued: opaqued,
                                rotated: 69),
            ACYAuthBackgroundEntity(id: id + 66,
                                image: .authBackgroundSymbol2,
                                frameW: frameWSettedSymbol2,
                                framwH: frameHSettedSymbol2,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.49),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.89),
                                opaqued: opaqued,
                                rotated: 69),
            ACYAuthBackgroundEntity(id: id + 67,
                                image: .authBackgroundSymbol2,
                                frameW: frameWSettedSymbol2,
                                framwH: frameHSettedSymbol2,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.29),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.59),
                                opaqued: opaqued,
                                rotated: 69),
            ACYAuthBackgroundEntity(id: id + 68,
                                image: .authBackgroundSymbol2,
                                frameW: frameWSettedSymbol2,
                                framwH: frameHSettedSymbol2,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.79),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.69),
                                opaqued: opaqued,
                                rotated: 69),
            ACYAuthBackgroundEntity(id: id + 69,
                                image: .authBackgroundSymbol2,
                                frameW: frameWSettedSymbol2,
                                framwH: frameHSettedSymbol2,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.79),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.69),
                                opaqued: opaqued,
                                rotated: 69),
            ACYAuthBackgroundEntity(id: id + 70,
                                image: .authBackgroundSymbol2,
                                frameW: frameWSettedSymbol2,
                                framwH: frameHSettedSymbol2,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.9),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.89),
                                opaqued: opaqued,
                                rotated: 69),
            ACYAuthBackgroundEntity(id: id + 71,
                                image: .authBackgroundSymbol2,
                                frameW: frameWSettedSymbol2,
                                framwH: frameHSettedSymbol2,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.9),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.36),
                                opaqued: opaqued,
                                rotated: 69),
            ACYAuthBackgroundEntity(id: id + 72,
                                image: .authBackgroundSymbol2,
                                frameW: frameWSettedSymbol2,
                                framwH: frameHSettedSymbol2,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.9),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.16),
                                opaqued: opaqued,
                                rotated: 69),
            ACYAuthBackgroundEntity(id: id + 73,
                                image: .authBackgroundSymbol2,
                                frameW: frameWSettedSymbol2,
                                framwH: frameHSettedSymbol2,
                                positionX: setBackgroundPositionW(plane: planeX, position: positionX, dw: 0.05),
                                positionY: setBackgroundPositionH(plane: planeY, position: positionY, dh: 0.8),
                                opaqued: opaqued,
                                rotated: 69)
            // MARK: AuthBackground changeAuthBackgroundMode2 authBackgroundSymbol1 End -
        ]
        return authBackgroundModelData
    }
    //NextPatchTODO: Will be madded
    /// To be able to adjust the positions and to output the parameters we use to the objects as a result
    /// - Parameters:
    ///   - plane: planeX will come there
    ///   - position: positionX will come there
    ///   - dw: This value is calculated as weight
    /// - Returns: It returns a double value, you can use it in positionX
    private func setBackgroundPositionW(plane: Bool ,position: Double, dw: Double) -> Double {
        (plane ? 1 * (position + ACYdw(aiachyState, d: dw)) : -1 * (position + ACYdw(aiachyState, d: dw)) )
    }
    /// To be able to adjust the positions and to output the parameters we use to the objects as a result
    /// - Parameters:
    ///   - plane: planeY will come there
    ///   - position: positionY will come there
    ///   - dh: This value is calculated as height
    /// - Returns: It returns a double value, you can use it in positionY
    private func setBackgroundPositionH(plane: Bool ,position: Double, dh: Double) -> Double {
        (plane ? 1 * (position + ACYdh(aiachyState, d: dh)) : -1 * (position + ACYdh(aiachyState, d: dh)) )
    }
}
private let dataloski: [ACYAuthBackgroundEntity] = [
    
]
