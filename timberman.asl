//Timberman
//Felicien2B and Jean20B

state("Timberman") {
	uint score: 0x133BC40, 0x60, 0xC8, 0x118, 0x150, 0x20, 0x68, 0x1B0; //Score
}

startup {
	vars.scores = new[] { 100, 250, 500, 750, 1000, 1500, 2000 };

	//Splits
	settings.Add("score100", true, "100");
	settings.Add("score250", true, "250");
	settings.Add("score500", true, "500");
	settings.Add("score750", true, "750");
	settings.Add("score1000", true, "1000");
	settings.Add("score1500", true, "1500");
	settings.Add("score2000", true, "2000");
}

start {
	return old.score == 0 && current.score > 0;
}

split {
	foreach (int targetScore in vars.scores) {
		if (old.score < targetScore && current.score >= targetScore && settings["score" + targetScore])
			return true;
	}
}

reset {
	return old.score != 0 && current.score == 0;
}
