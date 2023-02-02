//
//  TestUI.swift
//  MessengerProgram
//
//  Created by hyobeom seo on 2023/02/03.
//

import SwiftUI

struct TestUI: View {
    @State private var isLoading = true
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).modifier(LoadingAlert(isPresented: $isLoading))
    }
}

struct TestUI_Previews: PreviewProvider {
    static var previews: some View {
        TestUI()
    }
}

struct LoadingAlert:ViewModifier {
    @Binding var isPresented: Bool
    
    func body(content: Content) -> some View {
        content
            .alert(isPresented: $isPresented) {
            Alert(title: Text(NSLocalizedString("Loading", comment: "")), dismissButton: .none)
        }
    }
}
