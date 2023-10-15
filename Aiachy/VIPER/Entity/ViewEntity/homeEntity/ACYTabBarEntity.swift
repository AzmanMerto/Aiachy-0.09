//
//  ACYTabBarEntity.swift
//  Aiachy
//
//  Created by Mert Türedü on 13.08.2023.
//

import Foundation

struct ACYTabBarEntity: Identifiable {
    var id: Int
    var isZodiac: Bool?
    var widthCircle: Double
    var widthImage: Double
    var routering: HomeViewsEnum
    var selectedImage: ImageHelper.HomeCompletion.tabBarLogo?
    var unSelectedImage: ImageHelper.HomeCompletion.tabBarLogo?
}
