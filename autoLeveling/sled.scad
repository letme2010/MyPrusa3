use<std.scad>

r_top_out = 7;
r_top_hole = 7.22/2 + 0.1;
r_top_hole_small = 4/2 + 0.1;
l_top_hole = 16;
h = 4.6;
h_slot_1_thin = 1.73;
l_middle = 68;
l_bottom = 10;
l_bottom_hole = l_middle + 3;
w_bottom = 3;
d_switch_hole = 6.10;
h_slot = 10;

module slot() {
    translate([0, l_top_hole, 0]) {
        cylinder(r = r_top_hole_small, h = h_slot, center = true, $fn = 100);
    }
    cylinder(r = r_top_hole, h = h_slot, center = true, $fn = 100);    
    linear_extrude(height = h_slot, center=true) polygon( points = [
                        [0,0], 
                        [r_top_hole,0], 
                        [r_top_hole_small,l_top_hole], 
                        [0,l_top_hole]
                      ],
              paths = [
                        [0,1,2,3,0]
                      ]
            );
    mirror() {
    linear_extrude(height = h_slot, center=true) polygon( points = [
                            [0,0], 
                            [r_top_hole,0], 
                            [r_top_hole_small,l_top_hole], 
                            [0,l_top_hole]
                          ],
                  paths = [
                            [0,1,2,3,0]
                          ]
                );
    }

}

difference() {
    union() {
        main();
        translate([0,69-0.5,0]) {
            cylinder(r=r_top_out, h=h, $fn=100, center=true);
        }
    }

    translate([0,0,(h_slot - h)/2 + h - h_slot_1_thin]) {
        slot();
    }
    cylinder(r = r_top_hole, h = 10, center = true, $fn = 100);
    translate([w_bottom, l_bottom_hole, 0]) {
        #screwsM2_20();
    }
    translate([-w_bottom, l_bottom_hole, 0]) {
        #screwsM2_20();
    }
    translate([0,10,0]) {
        color([0,1,0,0.5]) cube([1.6,22,20], center=true);    
    }
    rotate([0,0,30]) {
        translate([21,18,0]) {
            color([0,1,0,0.5]) cube([22,1.6,20], center=true);    
        }
    }
    //left and right for band.
    translate([7.5,19,0]) {
        #cube([3,3,10],center=true);
    }
    translate([-7.5,19,0]) {
        #cube([3,3,10],center=true);
    }

    //decor hole
    translate([0,30,0]) {
        #cylinder(r=r_top_hole, h=(h+2), $fn=100, center=true);
    }
    translate([0,40,0]) {
        #cylinder(r=r_top_hole, h=(h+2), $fn=100, center=true);
    }
    translate([0,50,0]) {
        #cylinder(r=r_top_hole, h=(h+2), $fn=100, center=true);
    }
    translate([0,60,0]) {
        #cylinder(r=r_top_hole, h=(h+2), $fn=100, center=true);
    }
}
if (false) 
{
%color([0,0,1,0.3])
    translate([0,0,2.3])
        rotate([0,180,0]) 
            servoArm1();
}
//if (false)
{
%translate([0,70+3,5.5]) 
    rotate([0,90,90]) 
        endStop();
}


module main() {
    union() {
        //top
        cylinder(r = r_top_out, h =  h, center = true, $fn = 100);

        //middle
        translate([0, l_middle/2, 0]) {
            cube([r_top_out * 2, l_middle, h], center = true, $fn = 100);
        }

        //bottom
        translate([0, l_middle, 0]) {
            cube([l_bottom, w_bottom, h], center = true, $fn = 100);
        }
    }
}

