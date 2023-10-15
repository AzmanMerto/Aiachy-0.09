//
//  AscendantSelectionView.swift
//  Aiachy
//
//  Created by Mert Türedü on 19.07.2023.
//

import SwiftUI
//MARK: AscendantSelectionView - View
struct AscendantSelectionView: View {
    
    @EnvironmentObject var aiachyState: AiachyState
    @ObservedObject var presenter = AscendantSelectionPresenter()
    let router: AuthRouterPresenter
    
    var body: some View {
        ZStack {
            //MARK: AscendantSelectionView - Background Image
            backgroundImage
            VStack {
                //MARK: AscendantSelectionView - BackButton
                backButton
                //MARK: AscendantSelectionView - Tittle & Description
                titleAndDescription
                //MARK: AscendantSelectionView - Choose Location
                ACYAlternativeButton(text: presenter.makeButtonText() ) {
                    presenter.isPressedLocationButton.toggle()
                }
                //MARK: AscendantSelectionView - Date Picker
                datePickers
                    .makeAccessibilitysForUITest(identifier: "3131")
                Spacer()
                //MARK: AscendantSelectionView - Upload value button
                ACYButton(text: ACYTextHelper.ACYAppText.ACYappButtonText.ContinueButton.rawValue) {
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
            if presenter.isShowingACYAlert {
                ACYAlertView(alertTitle: presenter.alertTitle!,
                             isNeedImage: false,
                             isNeedSecondButton: false,
                             alertFirstButtonText: .TryAgainButton) {
                    presenter.isShowingACYAlert.toggle()
                }
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
struct AscendantSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack(content: {
            AuthBackground()
            AscendantSelectionView(router: AuthRouterPresenter())
        })
            .environmentObject(ACY_PREVIEWS_STATE)
    }
}
//MARK: AscendantSelectionView - Extension
extension AscendantSelectionView {
    //MARK: AscendantSelectionView - Sheet View
    @ViewBuilder
    var sheetView: some View {
        ZStack {
            Color.AiachyColor(aiachyState, aiachyColor: .backgroundColor)
                .ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: true) {
                ACYTextField(textfieldString: $presenter.searchText, errorType: .constant(0), textFieldTitle: .PlaceTextField)
                    .onChange(of: presenter.searchText ) { newValue in
                                        presenter.searchPublisher.send(newValue)
                                    }
                    .padding(.top)
                ForEach(presenter.places) { place in
                               VStack(alignment: .leading) {
                                   RoundedRectangle(cornerRadius: 20)
                                       .stroke(Color.AiachyColor(aiachyState, aiachyColor: .thirdColor))
                                       .frame(height: 50)
                                       .overlay {
                                           Text("\(place.town),\(place.city),\(place.country)")
                                               .foregroundColor(.AiachyColor(aiachyState, aiachyColor: .thirdColor))
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
    //MARK: AscendantSelectionView - Tittle & Description
    @ViewBuilder
    private var titleAndDescription: some View {
        ACYTitleAndDescriptionText(titleText: ACYTextHelper.ACYAuthText.ACYauthTitleText.AscendantSelectionViewTitle.rawValue,
                                   descriptionText: ACYTextHelper.ACYAuthText.ACYauthDescriptionText.AscendantSelectionViewDescription.rawValue)
    }
    //MARK: AscendantSelectionView - Background Image
    private var backgroundImage: some View {
        Image.setACYBackgroundImage(aiachyState,
                                    background: .authAscendantSelectionBackground)
        .resizable()
        .scaledToFit()
        .opacity(0.2)
        .padding(.all,15)
    }
    //MARK: AscendantSelectionView - Back Button
    private var backButton: some View {
        HStack {
            ACYPassButton(isItBackButton: true, text: ACYTextHelper.ACYAppText.ACYappButtonText.BackButton.rawValue) {
                router.navigate(to: .registerView)
            }
            Spacer()
        }
        .padding(.horizontal)
    }
    //MARK: AscendantSelectionView - Date Pickker
    @ViewBuilder
    private var datePickers: some View {
        VStack(spacing: 0) {
            DatePicker("", selection: $presenter.userDate,
                       displayedComponents: .date)
            .datePickerStyle(.graphical)
            .tint(.AiachyColor(aiachyState, aiachyColor: .firstColor))
            .padding(.horizontal)
            .makeAccessibilitysForUITest(identifier: "datePickersID")
            //MARK: AscendantSelectionView - Hour And Minute Picker
            hourAndMinutePicker
        }
    }
    //MARK: AscendantSelectionView - Hour And Minute Picker
    private var hourAndMinutePicker: some View {
        HStack {
            Text(ACYTextHelper.ACYAppText.ACYNameText.ClockNameText.rawValue.locale())
                .font(.aiachyFont(.roundedBold16))
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
        .foregroundColor(Color.AiachyColor(aiachyState, aiachyColor: .fifthColor))
        .tint(Color.AiachyColor(aiachyState, aiachyColor: .fifthColor))
    }
}
