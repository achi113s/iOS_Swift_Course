//
//  InfoView.swift
//  GiorgioCard
//
//  Created by Giorgio Latour on 3/11/23.
//

import SwiftUI

struct InfoView: View {
    
    let text: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 40)
            .fill(Color("midGray"))
            .frame(height: 50)
            .overlay(HStack {
                Image(systemName: imageName).foregroundColor(Color("cream"))
                Text(text)
                    .foregroundColor(Color("cream"))
                    .font(.system(size: 20))
            }).padding(.all)
    }
}


struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "Hello", imageName: "phone.fill")
            .previewLayout(.sizeThatFits)
    }
}
