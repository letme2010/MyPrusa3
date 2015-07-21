difference() {    
    union() {
        //top
        cylinder(h = 7, d = 32, center = false);
        //bottom
        buttom();
    };
    //center hole
    translate([0,0,-1])
        cylinder(h = 11, d = 32-4*2, center = false);
}

difference() {
    //bottom holder
    translate([0,0,1]) cylinder(h = 3, d = 32-4*2, center = false);    
    //bottom holder hole
    translate([0,0,-1]) cylinder(h = 10, d = 21.1, center = false);
}


module buttom () {
    difference() {
        cylinder(h = 3, d = 70, center = false);
        translate([0,0,-1])
            cylinder(h = 5, d = 70 - 4 * 2, center = false);
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
