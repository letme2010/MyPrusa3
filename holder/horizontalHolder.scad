holderDiameter = 11.90;

difference() {
    origin();
    translate([0,0,-1]) cylinder(h = 10, d = holderDiameter - 4, center = false); 
}

module origin() {
    
    //first level holder
    translate([0,0,0]) cylinder(h = 7, d = holderDiameter, center = false);    

    //second level holder
    translate([0,0,0]) cylinder(h = 4, d = holderDiameter + 2, center = false);    

    difference() {
        cylinder(h = 3, d = 70, center = false);
        translate([0,0,-1]) cylinder(h = 10, d = 62, center = false);
    };

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