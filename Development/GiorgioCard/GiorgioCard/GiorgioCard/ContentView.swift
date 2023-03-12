//
//  ContentView.swift
//  GiorgioCard
//
//  Created by Giorgio Latour on 3/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color("mossGreen")
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("giorgio")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150.0, height: 150.0)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color("midGray"), lineWidth: 5))
                Text("Giorgio Latour")
                    .font(Font.custom("WorkSans-Bold", size: 40))
                    .bold()
                .foregroundColor(Color("cream"))
                Text("iOS Developer")
                    .foregroundColor(Color("cream"))
                    .font(.system(size: 25))
                Divider()
                InfoView(text: "123-456-7890", imageName: "phone.fill")
                InfoView(text: "giorgio@email.com", imageName: "mail.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
