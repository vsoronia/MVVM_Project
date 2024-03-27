//
//  ToDosListRowView.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 8/2/24.
//

import SwiftUI

struct ToDosListRowView: View {
    
    let viewModel: ToDosListRowViewModel
        
        init(viewModel: ToDosListRowViewModel) {
            self.viewModel = viewModel
        }
    
    var body: some View {
        
        HStack(alignment: .top) {
            Text(viewModel.user)
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.horizontal, 8)
                        

            VStack(alignment: .leading) {
                Text(viewModel.title)
                    .font(.headline)
                
                Text(" \(viewModel.timeLeft())")
                    .font(.subheadline)
                
            }
            Spacer()
            
            let isPending = viewModel.statusIsPending()
            isPending.statusSymbol
                .foregroundStyle(Color(isPending.statusColor))
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(5)

        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(color: .gray.opacity(0.2), radius: 3, x: 1, y: 2)
    }
}

#Preview {
    ToDosListRowView(viewModel: ToDosListRowViewModel(user: "user", title: "title", dueOn: "2024-02-09T18:00:00.000+05:30", taskStatus: false))
}
