import SwiftUI



struct MyComponentView: View {

@BInding var isPresented: Bool

    var body: some View {

        VStack(alignment: .center) {
            Text("Hello World!") // 在这里放置你想要显示的内容
                .font(.title)

            Button(action: {
                print("Button tapped!") // 点击按钮时触发的操作
            }) {
                Text("Click me!")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}

// 将MyComponentView添加到其他视图中进行展示
struct ContentView: View {
    var body: some View {
        VStack {
            MyComponentView()
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif