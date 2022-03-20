//
//  HomeContentView.swift
//  FDJTest
//
//  Created by Ibrahima KH GUEYE on 19/03/2022.
//

import SwiftUI

struct HomeContentView: View {

    var body: some View {
        NavigationView {
            ListImageView()
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

