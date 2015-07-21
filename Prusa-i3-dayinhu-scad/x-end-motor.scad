// PRUSA iteration3
// X end motor
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

use <inc/x-end.scad>

module x_end_motor_base(){
 x_end_base();
 translate(v=[-15,31,26.5]) cube(size = [17,44,53], center = true);
}

module x_end_motor_holes(){
 x_end_holes();
 // Position to place
 translate(v=[-1,32,30.25]){
  // Belt hole
  translate(v=[-14,1,0]) cube(size = [10,46,22], center = true);
  // Motor mounting holes
  translate(v=[20,-15.5,-15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 70, r=1.8, $fn=30);
  translate(v=[1,-15.5,-15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 10, r=3.1, $fn=30);
 

  translate(v=[20,-15.5,15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 70, r=1.8, $fn=30);
  translate(v=[1,-15.5,15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 10, r=3.1, $fn=30);


  translate(v=[20,15.5,-15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 70, r=1.8, $fn=30);
  translate(v=[1,15.5,-15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 10, r=3.1, $fn=30);


  translate(v=[20,15.5,15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 70, r=1.8, $fn=30);
  translate(v=[1,15.5,15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 10, r=3.1, $fn=30);

  // Material saving cutout 
  // translate(v=[-10,12,10]) cube(size = [60,42,42], center = true);

  // Material saving cutout
  translate(v=[-10,40,-30]) rotate(a=[45,0,0])  cube(size = [60,42,42], center = true);
  // Motor shaft cutout
//  translate(v=[0,0,0]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 70, r=17, $fn=6);
  intersection() {
    translate(v=[0,0,0]) cube(size = [50,50,17*sqrt(3)], center = true);
    translate(v=[0,17,0]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h=70, r=17*sqrt(3));
    translate(v=[0,-17,0]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h=70, r=17*sqrt(3));
  }

 }

  // Upper right corner
  difference() {
    translate(v=[-10,50.5,50.5]) cube(size = [60,5,5], center = true);
    translate(v=[-10,48,48]) rotate(a=[0,-90,0]) cylinder(h = 61, r=5, center = true);
  }

}

// Final part
module x_end_motor(){
 difference(){
  x_end_motor_base();
  x_end_motor_holes();
 }

// support
  translate(v=[-15,32,30.25]) {
    translate(v=[0, 2.83, 0]) cube(size=[17,0.8,17*sqrt(3)], center=true);
    translate(v=[0, -2.83, 0]) cube(size=[17,0.8,17*sqrt(3)], center=true);
  }
}

x_end_motor();