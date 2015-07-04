/* Basic design for an adjustable standing/sitting desk /*
/*

*/

deskWidth = 48;
deskDepth = 24;
legHeight =24;
footDepth = 20;
footWidth = 6;
footHeight = 1.5;
pwt = 0.75; // Plywood Thickness

/* Put it all together */
fullDesk();

//all the things
module fullDesk() {
	deskTop();
	translate([-(deskWidth/4),-(deskDepth/7),-(legHeight/2)]) {
		deskLeg();
	}
	translate([deskWidth/4,-(deskDepth/7),-(legHeight/2)]) {
		deskLeg();
	}
}


// defines the main desk surface:
module deskSurface() {
	cube(size=[deskWidth, deskDepth, pwt], center=true);
}

// divider
module deskDivider(x, y, z) {
	translate([x, y, z]) {
		cube(size=[pwt, deskDepth, 3], center=true);
	}
}

// top pieces fit together
module deskTop() {
	union() {
		deskSurface();
		translate([0, 0, 3 + pwt]) {
			deskSurface();
		}
		deskDivider((deskWidth/2) - pwt/2, 0, (3 + pwt) / 2); // right end
		deskDivider(-((deskWidth/2) - pwt/2), 0, (3 + pwt) / 2); // left end
		deskDivider((deskWidth/4) - pwt/2, 0, (3 + pwt) / 2); // right divider
		deskDivider(-((deskWidth/4) - pwt/2), 0, (3 + pwt) / 2); // left divider
	}
}

// pretty foot
module foot() {
	
	difference() {
		cube([footWidth, footDepth, footHeight], center=true);
		translate([0, footDepth/2, 0]) {
			rotate(145, [1,0,0]) {
				cube([footWidth, footDepth, footHeight], center=true);
			}
		}
		translate([0, -(footDepth/2), 0]) {
			rotate(35, [1,0,0]) {
				cube([footWidth, footDepth, footHeight], center=true);
			}
		}
	}
}

module innerLeg() {
	
}

// yes, outer leg
module outerLeg() {
	cube([2*(footWidth/3), 2*(footWidth/3), legHeight], center=true);
}


module deskLeg() {
	innerLeg();
	outerLeg();
	translate([0, footDepth/10, -(legHeight/2 + .75)]) {
		foot();
	}
}