//
//  ChatView.swift
//  MessengerProgram
//
//  Created by hyobeom seo on 2023/02/04.
//

import SwiftUI
import PhotosUI

struct ChatView: View {
    @State private var personImage = Image(systemName: "person.circle.fill")
    @State private var selectedPhoto: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    @State private var retrieveImage: UIImage? = nil

    var body: some View {
        PhotosPicker (
            selection: $selectedPhoto,
            matching: .images,
            photoLibrary: .shared())
            {
                personImage
            }
            .onChange(of: selectedPhoto) { newItem in
                Task {
                    if let data = try? await newItem?.loadTransferable(type: Data.self) {
                        selectedImageData = data
                        if selectedImageData != nil {
                            personImage = Image(uiImage: UIImage(data: selectedImageData!)!)
                        }
                    }
                }
            }
            .foregroundColor(Color.blue)
            .font(.system(size:200))
            .frame(width: 200.0, height: 200.0)
            .aspectRatio(contentMode: .fill)
            .clipShape(Circle())
        
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
