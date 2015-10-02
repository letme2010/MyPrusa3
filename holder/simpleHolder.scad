include <std.scad>

u = 7;
slot_w = u;
slot_h = 20;
w = u + r_out_608 * 2 + u;
t = u;
h = 130;

module holder() {
    translate([50,0,0]) {
        rotate([0,90,0]) {
            belling608();
        }
    }
    translate([-50,0,0]) {
        rotate([0,90,0]) {
            belling608();
        }
    }
    rotate([0,90,0]) {
        cylinder(r=8/2,h=100,center=true,$fn=100);
    }
}

%translate([0,0,h]) {
    holder();
}

main();
%flag();

module main() {
    translate([50+u,0,u/2]) {
        cube([u,u,u], center=true);
    }  
    difference() {
        translate([50,0,(h-slot_h)/2]) {
            cube([t,w,h+slot_h], center=true);
        }
        translate([50,0,h]) {
            rotate([0,90,0]) {
                #cylinder(
                    r=(r_out_608+0.2),
                    h=(h_608+2),            
                    center=true,
                    $fn=100);
            }
        }   
        translate([50,0,-slot_h/2]) {
            #cube([(u+2), u, slot_h], center=true);
        }
        translate([50,20,h-9]) {
            color([0,1,0,0.5]) {
                #cube([(u+2), u, 4], center=true);
            }
        }
        translate([50,-20,h-9]) {
            color([0,1,0,0.5]) {
                #cube([(u+2), u, 4], center=true);
            }
        }
        union() {            
            translate([50,0,h-30]) {
                rotate([0,90,0]) {
                #cylinder(
                    r=(r_out_608),
                    h=(h_608+2),
                    center=true,
                    $fn=100);
                }
            }
            translate([50,0,h-57]) {
                rotate([0,90,0]) {
                #cylinder(
                    r=(r_out_608),
                    h=(h_608+2),
                    center=true,
                    $fn=100);
                }
            }
            translate([50,0,h-83]) {
                rotate([0,90,0]) {
                #cylinder(
                    r=(r_out_608),
                    h=(h_608+2),
                    center=true,
                    $fn=100);
                }
            }
            translate([50,0,h-110]) {
                rotate([0,90,0]) {
                #cylinder(
                    r=(r_out_608),
                    h=(h_608+2),
                    center=true,
                    $fn=100);
                }
            }

        }
    }
}

module flag() {
    cylinder(r=5,h=h);
}