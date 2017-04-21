// select the directory with the files and the directory
// where the ready files will be saved

dir1 = getDirectory("Choose a source Directory ");
dir2 = getDirectory("Choose a result Directory ");
list = getFileList(dir1);


// loop trough the files and find the background image
for (i=0; i<list.length; i++) {
	if(matches(list[i], ".*background.*")) {
		bgr = list[i];
		open(dir1+bgr);
		run("RGB Color");
		run("Invert");
	}
}

// loop trouch the files and substract the background from them
for (i=0; i<list.length; i++) {
	if(!matches(list[i], ".*background.*")) {
		path = dir1+list[i];
		setBatchMode(true);
		showProgress(i, list.length);
		open(path);
		run("RGB Color");
		imageCalculator("Add create stack", list[i],bgr);
		selectWindow(list[i]);
		run("Close");
		selectWindow("Result of "+list[i]);
		saveAs("png", dir2+list[i]+"_result");
		close();
	}
}

// saves all files and close
selectWindow(bgr);
close();
