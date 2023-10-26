import SwiftUI
import Combine

struct ContentView: View {
    @State private var ballPosition = CGPoint(x: 200, y: 200)
    @State private var ballDirection = CGSize(width: 15, height: 15)
    @State private var paddlePosition = CGFloat(200)
    @State private var rightPaddlePosition = CGFloat(200)
    @GestureState private var dragOffset = CGSize.zero
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 20, height: geometry.size.height / 4)
                    .position(x: 20, y: paddlePosition)
                
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 20, height: geometry.size.height / 4)
                    .position(x: geometry.size.width - 20, y: rightPaddlePosition + dragOffset.height)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                self.rightPaddlePosition = value.location.y
                            }
                    )
                
                Circle()
                    .fill(Color.white)
                    .frame(width: 50, height: 50)
                    .position(ballPosition)
                    .onReceive(timer) { _ in
                        self.ballPosition = CGPoint(x: self.ballPosition.x + self.ballDirection.width, y: self.ballPosition.y + self.ballDirection.height)
                        
                        if self.ballPosition.x <= 20 || self.ballPosition.x >= geometry.size.width - 20 {
                            self.ballPosition = CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2)
                            self.ballDirection.width *= -1
                        }
                        
                        if self.ballPosition.y <= 0 || self.ballPosition.y >= geometry.size.height {
                            self.ballDirection.height *= -1
                        }
                        
                        if self.ballPosition.x <= 250 {
                            self.paddlePosition = self.ballPosition.y - 10
                        }

                        let paddleFrame = CGRect(x: 20, y: self.paddlePosition - geometry.size.height / 8, width: 20, height: geometry.size.height / 4)
                        let rightPaddleFrame = CGRect(x: geometry.size.width - 40, y: self.rightPaddlePosition - geometry.size.height / 8, width: 20, height: geometry.size.height / 4)
                       let ballFrame = CGRect(x: self.ballPosition.x - 25, y: self.ballPosition.y - 25, width: 50, height: 50)

                        if paddleFrame.intersects(ballFrame) || rightPaddleFrame.intersects(ballFrame) {
                            self.ballDirection.width *= -1
                        }
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}