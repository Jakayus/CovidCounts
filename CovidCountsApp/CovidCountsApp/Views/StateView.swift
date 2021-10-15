//
//  StateView.swift
//  CovidCountsApp
//
//  Created by Joel Sereno on 10/14/21.
//

import SwiftUI

struct StateView: View {
    
    //MARK: Properties
    var stateData : StateData
    
    var body: some View {
        VStack {
            
            Image("us_map1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .overlay (
                    VStack {
                        Text("STATE NAME: \(stateData.state)")
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.gray)
                            .cornerRadius(5)
                        Text("CASES: NUMBER")
                            .foregroundColor(.white)
                            .bold()
                        Text("POPULATION: NUMBER")
                            .foregroundColor(.white)
                            .bold()
                    }
                    .padding()
                    .padding()
                    .padding(.horizontal)
                    .background(Color.black)
                    .cornerRadius(10)
                    .opacity(0.8)
                    ,alignment: .center
                )
            
        }
    }
}

//struct StateView_Previews: PreviewProvider {
//    static var previews: some View {
//        StateView()
//    }
//}
//

