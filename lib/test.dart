abstract class Area {

  const Area();
  double computeArea();

}

class Rectangle extends Area {

  final double width;
  final double height;
  const Rectangle(this.width, this.height);

  @override
  double computeArea() => width * height;
}

class Circle extends Area {

  final double radius;
  const Circle(this.radius);

  @override
  double computeArea() {
    print("radius  --- ${radius * radius * 3.1415}");
    return radius * radius * 3.1415
  ;}
}

class AreaCalculator {
  double calculate(Area shape) {
    print("calculate Area --- ${shape.computeArea()}");
     return shape.computeArea();
  }
}


main(){
   Circle circle = Circle(5);
   circle.computeArea();
   AreaCalculator calculator = AreaCalculator();

}