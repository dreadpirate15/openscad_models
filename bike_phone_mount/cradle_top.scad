module top () {
	difference () {
		cube([60,25,15], center=true);
		translate([0,-5,7.5]) {
			rotate([45,0,0]) {
				cube([60,10,10], center=true);
			}
		}
		translate([-24, 7, -7.5]) {
			cylinder(h=40, d=6, $fn=100);
		}
		translate([24, 7, -7.5]) {
			cylinder(h=40, d=6, $fn=100);
		}
	}
	difference () {
		translate([-30,2.5,0]) {
			cube([15,10,40]);
		}
		translate([13,4,7]) {
			rotate([0,0,45]) {
				cube([5,5,40]);
			}
		}
	}
	difference () {
		translate([15,2.5,0]) {
			cube([15,10,40]);
		}
		translate([-13,4,7]) {
			rotate([0,0,45]) {
				cube([5,5,40]);
			}
		}
	}
}


	difference () {
		cube([15,10,40]);
		rotate([0,0,45]) {
			cube([5,5,40]);
		}
	}

//top();