/*
@Prosimio 2021

This a PCR-tube holder generator.
It was designed to be used in the FluoPi Machine but
can be used for other purposes.

*/

////////////////
// Parameters //
////////////////


// Tube dimentions

h1 = 8.5;
h2 = 11;
h3 = 0.5;

H = h1 + h2 + h3;  // total tube height

d1 = 6.3 + 0.4; // 0.2 looseness
d2 = 2.6 + 0.3; // 0.1 looseness


// Box holder

box_thick = 3;   // external thickness

box_x = d1 + box_thick;
box_y = d1 + box_thick;
box_z = H - h3 ; // left the tip outside

pitch = 9;   // Separation between holes center
n = 3;
m = 3;

// create holder

holder(n,m,pitch,box_x,box_y,box_z, H, h1, h2, h3, d1, d2);



// uncomment to display the tube
//tube(H, h1, h2, h3, d1, d2);

/*
difference(){
    box(box_x, box_y, box_z, h3);
    tube(H, h1, h2, h3, d1, d2);
}
/*/

/////////////
// Modules //
/////////////

module tube(H, h1, h2, h3, d1, d2){
    
    // top section
    translate([0,0,H-h1/2])
    cylinder(h = h1, r1 = d1/2, r2 = d1/2, $fn = 100, center = true);
    
    // middle section
    translate([0,0, H-h1-h2/2])
    cylinder(h = h2, r1 = d2/2, r2 = d1/2, $fn = 100, center = true);
    
    // down section
    translate([0,0, h3/2])
    cylinder(h = h3, r1 = d2/2, r2 = d2/2, $fn = 100, center = true);
    
}

module box(x,y,z,h3){
    translate([0,0,z/2+h3])
    cube(size = [x, y, z], center = true);
    
}

// n and m are the holder grid dimentions
module holder(n,m,p,bx,by,bz, H, h1, h2, h3, d1, d2){
    
    for (i =[0:n-1]){
        for (j =[0:m-1]){
            translate([i*p,j*p,0])
            difference(){
            box(bx, by, bz, h3);
            tube(H, h1, h2, h3, d1, d2);
            }
        }
    }
        
    
    
}




