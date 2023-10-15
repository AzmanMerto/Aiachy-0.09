//
//  AscendantSelectionView.swift
//  Aiachy
//
//  Created by Mert Türedü on 19.07.2023.
//

import SwiftUI
//MARK: AscendantSelectionView - View
struct AscendantSelectionView: View {
    
    @StateObject var presenter: AscendantSelectionPresenter
    var aiachyState: AiachyState
    let router: AuthRouterPresenter
    
    init(aiachy aiachyState: AiachyState,
         router: AuthRouterPresenter) {
        self._presenter = StateObject(wrappedValue: AscendantSelectionPresenter(aiachy: aiachyState,
                                                                                router: router))
        self.aiachyState = aiachyState
        self.router = router
    }
    
    var body: some View {
        ZStack {
            AuthBackground()
            //MARK: AscendantSelectionView - Background Image
            Image(ImageHandler.makeAuthString(aiachyState, auth: .ascendantSelectionBackground))
            .resizable()
            .scaledToFit()
            .opacity(0.2)
            .padding(.all,15)
            VStack(spacing: 20) {
                //MARK: AscendantSelectionView - BackButton
                backButton
                //MARK: AscendantSelectionView - Tittle & Description
                titleAndDescription
                //MARK: AscendantSelectionView - Choose Location
                chooseLocation
                //MARK: AscendantSelectionView - Date Picker
                datePickers
                //MARK: AscendantSelectionView - Hour And Minute Picker
                hourAndMinutePicker
                Spacer()
                //MARK: AscendantSelectionView - Upload value button
                ACYButton(text: .continue) {
                    print(presenter.userHour)
                    presenter.checkValues(aiachyState: aiachyState) {
                        router.navigate(to: .attentionView)
                    }
                }
            }
        }
        .sheet(isPresented: $presenter.isPressedLocationButton, content: {
            //MARK: AscendantSelectionView - Sheet View
            sheetView
        })
        .overlay(content: {
            if presenter.acyAlertEntity.isShowingAlert {
                ACYAlertView(acyAlertEntity: presenter.acyAlertEntity)
            }
        })
        .onAppear {
            presenter.updateValuesFromState(aiachyState: aiachyState)
        }
        .environmentObject(aiachyState)
        .makeAccessibilitysForUITest(identifier: "AscendantSelectionViewID")
    }
}
//MARK: AscendantSelectionView - Previews
#Preview("AscendantSelectionView") {
    AscendantSelectionView(aiachy: ACY_PREVIEWS_STATE, router: AuthRouterPresenter())
}
//MARK: AscendantSelectionView - Extension
extension AscendantSelectionView {
    //MARK: AscendantSelectionView - Back Button
    private var backButton: some View {
        HStack {
            ACYPassButton(isItBackButton: true, 
                          text: .back) {
                router.navigate(to: .registerView)
            }
            Spacer()
        }
        .padding(.horizontal)
    }
    //MARK: AscendantSelectionView - Tittle & Description
    private var titleAndDescription: some View {
        ACYTitleAndDescriptionText(title: TextHandler.makeAuthTitleString(aiachy: aiachyState,
                                                                     title: .ascendantSelectionTitle),
                                   description: TextHandler.makeAuthDescriptionString(aiachy: aiachyState,
                                                                           description: .ascendantSelectionDescription))
    }
    //MARK: AscendantSelectionView - Choose Location
    private var chooseLocation: some View {
        ACYAlternativeButton(text: .chooseLocation,stringText: presenter.makeChosenLocation()) {
            presenter.isPressedLocationButton.toggle()
        }
    }
    //MARK: AscendantSelectionView - Date Pickker
    @ViewBuilder
    private var datePickers: some View {
        VStack(spacing: 0) {
            DatePicker("", selection: $presenter.userDate,
                       displayedComponents: .date)
            .datePickerStyle(.wheel)
            .tint(Color(ColorHandler.makeAiachyColor(aiachyState, aiachyColor: .firstColor)))
            .padding(.horizontal)
        }
    }
    //MARK: AscendantSelectionView - Hour And Minute Picker
    private var hourAndMinutePicker: some View {
        HStack {
            Text(TextHandler.makeAuthHelperAuthString(aiachy: aiachyState, helperAuth: .clock))
                .font(FontHandler.aiachyFont(.roundedBold16))
            Spacer()
            Picker("Hour", selection: $presenter.userHour) {
                ForEach(0..<24) { hour in
                    Text("\(hour)").tag(hour)
                }
            }
            .labelsHidden()
            .pickerStyle(.menu)
            .makeAccessibilitysForUITest(identifier: "hourAndMinutePickerHOURID")
            
            Picker("Minute", selection: $presenter.userMinute) {
                ForEach(0..<60) { minute in
                    Text("\(minute < 10 ? "0" : "")\(minute)").tag(minute)
                }
            }
            .labelsHidden()
            .pickerStyle(.menu)
            .makeAccessibilitysForUITest(identifier: "hourAndMinutePickerMINUTEID")
        }
        .padding(.horizontal)
        .foregroundStyle(Color(ColorHandler.makeAiachyColor(aiachyState, aiachyColor: .fifthColor)))
        .tint(Color(ColorHandler.makeAiachyColor(aiachyState, aiachyColor: .fifthColor)))
    }
}

extension AscendantSelectionView {
    //MARK: AscendantSelectionView - Sheet View
    @ViewBuilder
    var sheetView: some View {
        ZStack {
            Color(ColorHandler.makeAiachyColor(aiachyState, aiachyColor: .backgroundColor))
                .ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: true) {
                ACYTextField(textfieldString: $presenter.searchText, errorType: .constant(0), textFieldTitle: .place)
                    .onChange(of: presenter.searchText ) { newValue in
                        presenter.searchPublisher.send(newValue)
                    }
                    .padding(.top)
                ForEach(presenter.places) { place in
                    VStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color(ColorHandler.makeAiachyColor(aiachyState, aiachyColor: .thirdColor)))
                            .frame(height: 50)
                            .overlay {
                                Text("\(place.town),\(place.city),\(place.country)")
                                    .foregroundStyle(Color(ColorHandler.makeAiachyColor(aiachyState, aiachyColor: .thirdColor)))
                            }
                            .onTapGesture {
                                presenter.userCountry = place.country
                                presenter.userProvince = place.city
                                presenter.userDistrict = place.town
                                presenter.isPressedLocationButton.toggle()
                            }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}
