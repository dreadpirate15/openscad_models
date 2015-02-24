module bracket() {
	hull() {
		translate([0, 10, 1]) cylinder(h=2, r=10, center=true);
		translate([0, 20, 1]) cube([20,15,2], center=true);
		}
	hull() {
		translate([0, 10, 4]) cylinder(h=6, r=7.5, center=true);
		translate([0, 20, 4]) cube([15,15,6], center=true);
		}
	}

module screw() {
	
}

difference() {
	bracket();
	