//
//  SwiftUIView.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 1/4/24.
//

import SwiftUI

struct SwiftUIView: View {
    
    @State var position = 0
    
    var body: some View {
        VStack(alignment: .leading) {
                    Rectangle()
                        .frame(width: 50, height: 200)
                        .alignmentGuide(.leading, computeValue: { d in
                            black(d)
                        })
            HStack(alignment: .bottom) {
                Text("Testing the alignment")
                    .frame(width: 250)
                    .padding(.vertical)
                    .border(.red)
                    .alignmentGuide(.bottom, computeValue: { d in
                        testingText(d)
                    })
                
                Rectangle()
                    .foregroundStyle(.blue)
                    .frame(width: 100, height: 100)
                    .alignmentGuide(.bottom, computeValue: {d in blueSquare(d) })
            }
            .alignmentGuide(.leading, computeValue: { d in
                hStack(d)
                                    })
            
                    
                    Rectangle()
                        .foregroundStyle(.red)
                        .frame(width: 50, height: 50)

                }
                .padding()
                .border(.red)
        
        Button(action: 
                { withAnimation(.easeInOut(duration: 1.0)) { if position<3
            {position += 1}
            else {
                position = 0
            }}}
                ,
               label: {Text("Solve")
                .padding(4)
                .border(Color.black)
                .font(.title3)
        })
        
    }
    
    func testingText(_ d: ViewDimensions) -> CGFloat {
        if position == 0 {
            return -90
        } else if position == 1 {
            return d[.top]
        } else if position == 2 {
            return d[.top]
        } else if position == 3 {
            return 100
        } else {
            return 0
        }
    }
    
    func blueSquare(_ d: ViewDimensions) -> CGFloat {
        if position == 0 {
            return 0
        } else if position == 1 {
            return -90
        } else if position == 2 {
            return -90
        } else if position == 3 {
            return -90
        } else {
            return 0
        }
    }
    
    func hStack(_ d: ViewDimensions) -> CGFloat {
        if position == 0 {
            return 0
        } else if position == 1 {
            return 0
        } else if position == 2 {
            return d[HorizontalAlignment.center]
        }else if position == 3 {
                return d[HorizontalAlignment.center]
        } else {
            return 0
        }
    }

    func black(_ d: ViewDimensions) -> CGFloat {
        if position == 0 {
            return 0
        } else if position == 1 {
            return 0
        } else if position == 2 {
            return -100
        } else if position == 3 {
            return -100
        } else {
            return 0
        }
    }
    
}

#Preview {
    SwiftUIView()
}
