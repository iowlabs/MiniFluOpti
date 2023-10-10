/*
    This code generates filter holder adaptors for RPI custom lenses (e.g. M12 lenses) with internal thread mount.
    
    The code uses this thread library:
    https://github.com/adrianschlatter/threadlib
    Please follow the isntruction there to install the library prior to run this code.
    
    The correction values let you adjust the system to the 3D printing accuracy (try and error experience).
    
    This is licensed under the Creative Commons - Attribution license (CC BY 4.0)
    Isaac Núñez 2021.
*/


// add thread library
use <threadlib/threadlib.scad>


/////////////////
// Parameters //
////////////////

// General
ri = 12.6;          // internal radious
fs_t = 1;           // filter sheet horizontal thickness 
side_thick = 1 ;    // wall thickness
filter_thick = 3;
filter_free_space = 0.5;   //filter thick looseness
bottom_thick = 0.8;        // bottom thickness
h_thread = 2;

// Thread
name = "M32x2-ext";
specs = thread_specs(name);
P = specs[0];               // Pitch
Rrot = specs[1]; 
Dsupport = specs[2];
section_profile = specs[3];     // Diameter

T =1; // turns
H = (T + 1) * P;


// Variables
rb = ri-fs_t ;          // bottom hole radious
re = ri +side_thick;    // external radious
h = filter_thick +filter_free_space; //internal h
total_h = h + bottom_thick; //external h

///////////////////
// Create object //
///////////////////

// filter holder
difference(){
    linear_extrude(height = total_h, center = true, convexity = 10, twist = 0,$fn = 100)
    circle(re);
    translate([0,0,bottom_thick])
    linear_extrude(height = h*1.1, center = true, convexity = 10, twist = 0,$fn = 100)
    circle(ri);
    translate([0,0,-bottom_thick])          linear_extrude(height = h*1.1, center = true, convexity = 10, twist = 0,$fn = 100)
    circle(rb);
}

// Thread
translate([0,0,total_h/2])
difference(){
    // Bolt
    translate([0,0,P/2])
    union(){
        thread(name, turns=T);
        translate([0, 0, -P / 2])
        cylinder(h=H, d=Dsupport, $fn=120);
        }
    // hole
    cylinder(h=H, d=Dsupport-side_thick, $fn=120);
}

// Add cone suppor junction
hc = 1;         // cone juntion height

translate([0,0,total_h/2-hc])
difference(){
    cylinder(h=hc, r1=re, r2 = Dsupport/2, $fn=120);
    cylinder(h=hc, r=ri, $fn=120);
    }    
