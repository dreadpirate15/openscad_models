bar_diameter = 35.3;
base_width = bar_diameter + 30;
base_depth = bar_diameter - 10;
base_height = bar_diameter / 2 + 5;
bar_rad = bar_diameter /2;

screw_diameter = 3.5;
screw_head = 7;

difference() {

		// base cube
	cube([base_width, base_depth, base_height]);

		// cylinder difference for handlbar
	translate([base_width / 2,base_depth + 1,bar_rad + 5])
		rotate([90,0,0]) cylinder(h=base_depth + 2, r=bar_rad, $fn=100);

		// cube difference to remove extra volume
	translate([0,0,0])
		cube([10,base_depth,base_height-10]);
	translate([base_width-10,0,0])
		cube([10,base_depth,base_height-10]);

		// screw hole
	translate([base_width -5,base_depth/2,base_height-10]) {
		cylinder(h=2, r=screw_head/2, $fn=100);
		cylinder(h=10, r=screw_diameter/2, $fn=100);
	}

	translate([5,base_depth/2,base_height-10]) {
		cylinder(h=2, r=screw_head/2, $fn=100);
		cylinder(h=10, r=screw_diameter/2, $fn=100);
	}

		// mount holes
	translate([base_width/2, base_depth/3, 3]) {
		cylinder(h=3, r=screw_head/2, $fn=6);
	}
	translate([base_width/2, base_depth/3 * 2, 3]) {
		cylinder(h=3, r=screw_head/2, $fn=6);
	}
	translate([base_width/2, base_depth/3, 0]) {
		cylinder(h=10, r=screw_diameter/2, $fn=100);
	}
	translate([base_width/2, base_depth/3 * 2, 0]) {
		cylinder(h=10, r=screw_diameter/2, $fn=100);
	}
	hull() {
		translate([base_width/2, 10, 1]) cylinder(h=2, r=8, center=true);
		translate([base_width/2, 20, 1]) cube([16,16,2], center=true);
	}
}








