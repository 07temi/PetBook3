//
//  MotherView.swift
//  PetBook
//
//  Created by Артем Черненко on 11.07.2022.
//

import SwiftUI

struct MotherView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        switch viewRouter.currentPage {
        case .page1:
            DMTestMainScreen()
        case .page2(petTest: let petTest):
            DMTabViewScreen(selectedPet: petTest)
                .transition(.slide)
        case .page3:
            AddPetScreen()
                .transition(.scale)
        }
    }
}
