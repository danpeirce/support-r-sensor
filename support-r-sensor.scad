
boardx = 7.6;
boardy = 12.7;
boardz = 1.02;
holed_pin = 1.02;
holed_blt = 2.18;
scale = 7.32; // 1.00 mm on scale drawing of sensor
sensory = 3.6;
sensorz = 1.7;
board_up = 9.7;


module sensor_board() {   // this module will locate the board and sensor the right 
    union() {             //  distance above the xy plain with a corner touching the z axis
        translate([0,0, board_up]) difference() {
            color("red") cube([boardx, boardy, boardz]); // board
            translate([1.27+0*2.54, 1.27, 0])cylinder(d=holed_pin, h=3, center=true, $fn=20);
            translate([1.27+1*2.54, 1.27, 0])cylinder(d=holed_pin, h=3, center=true, $fn=20);
            translate([1.27+2*2.54, 1.27, 0])cylinder(d=holed_pin, h=3, center=true, $fn=20);
            translate([3.8, boardy-2.2, 0])cylinder(d=holed_blt, h=3, center=true, $fn=20);
        };
        translate([3.8, 4.5, 9.7-1.7/2]) difference() {  
            color("grey")cube([2.9, sensory, sensorz], center=true); // sensor
            translate([0,sensory/2-0.94, -sensorz/2]  ) cube([18.38/scale, 10.61/scale, 0.3], center= true);
            translate([0,-sensory/2+0.94, -sensorz/2]  ) cube([18.38/scale, 10.61/scale, 0.3], center= true);         
        }
    }
}



module support3d() {
    
    union() {
        cylinder( r = 2.0, h = 3.7, $fn= 20);
        translate([0,0, 3.7/2-1/2]) cube([boardx+6, 2*2, 3.7-1], center = true );
        translate([0,2, 3.7/2]) cube([boardx+6, 2, 3.7], center = true );
    
        translate([boardx/2, -5.9, 0]) scale([1.3, 0.7, 1]) cylinder( d = 2.5,  h = 3.7, $fn= 8);
        translate([-boardx/2, -5.9, 0]) scale([1.3, 0.7, 1]) cylinder( d = 2.5,  h = 3.7, $fn= 8);
        translate([boardx/2+1.55+1.5,-boardy/2+2.2+2, (3.7+1+1)/2]) cube([6, boardy-3, 3.7+2], center = true );
        translate([-(boardx/2+1.55+1.5),-boardy/2+2.2+2, (3.7+1+1)/2]) cube([6, boardy-3, 3.7+2], center = true );
    }
}

module pin() {
    
    translate([0,0,0]) cylinder( d = 2.2-0.2, h = 3.1, $fn= 20);
}

module downpin1() {
    translate([0.17,0,0]) cylinder( d = 5, h = 3.1+6+2, $fn= 40);
}

module base() {
    difference() {
        cube([10+boardx+10, 20, 6]);
        translate([10, -0.2, -0.5]) cube([boardx, boardy-3, 7]);
        translate([10+boardx+4, boardy-2.2, -0.1])scale([1,1,1.3])downpin1();
        translate([10+boardx+4-16, boardy-2.2, -0.1])scale([1,1,1.3])downpin1();
    }
}


 translate([10, 0, 0.2]) sensor_board();


translate([10, 0, 0.2]) color("black", 1) union() {
    translate([boardx/2, boardy-2.2, 6]) support3d();
    translate([boardx/2, boardy-2.2, 6+2]) pin();
    translate([boardx+4, boardy-2.2, 0])downpin1();
    translate([boardx+4-16, boardy-2.2, 0])downpin1();
    translate([-10, 0, -0.2]) scale([1,1, 1.2]) base();
}