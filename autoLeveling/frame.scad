d_small_hole = 3;
l_2_hole = 27.80 + d_small_hole;
l_frame = 40;
h_frame = 8;
r_big_hold = 6;
h_big_hold = 20;
p_small_hold = 31/2;
d_small_hold = 3;

t_top_block_frame = 5;

w_top_block_slot = 12.5;
l_top_block_slot = 22.74;

w_top_block = w_top_block_slot + 2 * t_top_block_frame;
l_top_block = l_top_block_slot + t_top_block_frame;
h_top_block = 5;

d_server_hole = 2;

top();
bottom();

module bottom() {
    difference() {
        cube([l_frame, l_frame, h_frame], center = true);

        //big hole
        cylinder(r = r_big_hold, h = h_big_hold, $fn=100, center = true);    

        //small hole
        translate([p_small_hold, p_small_hold, 0]) { 
            cylinder(d = d_small_hold, h = 20, $fn = 100, center = true);
        }
        //small hole
        translate([-p_small_hold, p_small_hold, 0]) { 
            cylinder(d = d_small_hold, h = 20, $fn = 100, center = true);
        }
    }
}

w_hole_bottom = 4;
l_hole_bottom = 100;
h_hole_bottom = 2;

module top() {
   difference() {
        translate([0, 0, (h_frame+h_top_block)/2]) {
            difference() {
                cube([w_top_block, l_top_block, h_top_block], center = true);
                translate([0, -(l_top_block-l_top_block_slot)/2, 0]) {
                    cube([w_top_block_slot, l_top_block_slot, h_top_block], center = true);
                }
                translate([0, (l_top_block/2-2.5), 0]) {
                    cylinder(d = d_server_hole, h = 30, center = true, $fn = 100);
                }
            }
        }
        translate([0, 0, (h_frame-h_hole_bottom)/2+h_hole_bottom]) {
            #cube([w_hole_bottom, l_hole_bottom, h_hole_bottom], center = true);
        }
    }
}







