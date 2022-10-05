//
//  CardModel.swift
//  Learn By Doing
//
//  Created by Hasan Basri Öztürk on 5.10.2022.
//

import SwiftUI

// MARK: - CARD MODEL
struct Card: Identifiable {
  var id = UUID()
  var title: String
  var headline: String
  var imageName: String
  var callToAction: String
  var message: String
  var gradientColors: [Color]
}
