//
//  ActionListView.swift
//  TestTask1221
//
//  Created by Анастасия Талмазан on 2024-08-08.
//

import SwiftUI

struct ActionListView: View {
    
    @Binding var isLiked: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            Button {
                print("info")
            } label: {
                Image("InfoImage")
                    .frame(width: 16, height: 16)
                    .padding(8)
            }
            Button {
                isLiked.toggle()
            } label: {
                if isLiked {
                    Image("ActiveHeartImage")
                } else {
                    Image("HeartImage")
                }
            }
            .frame(width: 16, height: 16)
            .padding(8)
        }
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color("TextStatic001").opacity(0.8))
        )
    }
}

struct ActionListView_Previews: PreviewProvider {
    @State static var isLiked: Bool = false
    
    static var previews: some View {
        ActionListView(isLiked: $isLiked)
    }
}
