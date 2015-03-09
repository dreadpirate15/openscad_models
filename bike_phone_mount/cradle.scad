module base () {
	difference () {
		cube([60,25,15], center=true);
		translate([0,-5,7.5]) {
			rotate([45,0,0]) {
				cube([60,10,10], center=true);
			}
		}
		translate([-24, 7, -7.5]) {
			cylinder(h=15, d=6, $fn=100);
		}
		translate([24, 7, -7.5]) {
			cylinder(h=15, d=6, $fn=100);
		}
	}
	translate([0,7.5,27]) {
		cube([25,10,40], center=true);
	}
	translate([12.5,4,7]) {
		rotate([0,0,45]) {
			cube([5,5,40]);
		}
	}
	translate([-12.5,4,7]) {
		rotate([0,0,45]) {
			cube([5,5,40]);
		}
	}
}

base();