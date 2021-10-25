//
//  ContentView.swift
//  BindingPropertyDemo
//
//  Created by Farkhod on 25.10.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = true
    @State private var isShowingSheet = false
    
    var body: some View {
        ZStack {
            Color(isNight ? .black : .systemBlue).ignoresSafeArea()
            
            VStack {
                TimeOfDayImage(imageTitle: isNight ? "moon.stars.fill" : "cloud.sun.fill")
                
                Button {
                    isShowingSheet = true
                } label: {
                    ButtonLabel(title: "Change time of day", imageName: "clock.fill", color: .green)
                }
                .padding(.top, 100)
            }
        }
        .sheet(isPresented: $isShowingSheet, content: {
            ChangeTimeOfDayView(isNight: $isNight)
        })
    }
}


struct TimeOfDayImage: View {
    var imageTitle: String
    var body: some View {
        Image(systemName: imageTitle)
            .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 180)
    }
}

struct ButtonLabel: View {
    var title: String
    var imageName: String
    var color: Color
    
    var body: some View {
        Label(title, systemImage: imageName)
            .frame(width: 280, height: 50)
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(12)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
