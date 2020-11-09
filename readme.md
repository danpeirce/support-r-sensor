# Support for Pololu PQTR-1A  Refective Sensor

The Pololu QTR-1A refective sensor from Pololu is a very small breakout board containing a QRE1113GR SMT. I have designed a 
support that will hold the sensor on the board 8 mm from a reflective surface. This is the distance used on the 
Pololu 3Pi robot. The combination of the board and support should allow the students to investigate the techniques used 
to read the sensor employed by the robot.

## Images of different views

![](view1.png)

![](view2.png)

![](view3.png)

![](view4render.png)

### 3D viewer of STL

Github incorperates an interactive 3D viewer for STL files.

* [support-r-sensor.stl](support-r-sensor.stl)

## OpenSCAD file

The OpenSCAD file used to generate the other files is here:

* [support-r-sensor.scad](support-r-sensor.scad)

One can preveiw what the sensor board looks like on the support if the following line in the SCAD file is uncommented
and then the preview is obtained from OpenSCAD.

~~~~scad
// translate([10, 0, 0.2]) sensor_board();
~~~~

