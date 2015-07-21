// PRUSA iteration3
// X end idler
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

use <inc/x-end.scad>

module x_end_idler_base(){
 x_end_base();
}

module x_end_idler_holes(){
 //x_end_holes();
// translate(v=[0,-22,30.25]) rotate(a=[0,-90,0]) cylinder(h = 80, r=1.8, $fn=30);
// translate(v=[1.5,-22,30.25]) rotate(a=[0,-90,0]) cylinder(h = 10, r=3.1, $fn=30);
// translate(v=[-21.5,-22,30.25]) rotate(a=[0,-90,0]) rotate(a=[0,0,30]) cylinder(h = 80, r=3.6, $fn=6);

//  translate([0,-22,30.25]) rotate([0,-90,0]) cylinder(h=80,r=2.9,$fn=30);


 translate(v=[0,-22,30.25]) rotate(a=[0,-90,0]) cylinder(h = 80, r=2.6, $fn=30);
 translate(v=[1.5,-22,30.25]) rotate(a=[0,-90,0]) cylinder(h = 10, r=5.0, $fn=30);
 translate(v=[-21.5,-22,30.25]) rotate(a=[0,-90,0]) rotate(a=[0,0,30]) cylinder(h = 80, r=5.0, $fn=6);
}
 
// Final part
module x_end_idler(){
 mirror([0,1,0]) difference(){
  x_end_idler_base();
  x_end_idler_holes();
 }
}

x_end_idler();


