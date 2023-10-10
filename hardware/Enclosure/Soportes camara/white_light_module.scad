/*
    Isaac Núñez 2022 (CC BY 4.0; https://creativecommons.org/licenses/by/4.0/) 
 
    This code generate the estructure for the 
    white ligth module of the Fluopi equipment.
 
*/


/////////////////
// Parameters //
////////////////

// General
ri = 95/2;          // internal radious
wall_thick = 1 ;    // wall thickness
filter_thick = 1;
filter_h = 17;
side_h = 8;
front_h = filter_h + wall_thick -1 ; 


filter_free_space = 0.5;   //filter thick looseness
bottom_thick = 0.8;        // bottom thickness
h_thread = 2;