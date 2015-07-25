include <const.scad>
use <std.scad>

//框厚
sensorBoxFrameThinkness = 3;
//底厚
sensorBoxBottomThinkness = 8.05;

boxLengthSpace = 0.5;
boxWidthSpace = 0.5;

boxLength = sensorBoxFrameThinkness * 2 + endStopLength + boxLengthSpace;
boxWidth = sensorBoxFrameThinkness * 2 + endStopWidth + boxWidthSpace;
boxHeight = 25.83 + 3;

boxInnerLength = endStopLength + boxLengthSpace;
boxInnerWidth = endStopWidth + boxWidthSpace;
boxInnerHeight = boxHeight - sensorBoxBottomThinkness;

equalSlotRadius = m2_body_d + 0.2;
equalSlotHeight = 15;

bottomCylinderDia = 6.19;
bottomCylinderHeight = 8.05;

module sensorBox() {
    //主体
    difference() {
        cube([boxWidth, boxLength, boxHeight], center = true);
        translate([0,0,(boxHeight - boxInnerHeight)/2])
            cube([boxInnerWidth, boxInnerLength, boxInnerHeight], center = true);
        //底孔
        translate([0,0,-(boxHeight-bottomCylinderHeight)/2])
            rotate([0,0,90])
                cylinder(d = bottomCylinderDia, h = bottomCylinderHeight, center = true, $fn = 6);

        //平衡槽
        translate([0,+(6.10/2),(boxHeight-equalSlotHeight)/2])
            cube([20, equalSlotRadius, equalSlotHeight], center = true);
        translate([0,-(6.10/2),(boxHeight-equalSlotHeight)/2])
            cube([20, equalSlotRadius, equalSlotHeight], center = true);
    }


}

//开关
%color([0,1,0,0.3])
    translate([0,0,9]) 
        endStop();
//锣丝
%color([0,0,1,0.3])
    translate([0,+(6.10/2),7]) 
        rotate([0,90,0]) 
            screwsM2_20();
//锣丝
%color([0,0,1,0.3])
    translate([0,-(6.10/2),7]) 
        rotate([0,90,0]) 
            screwsM2_20();

module test() {
    sensorBox();
}

test();