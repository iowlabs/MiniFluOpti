/*
    With this code you can make a camera holder for RPI camera from waveshare (http://www.waveshare.com/product/mini-pc/raspberry-pi/cameras/rpi-camera-b.htm) or for V2 RPI camera (https://www.raspberrypi.org/products/camera-module-v2/)
    
    The code was modified from Fernán Federici 2017 version.
    
    This is licensed under the Creative Commons - Attribution license (CC BY 4.0)
    Isaac Núñez 2020.
 
*/

///////////////////////
// Fluopi parameters

holder_x=54;//acrylic bed width to fit into holder
holder_z=3*1.1;//acrylic bed thickness to fit into holder, normally 3 mm acrylic. 1.1 correction factor applied to surpass acrylic manufacture variations.

holder_y =41; // acrylic bed deep not inserted into the holder. It is equal to the distance between the holder and the enclosure wall. 

plate_center= 66; //distance from the enclosure wall to the center of the plate.

// LED ring parameters

r_ext = 70/2; // external radius
r_int = 40/2; // internal radius
ring_h = 1.5; // PCB height
r_sh = 1.5; // screw holes radius
x_shd = 60; // screw holes x distance
y_shd = 23; // screw holes y distance
LED_z = 8; // LEDs height

CCFB = plate_center - holder_y; // Camera Center From Border

////////////////////////
// Defined by the user

// ** camera holder parameters ** 

side_thick = 2; //side support thickness
bottom_thick = 1; // bottom support thickness
back_thick = 2; // back support thickness

scw_r = 1.5/2;   // camera screw radious
scw_b = 2;  // screw hole bottom distance
scw_s = 1.8; // screw hole side distance

// ** Base holder parameters **

sca_thick_up = 3; // holder scafold thickness
sca_thick_side = 3; // holder scafold thickness
sca_thick_down = 2; // holder scafold thickness
sca_deep = 10;  // holder scafold back deep, it have to be shorter than the distance to the screws in the camera PCB (14 mm aprox) plus camera hoder "back_thick" parameter.
sca_arms_width = 11; // holder scafold arms width

sca_arms_space_x = 1;  // space attach relaxation in x axis
sca_arms_space_y = 15;  // space attach relaxation in y axis (deep of the space)

ts_x = 10; // triangular supports x size
ts_y = 7;  // triangular supports y size

sca_trans = (sca_thick_up - sca_thick_down)/2; // translate the holder space to achieve the desired up and down thicknes

scafold_x = holder_x + 2*sca_thick_side;
scafold_y = plate_center + back_thick - holder_y; // depth
scafold_z = holder_z + sca_thick_up + sca_thick_down;

// ** LED ring holder and arms parameters **

// for the ring holder support
hrh_y = 2; // hole border y thickness
hrh_z = 2.5; // hole border z thickness

rh_screw = 1.5; // ring holder-arms screw radius

// for the arms
arm_z = 15; // arm z lenght
arm_tick = 3; // arm thickness

arm_hbt = 2.5; // hole borders thickness
ra_screw = 1.5; // ringholder-arms screw rad
s_arm_screw = 1.5; // arms screw hole separation from scafold.

// for the ring enclosure
re_zt = 2; // ring enclosure z thickness
re_rt = 2; // ring enclosure r thickness
re_scw = 1.5; //screw supports thickness
re_rfe = 2; // ring enclosure r free space  (between the PCB and external enclosure in r axis)
re_rfei = 1; // ring enclosure r free space internal hole (between the PCB and internal enclosure in r axis)

re_fh = 18.5; // front height. This is the LED height after having soldered them
re_dh = 3; // difussor separation from LEDs 
re_bh = 4; // back heigh. Left some air space equivalent to the screw support lenght
chs_x = 3; // cable hole space in x axis
chs_z = 3; // cable hole space in z axis. This value is added over the clamp height

re_cd = 1; // clamp deep
re_cw = 4; // clamp wide
re_ch = 2; // clamp height
re_cdh = re_cd + 0.3; // clamp deep hole, 0.3 looseness 
re_cw1 = re_cw + 0.5; // clamp wide 1st section, 1 looseness
re_cw2 = 2.5*re_cw1; // clamp wide 2nd section
re_ch1 = 2; // clamp height 1st section
re_ch2 = re_ch + 1; // clamp height 2nd section, 1 looseness


hre = re_dh + re_fh + ring_h +re_bh + re_zt ; // ring enclosure heigh
rre = r_ext + re_rfe + re_rt;//ring enclosure radius
rrei = r_int-re_rfei;// ring enclosure internal radius

//for the diffusor holder
dh_zt = 2; // difusor holder z thickness
dh_sheet = 2.5; // difusor holder sheet in r axis to support the difussor.

dhi_sheet = 2; // inner difusor holder sheet in r axis to support the difussor.
dhi_h = 4; // inner border height
dhi_rt = 1; // inner diffusor holder tickiness in r axis.

/////////////////////
//  Camera details:

////////////////////////////////
// Waveshare Chinesse camera //
///////////////////////////////
waveshare_cam_x=32.2 + 1; // 1mm of error
waveshare_cam_y=32.2; 
waveshare_cam_z=1.5*1.1;//thickness
WS_hold_x = 5.1 - 0.3;    // space between border and cable conector. 0.3 the security factor
WS_hold_y = 4.5 - 0.3;  // space between border and resistor. 0.3 the security factor

WS_scw_b = 2;  // distance from bottom to screw hole center
WS_scw_s = 2; // distance from side to screw hole center
///////////////////
// RPI V2 camera //
///////////////////

RPIV2_cam_x = 25 + 1 ; // 1mm of error
RPIV2_cam_y = 24; 
RPIV2_cam_z = 1 + 0.1; // PCB thickness, 0.1 mm of error
RPIV2_connec_x = 22; // cable conector length
RPIV2_connec_z = 2.7+ 0.1; // cable conector thikness, 0.1 mm error

RPIV2_sensor_x = 8.5 + 0.5; // sensor base length (8.5 mm) or adaptor lenght + 0.5 mm error. For some reason use 16.

V2_hold_x =(RPIV2_cam_x - RPIV2_sensor_x)/2 - 0.3;    // space between camera border and sensor base. 0.3 the security factor
V2_hold_y = 12.5 - 0.2;  // space between border and PCB first obstacle (sensor base or electronic componentes). 0.2 security value. Use value = 12.5 to attach with screws or 7 to not use them.

V2_scw_b = 9.25;  // distance from bottom to screw hole center
V2_scw_s = 2; // distance from side to screw hole center


module make_chb(scw_y,screw_x,scafold_y, LRS){
    // to make the camera holder base inside the camera_holder_base module
    union(){
    difference(){
        // base parallelepiped
        cube([scafold_x,scafold_y,scafold_z], center=true);
        // internal hole for acrylic arms
        translate([0,0,sca_trans])
        cube([holder_x,scafold_y*1.1,holder_z], center=true);
        // central square down hole
        translate([0,sca_deep/2,scafold_z-holder_z])
        difference(){
        cube([scafold_x - 2*sca_arms_width,scafold_y - sca_deep,scafold_z], center=true);
        // triangular support left
            translate([-scafold_x/2 + sca_arms_width,(-scafold_y + sca_deep)/2,0])
            linear_extrude(height = scafold_x - 2*sca_arms_width, center = true, convexity = 10, twist = 0)
            polygon(points=[[0,0],[0,ts_y],[ts_x,0]]);
            // triangular support right
            mirror([1,0,0])translate([-scafold_x/2 + sca_arms_width,(-scafold_y + sca_deep)/2,0])
            linear_extrude(height = scafold_x - 2*sca_arms_width, center = true, convexity = 10, twist = 0)
            polygon(points=[[0,0],[0,ts_y],[ts_x,0]]);
        }
        
        // central square up hole
        translate([0,sca_deep/2,-scafold_z+holder_z])
        difference(){
            cube([scafold_x - 2*sca_arms_width,scafold_y - sca_deep,scafold_z], center=true);
            // triangular support left
            translate([-scafold_x/2 + sca_arms_width,(-scafold_y + sca_deep)/2,0])
            linear_extrude(height = scafold_x - 2*sca_arms_width, center = true, convexity = 10, twist = 0)
            polygon(points=[[0,0],[0,ts_y],[ts_x,0]]);
            // triangular support right
            mirror([1,0,0])translate([-scafold_x/2 + sca_arms_width,(-scafold_y + sca_deep)/2,0])
            linear_extrude(height = scafold_x - 2*sca_arms_width, center = true, convexity = 10, twist = 0)
            polygon(points=[[0,0],[0,ts_y],[ts_x,0]]);
        }
        
        // attach arms holes
        hole_x = holder_x/2-sca_arms_space_x/2;
        for (a =[hole_x,-hole_x]){
            translate([a,(scafold_y-sca_arms_space_y)/2,scafold_z/2])
            cube([sca_arms_space_x,sca_arms_space_y,scafold_z], center=true);
        }
        
        // screw holes
        scw_h = sca_thick_down; 
        
        for (a =[screw_x,-screw_x]){
            translate([a,-scafold_y/2+      scw_r+scw_y,(scafold_z-scw_h)/2])
        //(scafold_z-scw_h)/2
            cylinder(h=scw_h, r=scw_r, $fn                  =120, center =true);
        }
    }
    
    if(LRS == 1){
        translate([scafold_x/2,scafold_y/2-CCFB,scafold_z/2])
        led_ring_support();
        
        mirror([1,0,0])
        translate([scafold_x/2,scafold_y/2-CCFB,scafold_z/2])
        led_ring_support();
        
        }
    }
}


module cam_holder_base(camera, LRS) {
    // it creates the camera holder base based on the specified camera
    
    if(camera == "waveshare"){
            cam_x = waveshare_cam_x;
            cam_y = waveshare_cam_y;
            scw_x = WS_scw_s + side_thick;
            scw_y = WS_scw_b + back_thick;
            
            support_x = cam_x+2*side_thick; 
            screw_x = support_x/2-scw_r-                  scw_x;
            
            scafold_y = scafold_y + cam_y/2;
        
            make_chb(scw_y,screw_x,                 scafold_y, LRS);
        }
    
    else if(camera == "RPIV2"){
            cam_x = RPIV2_cam_x;
            cam_y = RPIV2_cam_y;
            scw_x = V2_scw_s + side_thick;
            scw_y = V2_scw_b + back_thick;
            
            support_x = cam_x+2*side_thick; 
            screw_x = support_x/2-scw_r-                  scw_x;
            
            scafold_y = scafold_y + cam_y/2;
            make_chb(scw_y,screw_x,                 scafold_y, LRS);
        
        }
     
}

module camera_mount(camera){
    // it creates the camera mount over the base holder, based on the specified camera.
    
    
    if(camera == "waveshare"){
            cam_x = waveshare_cam_x;
            cam_y = waveshare_cam_y;
            cam_z = waveshare_cam_z;
            hold_x = WS_hold_x;
            hold_y = WS_hold_y;
            scw_y = WS_scw_b + back_thick;
            scw_x = WS_scw_s + side_thick;
            scafold_y = scafold_y + cam_y/2;
        
        support_z = cam_z+bottom_thick;
        support_y = hold_y + back_thick;
        support_x = cam_x+2*side_thick; 
        
        
        translate([0,-scafold_y/2 + support_y/2,scafold_z/2+support_z/2])
        difference(){
            cube([support_x,support_y,support_z], center=true);
            translate([0,back_thick/2,-bottom_thick/2])
            cube([cam_x,hold_y,cam_z], center=true);
            cube([cam_x - 2*hold_x,support_y,support_z], center=true);
            
            //Screw holes
            screw_x = support_x/2-scw_r-scw_x;
            for (a =[screw_x,-screw_x]){
                translate([a,-support_y/2+scw_r+scw_y ,0])
                cylinder(h=support_z, r=scw_r, $fn=120, center =true);
            }            
        }    
    }
    
    else if(camera == "RPIV2"){
            cam_x = RPIV2_cam_x;
            cam_y = RPIV2_cam_y;
            cam_z = RPIV2_cam_z;
            hold_x = V2_hold_x;
            hold_y = V2_hold_y;
            base_space = RPIV2_connec_x+0.2;
            scw_y = V2_scw_b + back_thick;
            scw_x = V2_scw_s + side_thick;
            scafold_y = scafold_y + cam_y/2;
        
        support_z = cam_z+bottom_thick + RPIV2_connec_z;
        support_y = hold_y + back_thick;
        support_x = cam_x+2*side_thick;
        
        difference(){ //this is to extend the central hole in the z axis
        translate([0,-scafold_y/2 + support_y/2,scafold_z/2+support_z/2])
        difference(){
            cube([support_x,support_y,support_z], center=true);
            // camera PCB hole
            translate([0,back_thick/2,-bottom_thick/2 + RPIV2_connec_z/2])
            cube([cam_x,hold_y,cam_z], center=true); 
            // base hole
            translate([0,0,-bottom_thick/2])
            cube([base_space,support_y,support_z-bottom_thick], center=true); 
            // camera hole
            translate([0,0,(support_z-bottom_thick)/2])
            cube([RPIV2_sensor_x,support_y,bottom_thick], center=true); 
            
            //Screw holes
            screw_x = support_x/2-scw_r-scw_x;
            for (a =[screw_x,-screw_x]){
                translate([a,-support_y/2+scw_r+scw_y ,0])
                cylinder(h=support_z, r=scw_r, $fn=120, center =true);
            } 
        }
    // extend the central square hole
    translate([0,sca_deep/2,cam_z+ RPIV2_connec_z])
    cube([scafold_x - 2*sca_arms_width,scafold_y - sca_deep,scafold_z], center=true);
    }
        
    }
    
}

module led_ring_support(){
    //  it creates the support for the LED ring.
    
    lrs_x = sca_thick_side;
    lrs_y = 2 * hrh_y + rh_screw;
    lrs_z = 2 * hrh_z + rh_screw;
    
    translate([-lrs_x/2,0,lrs_z/2])
    union(){
        difference(){
            //base cube with screw hole
            cube([lrs_x,lrs_y,lrs_z], center=true);
            rotate([0,90,0]) 
            cylinder($fn = 50, h=sca_thick_side, r=rh_screw, center=true);
        }
        // triangular support back
        translate([0,lrs_y/2,-lrs_z/2])
        rotate([0,-90,0]) 
        linear_extrude(height = lrs_x, center = true, convexity = 10, twist = 0)
        polygon(points=[[0,0],[0,lrs_z/2],[lrs_z,0]]);
    
        // triangular support front
        mirror([0,1,0])translate([0,lrs_y/2,-lrs_z/2])
        rotate([0,-90,0]) 
        linear_extrude(height = lrs_x, center = true, convexity = 10, twist = 0)
        polygon(points=[[0,0],[0,lrs_z/2],[lrs_z,0]]);
    }        
    
}

module led_ring_enclosure(){
    // to create the PCB ring enclosure
        
    difference(){
        union(){
            // base cylinder
            difference(){
            cylinder($fn = 100, h=hre, r=rre, center=true);
            translate([0,0,re_zt/2])
            cylinder($fn = 100, h=hre-re_zt, r=rre-re_rt, center=true);
            }
            
            // internal cylinder
            cylinder($fn = 100, h=hre, r=rrei, center=true);
            
            //screw supports
            for (x =[x_shd/2,-x_shd/2]){
                for (y =[y_shd/2,-y_shd/2]){ 
                    translate([x,y,(re_bh-hre)/2+re_zt])
                    cylinder($fn = 100, h=re_bh, r=rh_screw + r_sh, center=true);
                }
            }
        }
            //internal hole
            cylinder($fn = 100, h=hre, r=rrei-re_rt, center=true);
            
            //screw holes for LED ring
            for (x =[x_shd/2,-x_shd/2]){
                for (y =[y_shd/2,-y_shd/2]){ 
                    translate([x,y,(re_bh-hre+re_zt)/2])
                    cylinder($fn = 100, h=re_bh+re_zt, r=r_sh, center=true);
                }
            }
            
            //cable hole
            chsz_final = chs_z + re_ch1 + re_ch2;
            translate([0,rre-0.5*re_rt,(hre-chsz_final)/2])
            cube([chs_x,2*re_rt,chsz_final], center = true);
            
            //arms hole
            xash = scafold_x/2 + arm_tick + s_arm_screw+ra_screw;
            
            for (x =[xash,-xash]){
                translate([x,0,(re_zt-hre)/2])
                cylinder($fn = 100, h=re_zt, r=ra_screw, center=true);
                }
            
            // Clamp
            for (rc =[rre-re_cdh,-(rre)]){
                
                // enter track
                c_angle1 = (re_cw1/(rre - re_cdh))*360/(2*PI);
                translate([0,0,hre/2-re_ch1])
                rotate_extrude(angle = c_angle1,convexity = 5, $fn = 500)
                translate([rc,0,0])
                polygon( points=[[0,0],[0,re_ch1],[re_cdh,re_ch1],[re_cdh,0]] );
                
                // horizontal track
                c_angle2 = (re_cw2/(rre - re_cdh))*360/(2*PI);
                translate([0,0,hre/2-(re_ch1+re_ch2)])
                rotate_extrude(angle = c_angle2,convexity = 5, $fn = 500)
                translate([rc,0,0])
                polygon( points=[[0,0],[0,re_ch2],[re_cdh,re_ch2],[re_cdh,0]] );
            }

    }
    
}
module led_ring_diffusor_out(){
    // to create the outer ring diffusor holder
    
    lrd_h = dh_zt + re_ch1 + re_ch2;
    lrd_r = rre+re_rt+0.3; // 0.3 looseness
    
    rotate([180,0,0])
    union(){
        difference(){
            //base cylinder
            cylinder($fn = 100, h=lrd_h, r=lrd_r, center=true);
            
            //central hole
            translate([0,0,dh_zt/2])
            cylinder($fn = 100, h=lrd_h-dh_zt, r=lrd_r-re_rt, center=true);
            //diffusor support sheet
            cylinder($fn = 100, h=lrd_h, r=lrd_r-re_rt-dh_zt, center=true);    
        }
        
        // clamp
        for (rc =[lrd_r-re_rt-re_cd,-(lrd_r-re_rt)]){
            c_angle = (re_cw/(lrd_r - re_cd))*360/(2*PI);
            translate([0,0,lrd_h/2-re_ch])
            rotate_extrude(angle = c_angle,convexity = 5, $fn = 500)
            translate([rc,0,0])
            polygon( points=[[0,0],[0,re_ch],[re_cd,re_ch],[re_cd,0]] );
        }
    }
    
}

module led_ring_diffusor_in(){
    // To create the inner ring to support the diffusor
    rotate([180,0,0])
    difference(){
        //base cylinder
        cylinder($fn = 100, h=dhi_h+dh_zt, r=rrei+dhi_rt+dhi_sheet, center=true);
        //central hole
        cylinder($fn = 100, h=dhi_h+dh_zt, r=rrei, center=true);
        //diffusor support sheet
        translate([0,0,dh_zt/2])
        difference(){
            cylinder($fn = 100, h=dhi_h, r=rrei+dhi_rt+dhi_sheet, center=true);
            cylinder($fn = 100, h=dhi_h, r=rrei+dhi_rt, center=true);
        }    
    }
    
    
}

module led_ring_arms(){
    // To create the arms to attach the led ring enclosure to the camera support
    arm_y = 2*(arm_hbt + rh_screw);
    
    rotate([180,0,0]) // to display
    union(){
        
        // vertical portion
        translate([arm_tick/2,0,arm_z/2])
        difference(){
            cube([arm_tick,arm_y,arm_z], center=true);
            cube([arm_tick,2*rh_screw,arm_z-2*arm_tick], center=true);
        }
        
        //horizontal portion
        difference(){
            arm_x = arm_hbt + 2*ra_screw +    s_arm_screw+arm_tick;
            translate([arm_x/2,0,arm_tick/2])
            cube([arm_x,arm_y,arm_tick], center = true);
            translate([ra_screw+s_arm_screw+arm_tick,0,arm_tick/2])
            cylinder($fn = 100, h=arm_tick, r=ra_screw, center=true);
        }
    }
}

module led_ring(camera){
    
    // it is necessary to indicate the camera to position the ring LED properly (aligned with lent)
    if(camera == "waveshare"){
        
        cam_y = waveshare_cam_y;
        scafold_y = scafold_y + cam_y/2;
        
    translate([0,scafold_y/2-CCFB,arm_z])
    difference(){
        cylinder(h=ring_h, r=r_ext, center=true);
        cylinder(h=ring_h, r=r_int, center=true);
        }
    }
    
    else if(camera == "RPIV2"){
        
        cam_y = RPIV2_cam_y;
        scafold_y = scafold_y + cam_y/2;
        
    translate([0,scafold_y/2-CCFB,arm_z])
    difference(){
        cylinder(h=ring_h, r=r_ext, center=true);
        cylinder(h=ring_h, r=r_int, center=true);
        }
    }

}

module display_camera(camera){
    
    if(camera == "waveshare"){
        
        cam_x = waveshare_cam_x;
        cam_y = waveshare_cam_y;
        cam_z = waveshare_cam_z;
        scw_x = WS_scw_s + side_thick;
        scw_y = WS_scw_b + back_thick;
        
        support_x = cam_x+2*side_thick; 
        screw_x = support_x/2-scw_r-                  scw_x;
        scafold_y = scafold_y + cam_y/2;
        
        translate([0,(cam_y-scafold_y)/2+ back_thick,(cam_z+scafold_z)/2])
        union(){
            cube([cam_x,cam_y,cam_z],center = true);
            cylinder(h=2*cam_z, r=2, center=true);
            //translate([0,0,(scafold_z/2)+cam_z+2])
            //cube([1.5*scafold_x,1,1],center = true);
            }
        }

    else if(camera == "RPIV2"){
        cam_x = RPIV2_cam_x;
        cam_y = RPIV2_cam_y;
        cam_z = RPIV2_cam_z;
        scw_x = V2_scw_s + side_thick;
        scw_y = V2_scw_b + back_thick;
        
        support_x = cam_x+2*side_thick; 
        screw_x = support_x/2-scw_r-                  scw_x;
        scafold_y = scafold_y + cam_y/2;
        
        translate([0,(cam_y-scafold_y)/2+ back_thick,(cam_z+scafold_z)/2])
        union(){
            cube([cam_x,cam_y,cam_z],center = true);
            cylinder(h=2*cam_z, r=2, center=true);
            //translate([0,0,(scafold_z/2)+cam_z+2])
            //cube([1.5*scafold_x,1,1],center = true);
            }
        
        }
    }

//uncomment the camera you pretend to use

camera = "waveshare";
//camera = "RPIV2";
LRS = 1; // 1 to add LED Ring Support, 0 to don't.


//cam_holder_base(camera,LRS);
//camera_mount(camera);

//*/
ztrans = hre/2+arm_z; 
translate([0,0,ztrans])
union(){
translate([scafold_x/2,0,-hre/2])
led_ring_arms();
led_ring_enclosure();
translate([0,0,hre/2+5])
    
union(){
    led_ring_diffusor_out();
    led_ring_diffusor_in();
    }
}
//*/   
//uncomment next modules to display the elements
//display_camera(camera);
//led_ring(camera);