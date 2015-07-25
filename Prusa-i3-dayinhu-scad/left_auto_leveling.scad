include <const.scad>
use <std.scad>
use <sensorBox.scad>

rotate([180,0,0]) {
    translate([0,0,-83]) {
        color([0,0,1,0.5]) import("x-end-motor.stl");
    }
}

x_end_motor();
color([0,1,0,0.5]) %LM8UU();

rod_distance = 45;

module x_end_base(){
// Main block
height = LM8UU_h;
difference() {
    translate(v=[-15,9.5,height/2]) cube(size = [17,47,height], center = true);
    translate(v=[-15,10,height/2 + 1]) cube(size = [17-6,10,height+2], center = true);
    translate(v=[-15,24,height/2 + 1]) cube(size = [17-6,10,height+2], center = true);
    translate(v=[-15,-4,height/2 + 1]) cube(size = [17-6,10,height+2], center = true);
}
// Bearing holder
 vertical_bearing_base();	
//Nut trap
 // Cube
 translate(v=[-2-2,20,4]) cube(size = [8,26,8], center = true);
 // Hexagon
 translate(v=[0,20,0]) rotate([0,0,30]) cylinder(h = 8, r=13, $fn = 6);
}

module x_end_holes(){
 vertical_bearing_holes();

  translate([0,20,-0.5]) cylinder(h=9,r=5.86,$fn=30);
  translate([0+8/sqrt(2),20+8/sqrt(2),-0.5]) cylinder(h=9,r=1.88,$fn=30);
  translate([0+8/sqrt(2),20-8/sqrt(2),-0.5]) cylinder(h=9,r=1.88,$fn=30);
  translate([0-8/sqrt(2),20+8/sqrt(2),-0.5]) cylinder(h=9,r=1.88,$fn=30);
  translate([0-8/sqrt(2),20-8/sqrt(2),-0.5]) cylinder(h=9,r=1.88,$fn=30);

// Installation space
  translate([0-8/sqrt(2),20+8/sqrt(2),8]) cylinder(h=9,r1=3.5,r2=1.5,$fn=30);
  translate([0-8/sqrt(2),20-8/sqrt(2),8]) cylinder(h=9,r1=3.5,r2=1.5,$fn=30);
  translate([0-8/sqrt(2),20,8+4.5]) cube([3,16/sqrt(2),9],center=true);
}

module x_end_motor_base(){
    x_end_base();
    translate([-15,-23.5,14.415]) rotate([0,0,180]) {
        sensorBox();
    }
}

module x_end_motor_holes(){
 x_end_holes();
}

// Final part
module x_end_motor(){
 difference(){
  x_end_motor_base();
  x_end_motor_holes();
 }
}

// PRUSA iteration3
// Bearing holders
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

bearing_diameter = 16;
thinwall = 3;
bearing_size = bearing_diameter + 2 * thinwall;

module vertical_bearing_base(){
 cylinder(h = LM8UU_h, r=bearing_size/2, $fn = 90);
}

module vertical_bearing_holes(){
  translate(v=[0,0,-1]) cylinder(h = 62, r=bearing_diameter/2, $fn = 60);
}