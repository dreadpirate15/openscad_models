// Spacer for PrintrBot spool roller
height = 6.3;

base_width = 84;
base_depth = 57;

screw_diameter = 4;
screw_depth = 4;

nub_width = 6;
nub_depth = 6;

// Insert vars
insert_width = 8.3;
insert_depth = 4;
insert_offset = (base_width/2 - screw_diameter * 1.5);

module nub () {
	cube ( [ nub_width, nub_depth, height ], center=true );
}


module base () {
	// Actual spacer
	union () {
		cube( [ base_width, base_depth, height ], center=true );
		translate ( [ base_width/2 + nub_width/2, -21, 0 ] ) { nub(); }
		translate ( [ base_width/2 + nub_width/2, 21, 0 ] ) { nub(); }
		translate ( [ -(base_width/2 + nub_width/2), -21, 0 ] ) { nub(); }
		translate ( [ -(base_width/2 + nub_width/2), 21, 0 ] ) { nub(); }
	} // end union
}


module insert () {
	// Insert nut and screw bolt into place
	// Firmly attaches roller sides to spacer
	union () {
		cube ( [ insert_width, insert_depth, height ], center=true );
		translate ( [ 0,4,0 ] ) {
			cube ( [ screw_diameter, screw_depth, height ], center=true );
		} // end translate
	} // end union
}

difference () {
	
	base();
	translate( [ -insert_offset,0,0 ] ) { rotate ( [ 0,0,90 ] ) { insert(); } }
	translate( [ insert_offset,0,0 ] ) { rotate ( [ 0,0,270 ] ) { insert(); } }
	cylinder ( height, r=base_depth/3, center=true);
}