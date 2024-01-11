application_surface_draw_enable(false);
draw_set_font(FORMS_FntNormal);

gui = new FORMS_RootWidget();

function TestContent() : FORMS_Content() constructor
{
	Checked1 = false;
	Checked2 = true;
	Radio = 0;
	Slider = 0;
	DropdownValues = [
		"Some",
		"Shit",
		"Here",
		"That",
		"You",
		"Can",
		"Select",
	];
	DropdownIndex = 0;
	InputString = "";
	InputReal = 0;

	static draw = function ()
	{
		var _props;

		Pen.start(8, 8)
			.text("Some shit ")
			.text("Some other shit!", { Color: c_orange, Cursor: cr_handpoint, Tooltip: "Oh yeah!" })
			.nl();

		if (Pen.button("Click me!", { Tooltip: "Click the button!" }))
			show_debug_message("Clicked!");
		Pen.nl();

		if (Pen.checkbox(Checked1) | Pen.link(" Label 1"))
			Checked1 = !Checked1;
		Pen.nl();

		_props = { Tooltip: "Checkbox with a clickable label!" };
		if (Pen.checkbox(Checked2, _props) | Pen.link(" Label 2", _props))
			Checked2 = !Checked2;
		Pen.nl();

		if (Pen.radio(Radio == 0) | Pen.link(" Radio 1"))
			Radio = 0;
		Pen.nl();

		if (Pen.radio(Radio == 1) | Pen.link(" Radio 2"))
			Radio = 1;
		Pen.nl();

		if (Pen.radio(Radio == 2) | Pen.link(" Radio 3"))
			Radio = 2;
		Pen.nl();

		if (Pen.slider("slider", Slider, -100, 100, { Pre: "X: ", Post: "%", Integers: true, Tooltip: "This is the best slider ever!" }))
			Slider = Pen.get_result();
		Pen.text(" Slider").nl();

		if (Pen.dropdown("dropdown", DropdownIndex, DropdownValues))
			DropdownIndex = Pen.get_result();
		Pen.text(" Dropdown").nl();

		if (Pen.input("input-string", InputString, { Placeholder: "Some text here..." }))
			InputString = Pen.get_result();
		Pen.text(" String input").nl();

		if (Pen.input("input-real", InputReal, { Tooltip: "This one has a tooltip!" }))
			InputReal = Pen.get_result();
		Pen.text(" Real input").nl();

		Pen.finish();

		Width = Pen.MaxX + 8;
		Height = Pen.MaxY + 8;

		return self;
	};
}

var _scrollPane1 = new FORMS_ScrollPane(new TestContent(), {
	X: 10,
	XUnit: FORMS_EUnit.Percent,
	Y: 32,
	Width: 300,
	Height: 200,
	Container: {
		BackgroundColor: c_lime,
		BackgroundAlpha: 0.5,
	}
});

gui.add_child(_scrollPane1);

var _scrollPane2 = new FORMS_ScrollPane(new TestContent(), {
	X: 20,
	XUnit: FORMS_EUnit.Percent,
	Y: 64,
	Width: 300,
	Height: 400,
	Container: {
		BackgroundSprite: FORMS_SprRound8,
		BackgroundColor: c_red,
		BackgroundAlpha: 0.5,
	}
});

gui.add_child(_scrollPane2);
