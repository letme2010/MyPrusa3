use <hook3.scad>;

difference() {    
    union() {
        //top
        cylinder(h = 3, d = 32, center = false, $fn = 100);
        translate([0,0,2]) pipe(aR = 55/2, aH = 4, aT = 3);
        
        //bottom
        buttom();
    };
    //center hole
    translate([0,0,-1])
        cylinder(h = 11, d = 32-4*2, center = false, $fn = 100);
}

difference() {
    //bottom holder
    translate([0,0,1]) cylinder(h = 2, d = 32-4*2, center = false, $fn = 100);    
    //bottom holder hole
    translate([0,0,-1]) cylinder(h = 10, d = 21.1, center = false, $fn = 100);
}


module buttom () {
    difference() {
        cylinder(h = 3, d = 70, center = false, $fn = 100);
        translate([0,0,-1])
            cylinder(h = 5, d = 70 - 4 * 2, center = false, $fn = 100);
    }

    rotate(0)
        frameLine();
    rotate(45)
        frameLine();
    rotate(90)
        frameLine();
    rotate(135)
        frameLine();
}

module frameLine () {
    frameLineLength = 65;
    frameLinewidth = 4;
    frameLineHeight = 3;
    
    translate([-frameLinewidth/2,-frameLineLength/2,0]) 
        cube([frameLinewidth,frameLineLength, frameLineHeight], center = false);
}
