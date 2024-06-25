import UIKit

// 도형 프로토콜
protocol Shape {
    var numberOfSides: Int? { get set }
    var area: Double { get }
    func description() -> String
}

// Rect(사각형) 클래스 - Shape 프로토콜 준수
// width: Double, height: Double - stored property
// perimeter: Double, area: Double - computed property
class Rect : Shape {
    ......
    ......
}

// Circle(원) 클래스 - Shape 프로토콜 준수
// radius: Double - stored property
// curcumference: Double, area: Double - computed property
class Circle : Shape {
    ......
    ......
}

// 도형 배열
var shapeArray: [Shape] = []
let rect = Rect(width: 20.5, height: 30.7)
shapeArray.append(rect)
let circle = Circle(radius: 10.7)
shapeArray.append(circle)
shapeArray.append(Rect(width: 30.3, height: 40.2))
shapeArray.append(Circle(radius: 15.5))
printShape(shapeArray)

// 도형 배열 내 도형 정보 출력 함수
// 배열 내 도형이 Circle 타입인지 아니면 Rect 타입인지에 따라
// 해당 타입으로 변환 후, 원주 또는 둘레를 출력
func printShape(_ shapes: [Shape]) {
    ......
    ......
}

