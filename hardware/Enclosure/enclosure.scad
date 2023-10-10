/*
@Prosimio 2021

This is the Mini-FluOpti enclosure.

*/

////////////////
// Parameters //
////////////////


// general

id = 80;  // Internal diameter
ir = id/2; // internal radious

wt = 3;    // General wall thickness


// main tube 
os = 55;        // optical_space
cs = 35;        // camera_space
h1 = os + cs;   // main tube height
ha = 25;        // aperture height
h_door = ha + 4;  // door heigth
pih = h_door;       // pocket internal height
aa = 50;        // aperture angle [degrees]
pit = 3;        // pocket internal tickness
pet = 2;        // pocket external tickness
pia = 5;        // pocket internal angle [degrees]
pta = 3;        // pocket thickness angle [degrees]
ah = 10;        // door handle angle [degrees]

// sample tube
sh = 5;         // sheet height
st = 2;         // sheet support thickness
it = 3;         // internal sheet length
h2 = 21;        // tube height


// sample holder
hdt = 2;          // holder disk height
sst = 2;        // sample support sheet length
th = 2;         // barrier thickness horizontal
thz = 5;        // barrier thickness vertical       
xh = 28 ;   // x sample size + looseness if necessary
yh =  28 ;  // y sample size

// diffuser + filter support
f_t = 3;     // acrylic filter thickness
f_r = 45;        // filter radious
hd2 = 8;              // down mouting sheet heigh
hd1 = f_t + hd2;   // up mouting sheet heigh 
td = 2;                 // suppor disk thickness
ids = 1;                // internal disk sheet length
h3 = hd1 + hd2 + td;         // total piece height

// Light spacer
PCB_D = 90;         // PCB diameter
PCB_T = 11;         // PCB + LEDS thickness
PCB_support = 6;   // PCB support thickness
light_space = 17;   // Space between filter and LEDs
chx = 5;            // cable hole x dim
chz = 2.5;          // cable hole z dim
h4 = PCB_T + PCB_support + light_space;
ir_pcb = PCB_D/2 + 1; // 1 looseness  

// Light support
h5 = 4;             // sheet overlap height
scw_r = 1.5;          // screw radious
scw_t = 2;          // screw hole wall thickness
scw_sx = 40;         // screw separation in x axis
scw_sy = 70;         // screw separation in y axis
scw_h = 8;          // screw hole internal height
ls_r_int = ir_pcb + wt + 0.5; // 0.5 looseness

/////////////
// Display //
/////////////

//uncomment the objects to display them

//main_tube(h1,ir,wt, ha, aa, pia, pih, pta, pet, pit);
sample_tube(h2, sh, st, it, ir, wt);
//sample_holder(hdt, ir, sst, th, thz, xh, yh);
//filter_holder(ir_pcb,ir, f_r, hd1, hd2, f_t ,td ,wt ,ids);
//light_spacer(ir_pcb,h4,wt, chx, chz, h5);
//light_support(ls_r_int,wt,h5,scw_r,scw_t,scw_sx, scw_sy, scw_h,PCB_support);

//rotate_extrude(angle=90, convexity=10, $fn = 100)
//translate([10, 0]) polygon( points=[[0,0],[2,1],[2,0]] );

/////////////
// Modules //
/////////////

module main_tube(h, r, t, ha, aa, pia, pih, pta, pet, pit  ){
    
    // tube
    difference(){
        difference(){
        cylinder(h = h, r = r+t, $fn = 100, center = true);
        cylinder(h = h, r = r, $fn = 100, center = true);
        }
        
        // aperture
        rotate_extrude(angle=aa, convexity=10, $fn = 100)
        translate([r+t/2, -h/2+ha/2]) square(size = [t+1,ha],  center = true);
        }
    
    // pocket
    tih = pih+ha;   // total internal height
    teh = pih+ ha; //+ pet;   // total external height
    tia = aa + 2*pia; //total internal angle
    tea = aa + 2*pia + 2*pta; //total internal angle
    
    //pocket case
    difference(){
    rotate(a=[0,0,-pia - pta])
    rotate_extrude(angle=tea, convexity=10, $fn = 100)
    translate([r-(pit+pet)/2, -h/2+teh/2]) square(size = [pit+pet,teh],  center = true);
    
    //pocket hole
    rotate(a=[0,0,-pia])
    rotate_extrude(angle=tia, convexity=10, $fn = 100)
    translate([r-pit/2, -h/2+tih/2]) square(size = [pit,tih],  center = true);
    
    // aperture
    rotate_extrude(angle=aa, convexity=10, $fn = 100)
    translate([r-t, -h/2+ha/2]) square(size = [t+pit+pet,ha],  center = true);
    }
    
    // add triangle border to help printing
    tri_h = 3;   // triangle height
    rotate(a=[0,0,-pia - pta])
    rotate_extrude(angle=tea, convexity=10, $fn = 100)
translate([r-(pit+pet), -h/2+teh]) polygon( points=[[0,0],[pit+pet,tri_h],[pit+pet,0]] );
        
    
}

module door(){
    
        // door handle
rotate_extrude(angle=180, convexity=10, $fn = 100)
translate([10, 0]) polygon( points=[[0,0],[1,1],[0,1]] );
    }

module sample_tube(h, sh, st, it, r, t){
    
    swt = t + 0.5;  // +0.5 loseness
    
    she = sh+st; // external sheet height
    
    // main tube
    difference(){
    cylinder(h = h, r = r+t, $fn = 100, center = true);
    cylinder(h = h, r = r, $fn = 100, center = true);
    }
    
    // external sheet
    
    translate([0,0,-(h/2)])
    
        translate([0,0,-she/2+st])
        difference(){
        cylinder(h = she, r = r+swt+t, $fn = 100, center = true);
        cylinder(h = she, r = r+swt, $fn = 100, center = true);
        }

    // sample support disk
    translate([0,0,-(h/2-st/2)])
    difference(){
        cylinder(h = st, r = r+swt+t, $fn = 100, center = true);
        cylinder(h = st, r = r-it, $fn = 100, center = true);
        }
    
    
}


module sample_holder(h, r, st, t, tz, x, y){
    r = r - 0.5; // Looseness
    
    // disk
    difference(){
    cylinder(h = h, r = r, $fn = 100, center = true);
    cube(size = [x-st,y-st,h], center = true);
    }
    
    // holder
    translate([0,0,h/2+tz/2])
    difference(){
    cube(size = [x+t,y+t,tz], center = true);
    cube(size = [x,y,tz], center = true);
    }
}

module filter_holder(ru, rd, fr, h1, h2, ft ,t ,wt ,it){
    
    rui = ru + wt + 0.5; // 0.5 looseness
    rdi = rd + wt + 0.5; // 0.5 looseness
    
    // upper tube
    translate([0,0,(h1+t)/2])
    difference(){
    cylinder(h = h2, r = rui+wt, $fn = 100, center = true);
    cylinder(h = h2, r = rui, $fn = 100, center = true);
    }
    
    // filter tube
    translate([0,0,(ft+t)/2])
    difference(){
    cylinder(h = ft, r = rui+wt, $fn = 100, center = true);
    cylinder(h = ft, r = fr, $fn = 100, center = true);
    }
    // holder disk
    difference(){
    cylinder(h = t, r = fr+wt, $fn = 100, center = true);
    cylinder(h = t, r = rdi-it, $fn = 100, center = true);
    }
    
    // down tube
    translate([0,0,-(h2+t)/2])
    difference(){
    cylinder(h = h2, r = rdi+wt, $fn = 100, center = true);
    cylinder(h = h2, r = rdi, $fn = 100, center = true);
    }
}

module light_spacer(r,h,wt, cx, cz, h_sheet){
    hh = cz + h_sheet;  // hole height
    
    difference(){
        // Tube
        cylinder(h = h, r = r+wt, $fn = 100, center = true);
        cylinder(h = h, r = r, $fn = 100, center = true);
        
        // Hole
        translate([0,r+wt/2,+h/2-hh/2])
        cube([cx,wt+1,hh],center=true);
        // wt + 1 to give looseness
    }
    
}

module light_support(r, wt, h, sr, st, ssx, ssy, sih,seh){
    // sih = screw hole internal height
    // seh = screw support external height
    // ssx = screw spacer x axis
    // ssy = screw spacer y axis
    
    // base disk + supports
    difference(){
    union(){
    translate([0,0,wt/2])
    cylinder(h = wt, r = r+wt, $fn = 100, center = true);
        
    //supports
    for (x =[-ssx/2,ssx/2]){
        for (y =[-ssy/2,ssy/2]){
            translate([x,y,seh/2+wt])
            cylinder(h = seh, r = sr+st, $fn = 100, center = true);
            }
    }
          };
    // Holes
    union(){
        for (x =[-ssx/2,ssx/2]){
            for (y =[-ssy/2,ssy/2]){
                translate([x,y,seh/2+wt])
                // it is translated accord the support
                cylinder(h = sih, r = sr, $fn = 100, center = true);
                }
         }
        }
    }
    // screw supports
    /*
    for (x =[-ss/2,ss/2]){
        for (y =[-ss/2,ss/2]){
            translate([x,y,seh/2+wt])
            difference(){
            cylinder(h = seh, r = sr+st, $fn = 100, center = true);
            cylinder(h = seh, r = sr, $fn = 100, center = true);
            }
        }
    }
    */
    
    // overlap tube sheet
    translate([0,0,h/2+wt])
    difference(){
        // Tube
        cylinder(h = h, r = r+wt, $fn = 100, center = true);
        cylinder(h = h, r = r, $fn = 100, center = true);
        
    }
    
    
}
    