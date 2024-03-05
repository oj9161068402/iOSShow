//
//  ContentView.swift
//  SwiftUILearning
//
//  Created by nge0131 on 2023/8/23.
//

import SwiftUI

struct ContentView: View {
    private let text: Text = Text("Stay\n").font(.title).foregroundColor(.red) + Text("Hungary")
        .foregroundColor(.yellow)
        .font(.title2)
        .italic()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            
            Label("learning", systemImage: /*@START_MENU_TOKEN@*/"42.circle"/*@END_MENU_TOKEN@*/)
            
            // MARK: - Text
            text
            Text(LocalizedStringKey.init("Hungry"))
            
            
            // MARK: - Label
            Label("Swift", systemImage: "swift")
                .foregroundColor(.orange)
            Label {
                Text("Apple")
            } icon: {
                Image(systemName: "applelogo")
            }
            .foregroundColor(.blue)
            Label {
                Image(systemName: "gift.fill")
                    .renderingMode(Image.TemplateRenderingMode.original)
            } icon: {
                Text("Gift")
            }
            .foregroundColor(.red)
            .labelStyle(.titleAndIcon)
            
            Label {
                Text("Apple")
            } icon: {
                Image(systemName: "applelogo")
            }
            .foregroundColor(.blue)
            .labelStyle(ShadowLabelStyle())
            
//            Label("Apple", systemImage: "applelogo")
//                .foregroundColor(.blue)
//                .labelStyle(VerticalLabelStyle())
            
            Label("Apple", systemImage: "applelogo")
                .foregroundColor(.blue)
                .labelStyle(ShadowLabelStyle())
                .labelStyle(LeftRightAligmentLabelStyle())
            
            
        }
        .padding()
    }
    
}

// MARK: - Label的阴影样式
struct ShadowLabelStyle: LabelStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        Label(configuration)
            .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 5)
    }
}

// MARK: - Label垂直布局样式
struct VerticalLabelStyle: LabelStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .center, spacing: 10) {
            configuration.icon
            configuration.title
        }
    }
}

// MARK: - Label左右对齐样式
struct LeftRightAligmentLabelStyle: LabelStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: .center, spacing: 10) {
            configuration.icon.foregroundColor(.blue)
            Spacer()
            configuration.title
                .foregroundColor(.green)
        }
        .padding()
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
