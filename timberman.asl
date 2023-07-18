//Timberman
//Felicien2B and Jean20B

state("Timberman") {
	uint score: 0x133BC40, 0x60, 0xC8, 0x118, 0x150, 0x20, 0x68, 0x1B0; //Score
}

startup {
	refreshRate = 60;

	//Splits
	settings.Add("score100", true, "100");
	settings.Add("score250", true, "250");
	settings.Add("score500", true, "500");
	settings.Add("score750", true, "750");
	settings.Add("score1000", true, "1000");
	settings.Add("score1500", true, "1500");
	settings.Add("score2000", true, "2000");
	
	vars.start = false;
	vars.split = false;
	vars.end = false;
}

update {
	//Time starts when the score counter changes to 1
	vars.start = (old.score == 0 && current.score > 0);
	//Time splits/ends when the score counter reaches a selected goal
	vars.split = ((old.score < 100 && current.score >= 100 && settings["score100"]) || (old.score < 250 && current.score >= 250 && settings["score250"]) || (old.score < 500 && current.score >= 500 && settings["score500"]) || (old.score < 750 && current.score >= 750 && settings["score750"]) || (old.score < 1000 && current.score >= 1000 && settings["score1000"]) || (old.score < 1500 && current.score >= 1500 && settings["score1500"]) || (old.score < 2000 && current.score >= 2000 && settings["score2000"]));
	//Time resets when the score counter resets
	vars.end = (old.score != 0 && current.score == 0);
}

start {
	return vars.start;
}

split {
	return vars.split;
}

reset {
	if (vars.end) {
		vars.start = false;
		vars.split = false;
		vars.end = false;
		return true;
	}
	return false;
}
