include<std.scad>

//轮框半径
r_frame=150/2;
//轮框高度
h_frame=80;
//轮厚
t_frame=1;
//轮框圆角外半径
r_rect_frame=5;

module wheelFrame() {
    intersection() {
        union() {
            difference() {
                rect(
                    w=(2*r_frame),
                    h=h_frame,
                    r=r_rect_frame
                    );
                rect(
                    w=(2*r_frame - 2*t_frame),
                    h=(h_frame-2*t_frame),
                    r=(r_rect_frame-t_frame)
                    );
            }
        }
        square([r_frame,r_frame],center=false);
    }

}


//rotate_extrude(convexity=100,$fn=200)
//translate([10,0,0])
//rotate([0,0,90]) 
wheelFrame();

rotate([0,90,0])
cylinder(r=3,h=80);