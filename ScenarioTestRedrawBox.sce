
response_matching = simple_matching;
default_background_color = 255,255,255;
active_buttons =3;
button_codes = 1,2,3;

begin;

picture {box { height = 100; width = 100; color = 255,0,0; };x=0;y=0;}red;
picture {box { height = 100; width = 100; color = 0,255,0; };x=0;y=0;}green;
box { height = 1080; width = 1920; color = 255,0,0; }redbox;
box { height = 1080; width = 1920; color = 0,255,0; }greenbox;
box { height = 1080; width = 1920; color = 0,0,0; }blackbox;
picture{	
	bitmap { 
		filename = "Preparation/Preparation1.png";
	}bp;
	x = 0 ; y = 0;
	
	bitmap { 
		filename = "Preparation/Preparation1.png";
	}bp2;
	x = 0 ; y = -300;
}picTest;
trial{
	picture picTest;  	
	time = 0;
	duration = 1000;
}trialStimulusFinal;

begin_pcl;
array <bool> t[5] = {true,true,false,false,false};

int cursorPos = 4;
string cursorFName = "Question";
bp.unload();
bp.set_filename(cursorFName+string(cursorPos)+".jpg");
bp.load();
int countPos = response_manager.total_response_count( 1 );
int countNeg = response_manager.total_response_count( 2 );
loop until response_manager.total_response_count( 3 ) > 0 begin
	if(response_manager.total_response_count( 2 ) > countNeg) then
		countNeg = response_manager.total_response_count( 2 );
		cursorPos = cursorPos+1;
	end;
	if(response_manager.total_response_count( 1 ) > countPos) then
		countPos = response_manager.total_response_count( 1 );
		cursorPos = cursorPos-1;
	end;
	if(cursorPos < 1) then
		cursorPos = 1;
	end; 
	if (cursorPos > 7) then
		cursorPos = 7;
	end;
	bp.unload();
	bp.set_filename(cursorFName+string(cursorPos)+".jpg");
	bp.load();
	trialStimulusFinal.present();
end;