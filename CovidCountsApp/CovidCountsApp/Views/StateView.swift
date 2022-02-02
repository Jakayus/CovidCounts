//
//  StateView.swift
//  CovidCountsApp
//
//  Created by Joel Sereno on 10/14/21.
//

import SwiftUI

struct StateView: View {
    
    //MARK: PROPERTIES
    var stateData : StateData
    
    //MARK: VIEW
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .gray, .orange]), startPoint: .bottomTrailing, endPoint: .center)
            .ignoresSafeArea()
            VStack {
                VStack {
                    Text("\(stateData.state)")
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.gray)
                        .cornerRadius(5)
                    Text("CASES: \(stateData.cases)")
                        .foregroundColor(.white)
                        .bold()
                }
                .padding()
                .padding()
                .padding(.horizontal)
                .background(Color.black)
                .cornerRadius(10)
                .opacity(0.8)
                
                //TODO: The below code has a performance issue, investigate
    //            Image("us_map1")
    //                .resizable()
    //                .aspectRatio(contentMode: .fill)
    //                .ignoresSafeArea()
    //                .overlay (
    //                    VStack {
    //                        Text("\(stateData.state)")
    //                            .font(.system(.title, design: .rounded))
    //                            .fontWeight(.heavy)
    //                            .foregroundColor(.white)
    //                            .padding()
    //                            .background(Color.gray)
    //                            .cornerRadius(5)
    //                        Text("CASES: \(stateData.cases)")
    //                            .foregroundColor(.white)
    //                            .bold()
    //                    }
    //                    .padding()
    //                    .padding()
    //                    .padding(.horizontal)
    //                    .background(Color.black)
    //                    .cornerRadius(10)
    //                    .opacity(0.8)
    //                    ,alignment: .center
    //                )
                
            }
        }
    }
}

struct StateView_Previews: PreviewProvider {
    static var previews: some View {
        StateView(stateData: StateData.fl)
    }
}


