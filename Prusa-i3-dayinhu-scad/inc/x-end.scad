// PRUSA iteration3
// X end prototype
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

use <bearing.scad>
rod_distance = 45;

module x_end_base(){
// Main block
height = 58;
translate(v=[-15,-11,height/2]) cube(size = [17,44,height], center = true);
// Bearing holder
 vertical_bearing_base();	
//Nut trap
 // Cube
 translate(v=[-2-2,-20,4]) cube(size = [8,26,8], center = true);
 // Hexagon
 translate(v=[0,-20,0]) rotate([0,0,30]) cylinder(h = 8, r=13, $fn = 6);
}

module x_end_holes(){
 vertical_bearing_holes();
// Belt hole
translate(v=[-1,0,0]){
// Stress relief
translate(v=[-5.5-10+1.5,-10-1,30]) cube(size = [20,1,28], center = true);
difference(){
	translate(v=[-5.5-10+1.5,-10,30]) cube(size = [10,46,28], center = true);

	

	// Nice edges
	translate(v=[-5.5-10+1.5,-10,30+23]) rotate([0,45,0]) cube(size = [10,46,28], center = true);
	translate(v=[-5.5-10+1.5,-10,30+23]) rotate([0,-45,0]) cube(size = [10,46,28], center = true);
	translate(v=[-5.5-10+1.5,-10,30-23]) rotate([0,45,0]) cube(size = [10,46,28], center = true);
	translate(v=[-5.5-10+1.5,-10,30-23]) rotate([0,-45,0]) cube(size = [10,46,28], center = true);

}
}

// Bottom pushfit rod
translate(v=[-15,-22.5-10.5-0.01,6]) rotate(a=[-90,0,0]) pushfit_rod(8.1,44.02);

// With crack
translate(v=[-15-0.3,-22.5-10.5-0.01,6-10]) cube([0.6,44.02,10]);

// Top pushfit rod
translate(v=[-15,-22.5-10.5-0.01,rod_distance+6]) rotate(a=[-90,0,0]) pushfit_rod(8.1,44.02);

// With crack
translate(v=[-15-0.3,-22.5-10.5-0.01,rod_distance+6]) cube([0.6,44.02,10]);


// Nut trap
// translate(v=[0,-20,-0.5]) cylinder(h = 4, r1=3.3, r2=2.8, $fn=25);
// translate(v=[0,-20,3]) rotate([0,0,30]) cylinder(h = 10, r=4.5, $fn = 6);

  translate([0,-20,-0.5]) cylinder(h=9,r=5.86,$fn=30);
  translate([0+8/sqrt(2),-20+8/sqrt(2),-0.5]) cylinder(h=9,r=1.88,$fn=30);
  translate([0+8/sqrt(2),-20-8/sqrt(2),-0.5]) cylinder(h=9,r=1.88,$fn=30);
  translate([0-8/sqrt(2),-20+8/sqrt(2),-0.5]) cylinder(h=9,r=1.88,$fn=30);
  translate([0-8/sqrt(2),-20-8/sqrt(2),-0.5]) cylinder(h=9,r=1.88,$fn=30);

// Installation space
  translate([0-8/sqrt(2),-20+8/sqrt(2),8]) cylinder(h=9,r1=3.5,r2=1.5,$fn=30);
  translate([0-8/sqrt(2),-20-8/sqrt(2),8]) cylinder(h=9,r1=3.5,r2=1.5,$fn=30);
  translate([0-8/sqrt(2),-20,8+4.5]) cube([3,16/sqrt(2),9],center=true);
}


// Final prototype
module x_end_plain(){
 difference(){
  x_end_base();
  x_end_holes();
 }
}

x_end_plain();


module pushfit_rod(diameter,length){
 cylinder(h = length, r=diameter/2, $fn=30);
 difference(){
 	translate(v=[0,-diameter/2.85,length/2]) rotate([0,0,45]) cube(size = [diameter/2,diameter/2,length], center = true);
 	translate(v=[0,-diameter/4-diameter/2-0.4,length/2]) rotate([0,0,0]) cube(size = [diameter,diameter/2,length], center = true);
 }
 //translate(v=[0,-diameter/2-2,length/2]) cube(size = [diameter,1,length], center = true);
}

