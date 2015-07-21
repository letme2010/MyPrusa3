
difference() {
  import("inc/end-stop-original.stl");
  translate([0,-1.8,4.8]) rotate([0,90,0]) cylinder(h=15, r=1.2, center=true, $fn=30);
  translate([0,-11.3,4.8]) rotate([0,90,0]) cylinder(h=15, r=1.2, center=true, $fn=30);
}
