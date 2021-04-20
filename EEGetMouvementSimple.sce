scenario = "EEGetMouvementSimple";
response_matching = simple_matching;
default_background_color = 255,255,255;
active_buttons =14;
button_codes = 1,2,3,4,5,6,7,8,9,10,11,12,13,14;

#pulse_out = false;
pulse_value = 5;
pulse_width = 20; # if using parallel port


#-----------------Définition des variables--------------------------------------
begin;

#-----------------Chargement des sons--------------------------------
sound { wavefile { filename = "800ms/audioMosquito24_0.wav";};} sCalib;

sound { wavefile { filename = "800ms/audioMosquito0_m50.wav";};} stimPos;
sound { wavefile { filename = "800ms/audioMosquito0_1.wav";};} stimNeg;

sound { wavefile { filename = "800ms/audioMosquito0_m50.wav";};} stimPosGauche;
sound { wavefile { filename = "800ms/audioMosquito0_1.wav";};} stimNegGauche;
sound { wavefile { filename = "800ms/audioMosquito0_50.wav";};} stimPosDroite;
sound { wavefile { filename = "800ms/audioMosquito0_m1.wav";};} stimNegDroite;
array{
sound { wavefile { filename = "800ms/audioMosquito0_m5.wav";};} sound0_m5;
sound { wavefile { filename = "800ms/audioMosquito3_m4.wav";};} sound3_m4;
sound { wavefile { filename = "800ms/audioMosquito4_m2.wav";};} sound4_m2;
sound { wavefile { filename = "800ms/audioMosquito5_0.wav";};} sound5_0;
sound { wavefile { filename = "800ms/audioMosquito4_2.wav";};} sound4_2;
sound { wavefile { filename = "800ms/audioMosquito3_4.wav";};} sound3_4;
sound { wavefile { filename = "800ms/audioMosquito0_5.wav";};} sound0_5;
sound { wavefile { filename = "800ms/audioMosquito0_m8.wav";};} sound0_m8;
sound { wavefile { filename = "800ms/audioMosquito4_m7.wav";};} sound4_m7;
sound { wavefile { filename = "800ms/audioMosquito7_m4.wav";};} sound7_m4;
sound { wavefile { filename = "800ms/audioMosquito8_0.wav";};} sound8_0;
sound { wavefile { filename = "800ms/audioMosquito7_4.wav";};} sound7_4;
sound { wavefile { filename = "800ms/audioMosquito4_7.wav";};} sound4_7;
sound { wavefile { filename = "800ms/audioMosquito0_8.wav";};} sound0_8;
sound { wavefile { filename = "800ms/audioMosquito0_m14.wav";};} sound0_m14;
sound { wavefile { filename = "800ms/audioMosquito7_m12.wav";};} sound7_m12;
sound { wavefile { filename = "800ms/audioMosquito12_m7.wav";};} sound12_m7;
sound { wavefile { filename = "800ms/audioMosquito14_0.wav";};} sound14_0;
sound { wavefile { filename = "800ms/audioMosquito12_7.wav";};} sound12_7;
sound { wavefile { filename = "800ms/audioMosquito7_12.wav";};} sound7_12;
sound { wavefile { filename = "800ms/audioMosquito0_14.wav";};} sound0_14;
sound { wavefile { filename = "800ms/audioMosquito0_m24.wav";};} sound0_m24;
sound { wavefile { filename = "800ms/audioMosquito12_m21.wav";};} sound12_m21;
sound { wavefile { filename = "800ms/audioMosquito21_m12.wav";};} sound21_m12;
sound { wavefile { filename = "800ms/audioMosquito24_0.wav";};} sound24_0;
sound { wavefile { filename = "800ms/audioMosquito21_12.wav";};} sound21_12;
sound { wavefile { filename = "800ms/audioMosquito12_21.wav";};} sound12_21;
sound { wavefile { filename = "800ms/audioMosquito0_24.wav";};} sound0_24;
sound { wavefile { filename = "800ms/audioMosquito0_m41.wav";};} sound0_m41;
sound { wavefile { filename = "800ms/audioMosquito21_m36.wav";};} sound21_m36;
sound { wavefile { filename = "800ms/audioMosquito36_m20.wav";};} sound36_m20;
sound { wavefile { filename = "800ms/audioMosquito41_0.wav";};} sound41_0;
sound { wavefile { filename = "800ms/audioMosquito36_20.wav";};} sound36_20;
sound { wavefile { filename = "800ms/audioMosquito21_36.wav";};} sound21_36;
sound { wavefile { filename = "800ms/audioMosquito0_41.wav";};} sound0_41;
}sounds;
picture {box { height = 100; width = 100; color = 255,0,0; };x=0;y=0;}red;
picture {box { height = 100; width = 100; color = 0,255,0; };x=0;y=0;}green;
box { height = 1080; width = 1920; color = 255,0,0; }redbox;
box { height = 1080; width = 1920; color = 0,255,0; }greenbox;
box { height = 1080; width = 1920; color = 0,0,0; }blackbox;

#Trial de reponse pendant la trajectoire
picture{	
	display_index = 1;
	bitmap { 
		filename = "QuestionGauche.png";
	}bp;
	x = 0 ; y = 0;
	
}picQuestion;

#Trial de pause
picture{
	text{
		caption ="C'est le moment de faire une pause!\n Prenez le temps qu'il vous faut pour souffler,\n et lorsque vous êtes prêt à repartir, appuyez sur [Entrée]";
		font_size = 40;
		font_color = 0,0,0;
		text_align = align_center;
	};
	x = 0 ; y = 0;
}picPause;

#Trial de question sur l'anxiété en fin de trajectoire
text {
	caption = "A quel point cette trajectoire a été désagréable?\n 1 : Pas désagréable du tout - 9 : Très désagréable";
	font_size = 40;
	font_color = 0,0,0;
	text_align = align_center;
}ecranDesagreable;

#---------------Trials-------------
#Trials d'initialisation
trial{ #Choix de la latéralité de la cible négative
	stimulus_event{
		picture{
			text{
				caption = "Choisissez le timing de réponse :\n 1 : Attente de réponse \n 2 : 700ms max pour répondre";
				font_color = 0,0,0;
				font_size = 40;
			};
			x = 0 ; y = 0 ;
		};
		response_active = true;
		duration = response;
		deltat = 10;
	};
}trialTiming; 


trial{ #Choix de la latéralité de la cible négative
	stimulus_event{
		picture{
			text{
				caption = "Choisissez la position cible :\n 1 : Gauche \n 2 : Droite";
				font_color = 0,0,0;
				font_size = 40;
			};
			x = 0 ; y = 0 ;
		};
		response_active = true;
		duration = response;
		deltat = 10;
	};
}trialInit; 

trial{ #Information sur la main dominante du sujet
	stimulus_event{
		picture{
			text{
				caption = "Quel est la main dominante du sujet :\n 1 : Gauche \n 2 : Droite";
				font_color = 0,0,0;
				font_size = 40;
			};
			x = 0 ; y = 0 ;
		};
		response_active = true;
		duration = response;
		deltat = 10;
	};
}trialMain;

#Trial d'explication de l'expérience
trial{
	picture{	bitmap { filename = "Preparation/Preparation1.png";};x = 0 ; y = 0;};
	time = 0;	
	duration = response;
	
	picture{bitmap { filename = "Preparation/InfoTraj.png";};x = 0 ; y = 0;};
	deltat = 0;
	duration = response;
	
	picture{bitmap { filename = "Preparation/InfoTraj2.png";};x = 0 ; y = 0;};
	deltat = 0;
	duration = response;
	
	picture{bitmap { filename = "Preparation/InfoTraj3.png";};x = 0 ; y = 0;};
	deltat = 0;
	duration = response;
	
	picture{bitmap { filename = "Preparation/InstructionQuestion.png";};x = 0 ; y = 0;};
	deltat = 0;
	duration = response;
	
	
}trialPreparation;

#Trial calibration
trial {
	stimulus_event{
		picture{
			bitmap { filename = "Preparation/EssaiTest.png";};
			x = 0; y = 0;
		};
		
		duration = 1500;
		time = 0;
	};
}trialCalibration;

trial {
	picture{bitmap { filename = "Preparation/EssaiTest.png";};x = 0 ; y = 0;};
	deltat = 0;
	duration = response;
}essaiTest;

trial {
	picture{bitmap { filename = "Preparation/FinPreparation.png";};x = 0 ; y = 0;};
	deltat = 0;
	duration = response;
}trialDebutExpe;
#Trials de calibration de niveaux de son
trial{
	stimulus_event{
		picture{
			text{
				caption = "Nous allons calibrer l'experience en fonction de vos capacitées auditives\nConcentrez vous sur ce que vous entendez et suivez les instructions\nAppuyez sur [Entrée] pour commencer la calibration";
				font_color = 0,0,0;
				font_size = 40;
			}te;
			x = 0 ; y = 0 ;
		};
		response_active = true;
		duration = response;
		deltat = 10;
	};
}trialDebCalib;
trial{
	stimulus_event{
		picture{
			text{
				caption = "Appuyez sur [Entrée] pour passer à la suite";
				font_color = 0,0,0;
				font_size = 40;
			}tPrep;
			x = 0 ; y = 0 ;
		};
		response_active = true;
		duration = response;
		deltat = 10;
	};
}trialPrep;
trial{
	sound sCalib;
	time = 0;
	duration = 1000;
	picture{
		text{
			caption = "Appuyez sur [Entrée] dès que vous entendez un son";
			font_color = 0,0,0;
			font_size = 40;
		}t;
		x = 0; y = 0;
	};
	deltat=0;
}
trialCalib;

#Trial de debut de trajectoire
trial{
	stimulus_event{
		picture{
			text{
				caption = "Début de la trajectoire";
				font_color = 0,0,0;
				font_size = 40;
			};
			x = 0 ; y = 0 ;
		};
		duration = 1000;
	};
}trialDebutTrajectoire;

# Trial presentant un son de moustique
trial{
	stimulus_event{
		sound sound36_20;
		time = 0;
		#duration = 800;
	}s1;
}trialSon;

#Trial de pause entre sons

trial{
	stimulus_event{
		picture picPause;		
	};
}trialPause;

#Trial posant la question lié au risque de piqûre
trial{
	#Question sur le déplacement
	stimulus_event{
		picture picQuestion;
		response_active = true;
		target_button = 2;
		duration = 700;
	}eventQuestion;	
}trialQuestionTimed;
trial{
	#Question sur le déplacement
	stimulus_event{
		picture picQuestion;
		response_active = true;
		target_button = 2;
		duration = response;
	};	
}trialQuestion;


trial{
	#Question sur le déplacement
	stimulus_event{
		picture {
			bitmap{filename="blank.png";};
			x = 0 ; y = 0;
		};
		response_active = true;
		target_button = 2;
		duration = 500;
	};	
}trialPremiereQuestion;

#Trial portant le stimulus final (a modifier avec le stimulateur)
trial{
	picture {
         box blackbox;
			x = 0 ; y = 0 ;
   } pic2;    		
	stimulus_event{
		picture{
			text{
				caption = "Fin de trajectoires";
				font_color = 0,0,0;
				font_size = 40;
			}tF;
			x = 0 ; y = 0 ;
		};
		time=0;
		duration = 1000;
	}seFinal;
}trialStimulusFinal;
#Trial pour la stimulation électrique
trial{
	picture {
         box blackbox;
			x = 0 ; y = 0 ;
   } picPiqure;    		
	stimulus_event{
		nothing{};
		port_code = 1;
		port = 1;
		time = 0;
		code = "stim 1";
	}sePiqure;
}trialPiqure;

#Trial pour la question sur l'anxiété post trajectoire
trial{
	stimulus_event{
		picture {
			text ecranDesagreable;
			x = 0 ; y = 0 ;
		}pictureDesagreable;
		time = 0;
		response_active = true;
		duration = response;
	}seDesagreable;
}trialDesagreable;

#Trial de fin de trajectoire
trial{
	stimulus_event{
		picture{
			text{
				caption = "Fin de trajectoires";
				font_color = 0,0,0;
				font_size = 40;
			};
			x = 0 ; y = 0 ;
		};
		duration = 1000;
	};
}trialFinTrajectoire;

begin_pcl;

#Fonctions de marquage
sub int triggerTrajectoire (int traj_num)
begin
	return traj_num*2+2;
end;
sub int triggerSon (int son_num)
begin
	return 2;
end;

sub int triggerTrajectoireV2(bool valence, bool valenceReel, bool longueur, int chance)
begin
	int vval = 0,vvalR = 0,vLong = 0, vChance = 0;
	if(valence == true) then
		vval=1;
	end;
	if(valenceReel == true) then
		vvalR=1;
	end;
	if(longueur == true) then
		vLong=1;
	end;
	if(chance == 90) then
		vChance=1;
	end;
	int trig = 128 + vval*64 + vvalR * 32 + vLong * 16 + vChance*8;
	return trig;
end;

sub int triggerSonV2(int position)
begin
	return position *2;
end;

sub presentationTrajectoire(bool essai,int trajNum, bool outputAvailable,output_file ofile1,output_port output, int positionCible,array <int> trajectoires[100][12],array <bool> indic[100][2],array <string> conversionMvmIntStr[9],array <int> mouvements[100][11],array <int> convMouvementValence[9],array <int> convMouvementValenceInv[9],array <int> positions[35][2],int modeReponse)
begin
	int i = trajNum;
	#Presentation trial début de trajectoire
	if(essai == false)then
		ofile1.print("Trajectoire "+string(i)+"\n");
	end;
	
	int valence = -1;
	int longueur = 0;
	bool v = indic[i][1];
	if(v == true) then
		valence = 1;
	else
		valence = 0;
	end;
	loop int k = 1 until k > trajectoires[i].count()
	begin
		k=k+1;
		longueur = k;
		if(k <= trajectoires[i].count())then
			if(trajectoires[i][k] == -1) then
				break;
			end;
		end;
	end;
	if(valence == 0)then
		if(essai == false)then
			ofile1.print("ValenceTraj Negatif\n");
		end;
		pic2.set_part(1,redbox);
		picPiqure.set_part(1,redbox);
	else
		if(essai == false)then
			ofile1.print("ValenceTraj Positif\n");
		end;
		pic2.set_part(1,greenbox);		
		picPiqure.set_part(1,greenbox);
	end;
	
	#Marquage des données EEG pour indiquer quel est la trajectoire actuelle
	bool vval = false;
	if(valence == 1) then
		vval=true;
	end;
	#TODO redifinir trigger de trajectoire
	if(outputAvailable == true) then
		if(essai == false)then
			output.send_code(triggerTrajectoire(i));
		end;
	end;
	if(essai == false)then
		ofile1.print("TriggerTraj "+string(triggerTrajectoire(i))+"\n");
	end;
	
	
	int positionx = 0;
	int positiony = 0;
	int lastRep = -1;
	
	#Boucle intra-trajectoire
	loop int j = 1 until j == trajectoires[i].count()
	begin
		if(essai == false)then
			ofile1.print("Son\nNumero "+string(j)+"\n");
		end;	
		if(j != 1 && essai == false)then			
			ofile1.print("Mouvement "+conversionMvmIntStr[mouvements[i][j-1]]+"\n");
			#Ajout valence du mouvement
			if(positionCible == 1)then
				ofile1.print("Valence "+string(convMouvementValence[mouvements[i][j-1]])+"\n");			
			else
				ofile1.print("Valence "+string(convMouvementValenceInv[mouvements[i][j-1]])+"\n");
			end;
		end;
		if(trajectoires[i][j] != -1)then
			positionx = positions[trajectoires[i][j]][1];
			positiony = positions[trajectoires[i][j]][2];
			if(essai == false)then
				ofile1.print("Position "+string(positionx)+"_"+string(positiony)+"\n");
			end;
		end;
		
		#Choix du stimulus audio
		sound sd1 = sounds[trajectoires[i][j]];
		s1.set_stimulus(sd1);
		
		#Marker pour capture EEG
		if(outputAvailable == true && essai==false) then
			output.send_code(triggerSon(j));
		end;
		
		if(essai == false)then
			ofile1.print("TriggerSon "+string(triggerSon(j))+"\n");
		end;
		#Presentation stimulus audio
		trialSon.present();
		if(j != 1)then
			if(modeReponse == 1)then 
				trialQuestion.present();
			else
				trialQuestionTimed.present();
			end;
		else
			trialPremiereQuestion.present();
		end;
		#Recolte de la réponse donnée
		int reponse = response_manager.last_response();
		stimulus_data last = stimulus_manager.last_stimulus_data();   
		
		if(reponse == 10) then 
			if(positionCible == 1)then
				reponse = 1;
			else
				reponse = -1;
			end;
		elseif(reponse == 11) then 
			if(positionCible == 1)then
				reponse = -1;
			else
				reponse = 1;
			end;
		elseif(reponse == 12 ||reponse == 13) then
			reponse = 0;
		end;
		if(j != 1 && reponse < 2 && essai == false)then
			ofile1.print("Reponse "+string(reponse)+"\n");
			ofile1.print("ReactionTime"+string(last.reaction_time())+"\n");
		end;
		j=j+1;
		if(j <= trajectoires[i].count())then
			if(trajectoires[i][j] == -1) then
				break;
			end;
		end;
	end;
	if(essai == false)then
		ofile1.print("FinSon \n");
	end;
	#Presentation du stimulus final
	if(valence == 0) then
		seFinal.set_stimulus(stimNeg);
	else
		seFinal.set_stimulus(stimPos);
	end;
	if(valence == 0)then	
		#Activation du stimulus electrique
		if(outputAvailable == true) then
			output.send_code(1);
		end;
	end;
	trialStimulusFinal.present();
	
	#Presentation de la question sur le ressenti 
	trialDesagreable.present();
	
	int desagreable=response_manager.last_response();	
	if(essai == false)then
		ofile1.print("Desagreable "+string(desagreable)+"\n");
	end;
	if(essai == false)then
		ofile1.print("Fin\n");
	end;
	
end;


#Chargement du fichier log
output_file ofile1 = new output_file;
string nameFile = logfile.subject()+"ReponseStimuli";
string nameFileTest = nameFile;
int cptname = 1;
loop until !file_exists(logfile_directory +nameFileTest+".txt") begin
	nameFileTest = nameFile+string(cptname);
	cptname=cptname+1;
end;
ofile1.open(nameFileTest+".txt" , true );

set_system_volume(1,1);
int count = response_manager.total_response_count( 14 );
bool calibSonore = true;
bool presentation = false; 
bool essaiT = true;
int nbEssai = 4;
bool outputAvailable = false;
bool mosquitoCartoon = true; #Ajoute l'image du moustique gentil/méchant dans les infos de traj

#Gestion de la souris 
mouse mse = response_manager.get_mouse( 1 );
int max_x = display_device.width() / 2;
int min_x = -max_x;
int max_y = display_device.height() / 2;
int min_y = -max_y;
mse.set_min_max( 1, min_x, max_x );
mse.set_min_max( 2, min_y, max_y );
mse.set_restricted( 1, true );
mse.set_restricted( 2, true );

#Ouverture du port parallel
#if(outputAvailable == true) then
#output_port output = output_port_manager.get_port(1);
output_port output;
#end;

#Tableaux contenant les informations de trajectoires
array <int> positions[35][2] = {{0,-5},{3,-4},{4,-2},{5,0},{4,2},{3,4},{0,5},{0,-8},{4,-7},{7,-4},{8,0},{7,4},{4,7},{0,8},{0,-14},{7,-12},{12,-7},{14,0},{12,7},{7,12},{0,14},{0,-24},{12,-21},{21,-12},{24,0},{21,12},{12,21},{0,24},{0,-41},{21,-36},{36,-20},{41,0},{36,20},{21,36},{0,41}};

array <int> trajectoiresN[100][12] ={{25,18,19,25,33,25,24,30,-1,-1,-1,-1},{25,17,16,10,17,16,23,29,-1,-1,-1,-1},{25,33,25,24,16,24,25,19,13,7,-1,-1},{25,26,25,19,25,24,17,11,12,6,-1,-1},{25,31,25,26,33,34,27,21,14,20,13,7},{25,33,26,25,32,24,18,12,6,-1,-1,-1},{25,24,31,24,30,23,31,30,-1,-1,-1,-1},{25,17,10,18,25,18,19,13,7,-1,-1,-1},{25,24,30,22,16,17,23,30,-1,-1,-1,-1},{25,33,26,18,26,20,12,19,13,6,-1,-1},{25,26,33,26,25,32,31,32,25,17,23,29},{25,17,23,30,29,22,29,30,23,31,23,29},{25,33,32,25,33,32,24,17,18,12,13,7},{25,32,26,32,33,25,31,24,30,-1,-1,-1},{25,24,18,24,32,33,27,26,18,12,6,-1},{25,19,25,24,32,31,23,29,-1,-1,-1,-1},{25,19,18,25,18,25,24,30,-1,-1,-1,-1},{25,33,34,28,20,26,33,25,24,30,-1,-1},{25,31,32,26,34,27,21,13,6,-1,-1,-1},{25,18,10,3,9,10,16,23,29,-1,-1,-1},{25,33,25,24,30,22,29,22,16,23,29,-1},{25,24,25,24,17,11,18,12,6,-1,-1,-1},{25,17,10,17,23,17,25,17,16,23,29,-1},{25,32,26,33,34,33,26,25,18,12,6,-1},{25,24,16,22,15,23,30,31,25,19,13,7},{25,17,23,17,16,8,16,22,29,-1,-1,-1},{25,26,32,24,32,24,23,17,24,17,23,30},{25,32,26,32,24,31,24,31,30,-1,-1,-1},{25,19,27,28,27,21,20,26,18,24,30,-1},{25,33,34,26,20,19,25,24,30,-1,-1,-1},{25,19,26,25,33,25,32,25,19,13,7,-1},{25,31,24,31,25,19,13,7,-1,-1,-1,-1},{25,18,19,18,10,18,19,13,7,-1,-1,-1},{25,19,27,34,35,28,34,26,32,31,23,29},{25,32,31,25,18,12,13,7,-1,-1,-1,-1},{25,24,31,32,24,18,24,31,25,19,13,7},{25,26,25,32,25,17,11,19,11,5,6,-1},{25,24,16,9,17,9,16,17,23,30,-1,-1},{25,33,32,24,31,32,26,32,24,30,-1,-1},{25,26,33,27,28,27,35,27,21,13,7,-1},{25,19,18,24,25,31,32,24,17,23,22,29},{25,24,32,33,26,25,18,12,13,7,-1,-1},{25,33,25,32,31,25,18,12,6,-1,-1,-1},{25,19,20,14,13,5,11,10,18,12,6,-1},{25,18,24,18,25,17,23,17,24,18,12,6},{25,17,16,9,15,16,22,30,-1,-1,-1,-1},{25,24,32,25,17,18,24,30,-1,-1,-1,-1},{25,24,25,19,26,32,31,32,24,25,31,30},{25,31,23,24,31,23,17,9,17,23,30,-1},{25,31,25,18,17,24,16,10,11,5,6,-1},{25,18,26,18,24,18,12,6,-1,-1,-1,-1},{25,19,27,19,26,25,31,23,29,-1,-1,-1},{25,31,24,25,18,25,24,30,29,-1,-1,-1},{25,24,25,24,32,31,24,30,24,23,29,-1},{25,24,17,9,10,16,24,31,24,18,12,6},{25,24,32,24,31,25,26,20,13,7,-1,-1},{25,26,33,26,25,18,25,24,30,29,-1,-1},{25,31,23,31,24,18,12,6,-1,-1,-1,-1},{25,19,18,24,32,25,19,13,7,-1,-1,-1},{25,32,25,32,26,25,26,25,31,24,23,29},{25,17,24,23,16,10,3,4,12,13,7,-1},{25,24,17,24,17,18,11,12,6,-1,-1,-1},{25,31,25,26,32,25,24,30,29,-1,-1,-1},{25,18,12,4,11,17,24,30,-1,-1,-1,-1},{25,26,19,13,21,20,14,6,-1,-1,-1,-1},{25,31,23,30,23,17,25,19,13,7,-1,-1},{25,17,25,24,16,17,10,4,12,6,7,-1},{25,24,32,25,32,25,26,33,25,18,12,6},{25,32,31,24,30,22,15,16,22,15,22,29},{25,19,26,20,19,26,20,27,20,14,6,-1},{25,24,25,24,32,25,19,13,7,-1,-1,-1},{25,32,24,17,18,17,10,17,11,12,6,-1},{25,17,10,11,18,11,5,6,-1,-1,-1,-1},{25,33,26,18,24,32,25,31,24,30,-1,-1},{25,32,31,32,26,19,13,7,-1,-1,-1,-1},{25,33,26,20,21,27,19,25,24,30,-1,-1},{25,33,32,26,19,18,12,5,6,-1,-1,-1},{25,32,24,18,17,10,11,18,12,6,-1,-1},{25,26,34,35,27,34,26,32,24,30,-1,-1},{25,31,25,32,25,32,33,26,18,24,23,29},{25,33,34,27,19,20,14,7,-1,-1,-1,-1},{25,31,25,33,27,26,32,31,30,-1,-1,-1},{25,32,24,17,9,8,1,9,15,22,29,-1},{25,19,18,24,32,25,19,12,20,14,7,-1},{25,24,16,23,17,10,16,23,29,30,-1,-1},{25,26,25,32,25,32,24,30,-1,-1,-1,-1},{25,19,18,19,11,5,6,14,7,-1,-1,-1},{25,24,17,11,12,18,17,23,17,18,12,6},{25,18,17,11,19,11,12,4,5,13,6,-1},{25,24,17,11,3,9,8,16,23,31,30,29},{25,24,17,25,18,19,13,7,-1,-1,-1,-1},{25,24,17,24,18,24,18,26,33,32,24,30},{25,19,11,10,3,11,17,18,24,30,-1,-1},{25,24,17,16,9,3,10,16,24,30,-1,-1},{25,31,24,18,19,25,26,20,12,6,-1,-1},{25,17,24,25,24,25,24,18,12,6,-1,-1},{25,17,18,11,17,25,24,18,17,23,30,-1},{25,17,24,18,26,19,13,6,-1,-1,-1,-1},{25,31,24,23,30,23,31,25,19,13,7,-1},{25,19,26,20,19,25,24,30,-1,-1,-1,-1}};
array <int> trajectoiresInv[100][12] ={{25,18,17,25,31,25,26,34,-1,-1,-1,-1},{25,19,20,12,19,20,27,35,-1,-1,-1,-1},{25,31,25,26,20,26,25,17,9,1,-1,-1},{25,24,25,17,25,26,19,11,10,2,-1,-1},{25,33,25,24,31,30,23,15,8,16,9,1},{25,31,24,25,32,26,18,10,2,-1,-1,-1},{25,26,33,26,34,27,33,34,-1,-1,-1,-1},{25,19,12,18,25,18,17,9,1,-1,-1,-1},{25,26,34,28,20,19,27,34,-1,-1,-1,-1},{25,31,24,18,24,16,10,17,9,2,-1,-1},{25,24,31,24,25,32,33,32,25,19,27,35},{25,19,27,34,35,28,35,34,27,33,27,35},{25,31,32,25,31,32,26,19,18,10,9,1},{25,32,24,32,31,25,33,26,34,-1,-1,-1},{25,26,18,26,32,31,23,24,18,10,2,-1},{25,17,25,26,32,33,27,35,-1,-1,-1,-1},{25,17,18,25,18,25,26,34,-1,-1,-1,-1},{25,31,30,22,16,24,31,25,26,34,-1,-1},{25,33,32,24,30,23,15,9,2,-1,-1,-1},{25,18,12,5,13,12,20,27,35,-1,-1,-1},{25,31,25,26,34,28,35,28,20,27,35,-1},{25,26,25,26,19,11,18,10,2,-1,-1,-1},{25,19,12,19,27,19,25,19,20,27,35,-1},{25,32,24,31,30,31,24,25,18,10,2,-1},{25,26,20,28,21,27,34,33,25,17,9,1},{25,19,27,19,20,14,20,28,35,-1,-1,-1},{25,24,32,26,32,26,27,19,26,19,27,34},{25,32,24,32,26,33,26,33,34,-1,-1,-1},{25,17,23,22,23,15,16,24,18,26,34,-1},{25,31,30,24,16,17,25,26,34,-1,-1,-1},{25,17,24,25,31,25,32,25,17,9,1,-1},{25,33,26,33,25,17,9,1,-1,-1,-1,-1},{25,18,17,18,12,18,17,9,1,-1,-1,-1},{25,17,23,30,29,22,30,24,32,33,27,35},{25,32,33,25,18,10,9,1,-1,-1,-1,-1},{25,26,33,32,26,18,26,33,25,17,9,1},{25,24,25,32,25,19,11,17,11,3,2,-1},{25,26,20,13,19,13,20,19,27,34,-1,-1},{25,31,32,26,33,32,24,32,26,34,-1,-1},{25,24,31,23,22,23,29,23,15,9,1,-1},{25,17,18,26,25,33,32,26,19,27,28,35},{25,26,32,31,24,25,18,10,9,1,-1,-1},{25,31,25,32,33,25,18,10,2,-1,-1,-1},{25,17,16,8,9,3,11,12,18,10,2,-1},{25,18,26,18,25,19,27,19,26,18,10,2},{25,19,20,13,21,20,28,34,-1,-1,-1,-1},{25,26,32,25,19,18,26,34,-1,-1,-1,-1},{25,26,25,17,24,32,33,32,26,25,33,34},{25,33,27,26,33,27,19,13,19,27,34,-1},{25,33,25,18,19,26,20,12,11,3,2,-1},{25,18,24,18,26,18,10,2,-1,-1,-1,-1},{25,17,23,17,24,25,33,27,35,-1,-1,-1},{25,33,26,25,18,25,26,34,35,-1,-1,-1},{25,26,25,26,32,33,26,34,26,27,35,-1},{25,26,19,13,12,20,26,33,26,18,10,2},{25,26,32,26,33,25,24,16,9,1,-1,-1},{25,24,31,24,25,18,25,26,34,35,-1,-1},{25,33,27,33,26,18,10,2,-1,-1,-1,-1},{25,17,18,26,32,25,17,9,1,-1,-1,-1},{25,32,25,32,24,25,24,25,33,26,27,35},{25,19,26,27,20,12,5,4,10,9,1,-1},{25,26,19,26,19,18,11,10,2,-1,-1,-1},{25,33,25,24,32,25,26,34,35,-1,-1,-1},{25,18,10,4,11,19,26,34,-1,-1,-1,-1},{25,24,17,9,15,16,8,2,-1,-1,-1,-1},{25,33,27,34,27,19,25,17,9,1,-1,-1},{25,19,25,26,20,19,12,4,10,2,1,-1},{25,26,32,25,32,25,24,31,25,18,10,2},{25,32,33,26,34,28,21,20,28,21,28,35},{25,17,24,16,17,24,16,23,16,8,2,-1},{25,26,25,26,32,25,17,9,1,-1,-1,-1},{25,32,26,19,18,19,12,19,11,10,2,-1},{25,19,12,11,18,11,3,2,-1,-1,-1,-1},{25,31,24,18,26,32,25,33,26,34,-1,-1},{25,32,33,32,24,17,9,1,-1,-1,-1,-1},{25,31,24,16,15,23,17,25,26,34,-1,-1},{25,31,32,24,17,18,10,3,2,-1,-1,-1},{25,32,26,18,19,12,11,18,10,2,-1,-1},{25,24,30,29,23,30,24,32,26,34,-1,-1},{25,33,25,32,25,32,31,24,18,26,27,35},{25,31,30,23,17,16,8,1,-1,-1,-1,-1},{25,33,25,31,23,24,32,33,34,-1,-1,-1},{25,32,26,19,13,14,7,13,21,28,35,-1},{25,17,18,26,32,25,17,10,16,8,1,-1},{25,26,20,27,19,12,20,27,35,34,-1,-1},{25,24,25,32,25,32,26,34,-1,-1,-1,-1},{25,17,18,17,11,3,2,8,1,-1,-1,-1},{25,26,19,11,10,18,19,27,19,18,10,2},{25,18,19,11,17,11,10,4,3,9,2,-1},{25,26,19,11,5,13,14,20,27,33,34,35},{25,26,19,25,18,17,9,1,-1,-1,-1,-1},{25,26,19,26,18,26,18,24,31,32,26,34},{25,17,11,12,5,11,19,18,26,34,-1,-1},{25,26,19,20,13,5,12,20,26,34,-1,-1},{25,33,26,18,17,25,24,16,10,2,-1,-1},{25,19,26,25,26,25,26,18,10,2,-1,-1},{25,19,18,11,19,25,26,18,19,27,34,-1},{25,19,26,18,24,17,9,2,-1,-1,-1,-1},{25,33,26,27,34,27,33,25,17,9,1,-1},{25,17,24,16,17,25,26,34,-1,-1,-1,-1}};
array <int> mouvementsN[100][11] ={{2,4,9,7,3,6,9,-1,-1,-1,-1},{3,6,1,8,6,8,9,-1,-1,-1,-1},{7,3,6,3,7,4,1,1,1,-1,-1},{4,6,1,9,6,2,1,4,1,-1,-1},{9,1,4,8,4,2,1,2,9,2,1},{7,2,6,8,3,1,1,1,-1,-1,-1},{6,8,2,9,2,7,6,-1,-1,-1,-1},{3,2,7,8,2,4,1,1,-1,-1,-1},{6,9,3,1,4,9,8,-1,-1,-1,-1},{7,2,3,7,1,3,8,1,2,-1,-1},{4,8,2,6,8,6,4,2,3,9,9},{3,9,8,6,2,8,4,2,7,3,9},{7,6,2,7,6,3,2,4,1,4,1},{8,1,9,4,3,9,2,9,-1,-1,-1},{6,1,9,7,4,1,6,3,1,1,-1},{1,9,6,7,6,3,9,-1,-1,-1,-1},{1,6,8,2,8,6,9,-1,-1,-1,-1},{7,4,1,3,9,8,3,6,9,-1,-1},{9,4,1,7,2,1,3,2,-1,-1,-1},{2,3,2,9,4,9,8,9,-1,-1,-1},{7,3,6,9,3,8,2,1,8,9,-1},{6,4,6,2,1,8,1,1,-1,-1,-1},{3,2,8,9,1,7,3,6,8,9,-1},{8,1,8,4,6,2,6,2,1,1,-1},{6,3,9,2,7,8,4,1,1,1,1},{3,9,1,6,3,7,9,8,-1,-1,-1},{4,9,3,7,3,6,1,8,2,9,8},{8,1,9,3,8,2,8,6,-1,-1,-1},{1,7,4,6,1,6,9,3,9,9,-1},{7,4,3,1,6,9,6,9,-1,-1,-1},{1,8,6,7,3,8,2,1,1,1,-1},{9,2,8,1,1,1,1,-1,-1,-1,-1},{2,4,6,3,7,4,1,1,-1,-1,-1},{1,7,8,4,2,9,3,9,6,3,9},{8,6,1,2,1,4,1,-1,-1,-1,-1},{6,8,4,3,1,9,8,1,1,1,1},{4,6,8,2,3,1,7,3,1,4,-1},{6,3,2,7,3,8,4,9,8,-1,-1},{7,6,3,8,4,1,9,3,9,-1,-1},{4,8,1,4,6,7,3,1,3,1,-1},{1,6,9,4,9,4,3,2,9,6,8},{6,7,4,2,6,2,1,4,1,-1,-1},{7,3,8,6,1,2,1,1,-1,-1,-1},{1,4,1,6,3,9,6,7,1,1,-1},{2,9,1,8,3,9,1,8,1,1,1},{3,6,2,9,4,9,7,-1,-1,-1,-1},{6,7,2,3,4,9,9,-1,-1,-1,-1},{6,4,1,8,9,6,4,3,4,9,6},{9,3,4,8,3,1,3,7,9,8,-1},{9,1,2,6,8,3,1,4,1,4,-1},{2,7,3,9,1,1,1,-1,-1,-1,-1},{1,7,3,8,6,9,3,9,-1,-1,-1},{9,2,4,2,8,6,9,6,-1,-1,-1},{6,4,6,7,6,2,9,1,6,9,-1},{6,2,3,4,9,7,8,2,1,1,1},{6,7,3,8,1,4,1,2,1,-1,-1},{4,8,2,6,2,8,6,9,6,-1,-1},{9,3,7,2,1,1,1,-1,-1,-1,-1},{1,6,9,7,2,1,1,1,-1,-1,-1},{8,2,8,1,6,4,6,9,2,6,9},{3,8,6,2,1,2,4,7,4,1,-1},{6,2,8,2,4,2,4,1,-1,-1,-1},{9,1,4,9,2,6,9,6,-1,-1,-1},{2,1,3,8,9,8,9,-1,-1,-1,-1},{4,2,1,7,6,1,3,-1,-1,-1,-1},{9,3,8,2,1,7,1,1,1,-1,-1},{3,7,6,3,4,2,1,7,1,4,-1},{6,7,2,8,2,4,8,3,2,1,1},{8,6,2,9,3,2,4,9,2,8,8},{1,8,1,6,8,1,8,2,1,3,-1},{6,4,6,7,2,1,1,1,-1,-1,-1},{8,3,2,4,6,2,8,1,4,1,-1},{3,2,4,8,2,1,4,-1,-1,-1,-1},{7,2,3,9,7,2,9,2,9,-1,-1},{8,6,4,1,2,1,1,-1,-1,-1,-1},{7,2,1,4,9,3,9,6,9,-1,-1},{7,6,1,2,6,1,2,4,-1,-1,-1},{8,3,1,6,2,4,8,1,1,-1,-1},{4,7,4,3,8,3,9,3,9,-1,-1},{9,1,8,2,8,4,2,3,9,6,9},{7,4,2,3,4,1,2,-1,-1,-1,-1},{9,1,7,1,6,9,6,6,-1,-1,-1},{8,3,2,3,6,2,7,9,8,8,-1},{1,6,9,7,2,1,2,7,1,2,-1},{6,3,8,1,2,9,8,9,4,-1,-1},{4,6,8,2,8,3,9,-1,-1,-1,-1},{1,6,4,3,1,4,7,2,-1,-1,-1},{6,2,1,4,9,6,9,1,4,1,1},{2,6,1,7,3,4,3,4,7,2,-1},{6,2,1,3,9,6,7,8,7,6,6},{6,2,7,2,4,1,1,-1,-1,-1,-1},{6,2,8,1,9,1,7,8,6,3,9},{1,3,6,2,7,9,4,9,9,-1,-1},{6,2,6,2,1,8,9,7,9,-1,-1},{9,2,1,4,9,4,1,3,1,-1,-1},{3,8,4,6,4,6,1,1,1,-1,-1},{3,4,2,9,7,6,1,6,9,8,-1},{3,8,1,7,2,1,2,-1,-1,-1,-1},{9,2,6,8,2,7,1,1,1,1,-1},{1,8,1,6,9,6,9,-1,-1,-1,-1}};
array <int> mouvementsInv[100][11] ={{2,6,7,9,1,4,7,-1,-1,-1,-1},{1,4,3,8,4,8,7,-1,-1,-1,-1},{9,1,4,1,9,6,3,3,3,-1,-1},{6,4,3,7,4,2,3,6,3,-1,-1},{7,3,6,8,6,2,3,2,7,2,3},{9,2,4,8,1,3,3,3,-1,-1,-1},{4,8,2,7,2,9,4,-1,-1,-1,-1},{1,2,9,8,2,6,3,3,-1,-1,-1},{4,7,1,3,6,7,8,-1,-1,-1,-1},{9,2,1,9,3,1,8,3,2,-1,-1},{6,8,2,4,8,4,6,2,1,7,7},{1,7,8,4,2,8,6,2,9,1,7},{9,4,2,9,4,1,2,6,3,6,3},{8,3,7,6,1,7,2,7,-1,-1,-1},{4,3,7,9,6,3,4,1,3,3,-1},{3,7,4,9,4,1,7,-1,-1,-1,-1},{3,4,8,2,8,4,7,-1,-1,-1,-1},{9,6,3,1,7,8,1,4,7,-1,-1},{7,6,3,9,2,3,1,2,-1,-1,-1},{2,1,2,7,6,7,8,7,-1,-1,-1},{9,1,4,7,1,8,2,3,8,7,-1},{4,6,4,2,3,8,3,3,-1,-1,-1},{1,2,8,7,3,9,1,4,8,7,-1},{8,3,8,6,4,2,4,2,3,3,-1},{4,1,7,2,9,8,6,3,3,3,3},{1,7,3,4,1,9,7,8,-1,-1,-1},{6,7,1,9,1,4,3,8,2,7,8},{8,3,7,1,8,2,8,4,-1,-1,-1},{3,9,6,4,3,4,7,1,7,7,-1},{9,6,1,3,4,7,4,7,-1,-1,-1},{3,8,4,9,1,8,2,3,3,3,-1},{7,2,8,3,3,3,3,-1,-1,-1,-1},{2,6,4,1,9,6,3,3,-1,-1,-1},{3,9,8,6,2,7,1,7,4,1,7},{8,4,3,2,3,6,3,-1,-1,-1,-1},{4,8,6,1,3,7,8,3,3,3,3},{6,4,8,2,1,3,9,1,3,6,-1},{4,1,2,9,1,8,6,7,8,-1,-1},{9,4,1,8,6,3,7,1,7,-1,-1},{6,8,3,6,4,9,1,3,1,3,-1},{3,4,7,6,7,6,1,2,7,4,8},{4,9,6,2,4,2,3,6,3,-1,-1},{9,1,8,4,3,2,3,3,-1,-1,-1},{3,6,3,4,1,7,4,9,3,3,-1},{2,7,3,8,1,7,3,8,3,3,3},{1,4,2,7,6,7,9,-1,-1,-1,-1},{4,9,2,1,6,7,7,-1,-1,-1,-1},{4,6,3,8,7,4,6,1,6,7,4},{7,1,6,8,1,3,1,9,7,8,-1},{7,3,2,4,8,1,3,6,3,6,-1},{2,9,1,7,3,3,3,-1,-1,-1,-1},{3,9,1,8,4,7,1,7,-1,-1,-1},{7,2,6,2,8,4,7,4,-1,-1,-1},{4,6,4,9,4,2,7,3,4,7,-1},{4,2,1,6,7,9,8,2,3,3,3},{4,9,1,8,3,6,3,2,3,-1,-1},{6,8,2,4,2,8,4,7,4,-1,-1},{7,1,9,2,3,3,3,-1,-1,-1,-1},{3,4,7,9,2,3,3,3,-1,-1,-1},{8,2,8,3,4,6,4,7,2,4,7},{1,8,4,2,3,2,6,9,6,3,-1},{4,2,8,2,6,2,6,3,-1,-1,-1},{7,3,6,7,2,4,7,4,-1,-1,-1},{2,3,1,8,7,8,7,-1,-1,-1,-1},{6,2,3,9,4,3,1,-1,-1,-1,-1},{7,1,8,2,3,9,3,3,3,-1,-1},{1,9,4,1,6,2,3,9,3,6,-1},{4,9,2,8,2,6,8,1,2,3,3},{8,4,2,7,1,2,6,7,2,8,8},{3,8,3,4,8,3,8,2,3,1,-1},{4,6,4,9,2,3,3,3,-1,-1,-1},{8,1,2,6,4,2,8,3,6,3,-1},{1,2,6,8,2,3,6,-1,-1,-1,-1},{9,2,1,7,9,2,7,2,7,-1,-1},{8,4,6,3,2,3,3,-1,-1,-1,-1},{9,2,3,6,7,1,7,4,7,-1,-1},{9,4,3,2,4,3,2,6,-1,-1,-1},{8,1,3,4,2,6,8,3,3,-1,-1},{6,9,6,1,8,1,7,1,7,-1,-1},{7,3,8,2,8,6,2,1,7,4,7},{9,6,2,1,6,3,2,-1,-1,-1,-1},{7,3,9,3,4,7,4,4,-1,-1,-1},{8,1,2,1,4,2,9,7,8,8,-1},{3,4,7,9,2,3,2,9,3,2,-1},{4,1,8,3,2,7,8,7,6,-1,-1},{6,4,8,2,8,1,7,-1,-1,-1,-1},{3,4,6,1,3,6,9,2,-1,-1,-1},{4,2,3,6,7,4,7,3,6,3,3},{2,4,3,9,1,6,1,6,9,2,-1},{4,2,3,1,7,4,9,8,9,4,4},{4,2,9,2,6,3,3,-1,-1,-1,-1},{4,2,8,3,7,3,9,8,4,1,7},{3,1,4,2,9,7,6,7,7,-1,-1},{4,2,4,2,3,8,7,9,7,-1,-1},{7,2,3,6,7,6,3,1,3,-1,-1},{1,8,6,4,6,4,3,3,3,-1,-1},{1,6,2,7,9,4,3,4,7,8,-1},{1,8,3,9,2,3,2,-1,-1,-1,-1},{7,2,4,8,2,9,3,3,3,3,-1},{3,8,3,4,7,4,7,-1,-1,-1,-1}};
array <int> pourcent[100]={70,90,90,70,70,70,70,90,70,90,70,90,90,90,90,70,70,70,70,70,70,70,70,90,70,90,70,70,70,70,90,70,90,90,90,70,90,70,90,70,70,90,70,90,70,90,90,90,70,90,90,90,90,70,90,90,90,70,70,70,70,90,70,70,70,90,70,70,70,70,70,70,90,70,90,90,70,70,90,90,70,70,90,90,90,90,90,90,70,90,70,90,70,90,90,70,90,70,90,90};
array <bool> indic[100][2] ={{true,false},{true,true},{false,true},{false,true},{false,false},{false,true},{true,true},{false,true},{true,true},{false,true},{true,true},{true,true},{false,false},{true,true},{false,true},{true,true},{true,true},{true,true},{false,true},{true,true},{true,false},{false,true},{true,true},{false,true},{false,false},{true,true},{true,true},{true,false},{true,true},{true,true},{false,true},{false,true},{false,true},{true,true},{false,true},{false,false},{false,true},{true,true},{true,true},{false,true},{true,true},{false,true},{false,false},{false,true},{false,true},{true,true},{true,true},{true,true},{true,true},{false,true},{false,true},{true,true},{true,true},{true,false},{false,true},{false,true},{true,true},{false,false},{false,true},{true,true},{false,true},{false,true},{true,true},{true,true},{false,true},{false,true},{false,true},{false,false},{true,true},{false,true},{false,true},{false,true},{false,true},{true,true},{false,true},{true,true},{false,true},{false,false},{true,false},{true,true},{false,true},{true,false},{true,true},{false,false},{true,true},{true,false},{false,true},{false,true},{false,true},{true,true},{false,false},{true,true},{true,false},{true,true},{false,true},{false,false},{true,true},{false,true},{false,true},{true,false}};

array <string> conversionMvmIntStr[9] = {"Approche Gauche","Approche","Approche Droite","Gauche","Neutre","Droite","Eloignement Gauche","Eloignement","Eloignement Droite"};
array <int> trajectoires[100][12] ={{25,18,12,11,4,12,18,24,30,-1,-1,-1},{25,17,11,4,12,19,11,5,4,12,6,-1},{25,33,32,33,25,24,30,22,29,-1,-1,-1},{25,33,27,33,25,19,25,18,24,30,-1,-1},{25,33,25,33,26,32,24,30,24,18,12,6},{25,33,34,26,25,26,19,13,6,-1,-1,-1},{25,32,25,19,11,17,24,30,29,-1,-1,-1},{25,24,18,25,26,19,26,25,18,12,6,-1},{25,19,26,34,33,25,31,24,30,-1,-1,-1},{25,31,23,16,24,17,11,12,6,-1,-1,-1},{25,24,16,23,22,15,9,15,23,30,-1,-1},{25,24,18,25,24,30,31,25,19,13,7,-1},{25,18,26,25,26,25,17,24,30,24,23,29},{25,26,25,18,19,18,24,31,23,29,-1,-1},{25,18,17,25,17,16,23,31,30,29,-1,-1},{25,31,24,18,19,13,7,-1,-1,-1,-1,-1},{25,32,31,32,25,26,18,19,12,6,-1,-1},{25,32,26,18,19,12,6,-1,-1,-1,-1,-1},{25,33,34,26,33,26,20,13,7,-1,-1,-1},{25,19,26,34,35,34,26,25,31,30,-1,-1},{25,32,33,32,33,25,18,12,5,6,-1,-1},{25,31,32,26,19,13,7,-1,-1,-1,-1,-1},{25,19,18,25,26,34,33,25,31,30,29,-1},{25,19,25,32,25,19,13,7,-1,-1,-1,-1},{25,17,23,30,31,23,31,30,-1,-1,-1,-1},{25,18,19,11,17,18,12,6,-1,-1,-1,-1},{25,31,25,18,19,13,7,-1,-1,-1,-1,-1},{25,33,26,20,19,12,18,24,30,-1,-1,-1},{25,18,10,9,16,24,30,-1,-1,-1,-1,-1},{25,33,26,18,17,23,29,-1,-1,-1,-1,-1}};
array <int> mouvements[100][11] ={{2,1,6,2,7,9,9,9,-1,-1,-1},{3,1,2,7,8,3,1,6,7,1,-1},{7,6,4,3,6,9,3,8,-1,-1,-1},{7,1,9,3,1,9,2,9,9,-1,-1},{7,3,7,2,9,3,9,1,1,1,1},{7,4,3,6,4,2,1,2,-1,-1,-1},{8,2,1,3,9,8,9,6,-1,-1,-1},{6,1,8,4,2,8,6,2,1,1,-1},{1,8,7,6,3,9,2,9,-1,-1,-1},{9,3,2,7,2,1,4,1,-1,-1,-1},{6,3,8,6,2,1,9,7,8,-1,-1},{6,1,8,6,9,4,1,1,1,1,-1},{2,7,6,4,6,3,8,9,1,6,9},{4,6,2,4,6,9,8,3,9,-1,-1},{2,6,7,3,6,8,7,6,6,-1,-1},{9,2,1,4,1,1,-1,-1,-1,-1,-1},{8,6,4,2,4,3,4,2,1,-1,-1},{8,1,3,4,2,1,-1,-1,-1,-1,-1},{7,4,3,8,2,1,2,1,-1,-1,-1},{1,8,7,4,6,3,6,9,6,-1,-1},{8,4,6,4,3,2,1,2,4,-1,-1},{9,4,1,2,1,1,-1,-1,-1,-1,-1},{1,6,8,4,7,6,3,9,6,6,-1},{1,9,8,2,1,1,1,-1,-1,-1,-1},{3,9,8,4,3,7,6,-1,-1,-1,-1},{2,4,3,9,4,1,1,-1,-1,-1,-1},{9,1,2,4,1,1,-1,-1,-1,-1,-1},{7,2,1,6,2,9,9,9,-1,-1,-1},{2,3,6,8,7,9,-1,-1,-1,-1,-1},{7,2,3,6,9,9,-1,-1,-1,-1,-1}};
array <int> convMouvementValence[9] = {-1,-1,0,-1,0,1,0,1,1};
array <int> convMouvementValenceInv[9] = {0,-1,-1,1,0,-1,1,1,0};

#Choix du mode de réponse 
trialTiming.present();
int modeReponse=response_manager.last_response();	

#Recupération de la position de la cible négative
trialInit.present();
int positionCible=response_manager.last_response();	
if(positionCible == 1) then
	ofile1.print("Cible Gauche"+"\n");
	trajectoires = trajectoiresN;
	mouvements=mouvementsN;
	stimPos = stimPosGauche;
	stimNeg = stimNegGauche;
	bp.set_filename("QuestionGauche.png");
	bp.load();
else
	ofile1.print("Cible Droite"+"\n");
	trajectoires = trajectoiresInv;
	mouvements=mouvementsInv;
	stimPos = stimPosDroite;
	stimNeg = stimNegDroite;
	bp.set_filename("QuestionDroite.png");
	bp.load();
end;

#Récupération de la main dominante du sujet
trialMain.present();
int main=response_manager.last_response();	
string mainDominante = "";
if(main == 1)then
	mainDominante = "Gauche";
else
	mainDominante = "Droite";
end;
ofile1.print("Main "+mainDominante+"\nFin\n");


#Calibration du niveau de son
if(calibSonore) then
	output_file ofileCalib = new output_file;
	ofileCalib.open("Calib"+ logfile.subject()+"ApprocheReponseStimuli.txt", true );

	trialDebCalib.present();
	sCalib.set_attenuation(0.5);
	double deltaAtt = 0.025;
	double att = 0.7;
	double attFinale = 0;
	int nombreRepetCalib = 2;
	int rep = 0;
	double smallOffset = 0.05;
	loop until rep == nombreRepetCalib
	begin
		att = 0.8+smallOffset;
		count = response_manager.total_response_count( 14 );
		#Produit un son de moustique de moins en moins atténué jusqu'a ce que l'utilisateur appuie sur Entree lorsqu'il entend le son
		loop bool endL = false until endL == true 
		begin
			att = att-deltaAtt;
			sCalib.set_attenuation(att);
			t.set_caption("Phase ascendante\nAppuyez sur [Entrée] dès que vous entendez un son",true);
			trialCalib.present();
			if(att <= 0 || count != response_manager.total_response_count( 14 ))then
				endL = true;
			end;
		end;
		double attApparition = att;
		attFinale = attFinale+att;
		ofileCalib.print("AttenuationApparition "+string(att)+"\n");
		trialPrep.present();
		#Produit un son de moustique de plus en plus atténué jusqu'à ce que l'utilisateur appuie sur Entree lorsqu'il entend le son
		sCalib.set_attenuation(att/2);
		att = att/2;
		count = response_manager.total_response_count( 14 );
		loop bool endL = false until endL == true 
		begin
			att = att+deltaAtt;
			sCalib.set_attenuation(att);
			t.set_caption("Phase descendante\nAppuyez sur [Entrée] dès que vous n'entendez plus le son",true);
			trialCalib.present();
			if(att == 1 || count != response_manager.total_response_count( 14 ))then
				endL = true;
			end;
		end;
		double attDisparition = att;
		attFinale = attFinale+att;
		ofileCalib.print("AttenuationDisparition "+string(att)+"\n");
		trialPrep.present();
		rep = rep+1;
		smallOffset=smallOffset+0.05
	end;
	#Rep


	attFinale = attFinale/((rep)*2);
	#Calcul atténuation finale
	#L'atténuation déterminé est la moyenne des deux attenuations détérminé par l'appuie de la touche [Entrée] par l'utilisateur auquel on soustrait 0.2
	ofileCalib.print("AttenuationFinale "+string(attFinale));
	deltaAtt = 0.3;
	attFinale = attFinale-deltaAtt;
	if((attFinale <=0))then
		attFinale = 0;
	end;
	#Application de l'attenuation déterminée	
	loop int s = 1 until s > sounds.count()
	begin
		sounds[s].set_attenuation(attFinale);
		s=s+1;
	end;
	stimPos.set_attenuation(attFinale);
	stimNeg.set_attenuation(attFinale);
	
	stimPosGauche.set_attenuation(attFinale);
	stimNegGauche.set_attenuation(attFinale);
	stimPosDroite.set_attenuation(attFinale);
	stimNegDroite.set_attenuation(attFinale);

	#te.set_caption(string(att)+"\nAppuyez sur [Entrée]",true);
	#trialDebCalib.present();
else 
	double attFinale = 0.5;
	loop int s = 1 until s > sounds.count()
	begin
		sounds[s].set_attenuation(attFinale);
		s=s+1;
	end;
	stimPos.set_attenuation(attFinale);
	stimNeg.set_attenuation(attFinale);
	
	stimPosGauche.set_attenuation(attFinale);
	stimNegGauche.set_attenuation(attFinale);
	stimPosDroite.set_attenuation(attFinale);
	stimNegDroite.set_attenuation(attFinale);
end;


if(presentation) then
	trialPreparation.present();
end;

if(essaiT) then
	essaiTest.present();
	int essaiEf = 0;
	int idTraj = 1;
	bool valTraj = indic[idTraj][1];
	loop until essaiEf>=nbEssai
	begin
		presentationTrajectoire(true,idTraj, outputAvailable, ofile1, output, positionCible,trajectoires,indic,conversionMvmIntStr,mouvements,convMouvementValence,convMouvementValenceInv,positions,modeReponse);
		essaiEf = essaiEf+1;
		loop until valTraj != indic[idTraj][1]
		begin
			idTraj=idTraj+1;
		end;
		valTraj = indic[idTraj][1];
	end
end;

trialDebutExpe.present();
#Présentation des trajectoires
loop int i = 1 until i > trajectoires.count()
begin
	presentationTrajectoire(false,i, outputAvailable, ofile1, output, positionCible,trajectoires,indic,conversionMvmIntStr,mouvements,convMouvementValence,convMouvementValenceInv,positions,modeReponse);
	#Pause
	if(i%(trajectoires.count()/5) == 0 && i != trajectoires.count()) then
		trialPause.present();
	end;
	
	i=i+1;
end;
