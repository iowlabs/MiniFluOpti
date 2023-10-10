
use <threadlib/threadlib.scad>

/*
Table:
https://github.com/adrianschlatter/threadlib/blob/develop/THREAD_TABLE.scad
*/


// mode 1
/*
t = 5;       // turns
p = 0.7;    // pitch --> first parameter of table
h = (t+1)*0.7;

difference(){
translate([0,0,p/2])
bolt("M4", turns=t);
translate([0,0,h/2])
cylinder(h = h, r = 1, $fn = 100, center = true);
}
*/


name = "M24-ext";
specs = thread_specs(name);
P = specs[0];               // Pitch
Rrot = specs[1]; 
Dsupport = specs[2];
section_profile = specs[3];     // Diameter

T =5; // turns
H = (T + 1) * P;

// create Thread

difference(){
translate([0,0,P/2])
union(){
thread(name, turns=T);
translate([0, 0, -P / 2])
cylinder(h=H, d=Dsupport, $fn=120);
}
cylinder(h=H, d=Dsupport-1, $fn=120);
}
