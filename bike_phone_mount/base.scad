internal_rad = 4;
base_width = 18;

difference() {
	// base cube
	cube([base_width, 8, 6], center=true);
	// cylinder difference for handlbar
	translate([0,5,3])
		rotate([90,0,0]) cylinder(h=9, r=internal_rad, $fn=100);
	// cube difference to remove extra volume
	translate([7,0,-2])
		cube([4,8,4], center=true);
	translate([-7,0,-2])
		cube([4,8,4], center=true);
	translate([-7,0,0]) {
		cylinder(h=2, r=1.5, center=true, $fn=6);
		cylinder(h=8, r=1, center=true, $fn=100);
	}
	translate([7,0,0]) {
		cylinder(h=2, r=1.5, center=true, $fn=6);
		cylinder(h=8, r=1, center=true, $fn=100);
	}
}