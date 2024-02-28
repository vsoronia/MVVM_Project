//
//  CustomCircleView.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 27/2/24.
//

import SwiftUI

struct CustomCircleView: View {
    @State var ShapeColor: Color
    @State var ShapeOpacity: Double
    @State private var isAnimating: Bool = false
    
    // MARK: - BODY
    
    var body: some View {
      ZStack {
        Circle()
          .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
          .frame(width: 260, height: 260, alignment: .center)
        Circle()
          .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80)
          .frame(width: 260, height: 260, alignment: .center)
      }
      .blur(radius: isAnimating ? 0 : 10)
      .opacity(isAnimating ? 1 : 0)
      .scaleEffect(isAnimating ? 1 : 0.5)
      .animation(.easeOut(duration: 1), value: isAnimating)
      .onAppear(perform: {
        isAnimating = true
      })
    }
  }

  // MARK: - PREVIEW

  struct CustomCircleView_Previews: PreviewProvider {
    static var previews: some View {
      ZStack {
        Color("ColorBlue")
          .ignoresSafeArea(.all, edges: .all)
        
          CustomCircleView(ShapeColor: .white, ShapeOpacity: 0.2)
      }
    }
  }


