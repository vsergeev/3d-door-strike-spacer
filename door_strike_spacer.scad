/********************************************************
 * Door Strike Spacer - vsergeev
 * https://github.com/vsergeev/3d-door-strike-spacer
 * CC-BY-4.0
 *
 * Release Notes
 *  * v1.0 - 06/20/2023
 *      * Initial release.
 ********************************************************/

/* [Basic] */

// in mm
spacer_z_thickness = 5;

/* [Advanced] */

// in mm
spacer_x_width = 31;

// in mm
spacer_y_height = 57;

// in mm
spacer_xy_radius = 6;

// in mm
spacer_screw_xy_diameter = 6.5;

// in mm
spacer_screw_y_spacing = 41;

// in mm
spacer_screw_x_offset = 2.5;

// in mm
spacer_latch_x_width = 18.5;

// in mm
spacer_latch_y_height = 26;

// in mm
spacer_latch_x_offset = 4;

// in mm
spacer_latch_xy_radius = 2;

/* [Hidden] */

$fn = 100;

/******************************************************************************/
/* 2D Profiles */
/******************************************************************************/

module profile_spacer() {
    difference() {
        /* Spacer Body */
        offset(r=spacer_xy_radius)
            offset(delta=-spacer_xy_radius)
                square([spacer_x_width, spacer_y_height], center=true);

        /* Screw Holes */
        translate([spacer_screw_x_offset, spacer_screw_y_spacing / 2])
            circle(d=spacer_screw_xy_diameter);
        translate([spacer_screw_x_offset, -spacer_screw_y_spacing / 2])
            circle(d=spacer_screw_xy_diameter);

        /* Latch Opening */
        translate([spacer_latch_x_offset, 0])
            offset(r=spacer_latch_xy_radius)
                offset(delta=-spacer_latch_xy_radius)
                    square([spacer_latch_x_width, spacer_latch_y_height], center=true);
    }
}

/******************************************************************************/
/* 3D Extrusions */
/******************************************************************************/

module spacer() {
    linear_extrude(spacer_z_thickness)
        profile_spacer();
}

/******************************************************************************/
/* Top Level */
/******************************************************************************/

spacer();
