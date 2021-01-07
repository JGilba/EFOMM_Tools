Program Ferramentas_EFOMMS ;
//Programinha para facilitar algumas tarefas
//Data de atualiza��o: 05/12/2020
//Made by: Jo�o Gilberto
var k1, k2, k3, k4, x1,x2,x3,x4,y1,y2,y3,y4,z1,z2,z3,z4:real;
		lat1,long1,lat2,long2,lat3,long3,lat4,long4:real;
		outro, q, o: string;
Begin
repeat
//-------------------------------------MENU-----------------------------------------------------------
		writeln('          MENU');
		writeln('1) Gerar Pol�gono');
		writeln('2) Filtrar b�ia');
		writeln('3) Encerrar o Programa');
    Writeln(' ');
    Write('Selecione uma op��o: ');
    readln(o);
    		While (o <> '1') and (o <> '2') and (o <> '3') do
    			begin
						Writeln(' ');
						writeln('Escolha uma op��o v�lida: ');
						read(o);
						writeln(' ');
					end;
		clrscr;
//-----------------------------------------------------------------------------------------------------
//--------------------------------------- Programa de Gerar Quadrante ---------------------------------
  	if (o = '1') then
		 begin		
					//Sele��o de Quadrante
				repeat
			  	Writeln('Quadrantes:');
			  	Writeln('  1) Norte e Leste');
			  	Writeln('  2) Norte e Oeste');
			  	Writeln('  3) Sul e Oeste');
			  	Writeln('  4) Sul e Leste');
			    Writeln(' ');
			    Writeln('Selecione o quadrante:');
			    Readln(q);
			    	While (q <> '1') and (q <> '2') and (q <> '3') and (q <> '4') do  
					  	begin
					  		Writeln(' ');
					  		writeln('Insira um quadranrte v�lido');
					  		readln(q);
								writeln(' '); 
					  	end;
					clrscr;  
			  //Opera��o de Convers�o de lat/long para gerar pol�gono como duas coorddenadas
					Writeln('Insira a Latitude: (Grau Minuto Segundo) ');
					read(x1,y1,z1);
					k1:=(x1+(y1/60)+(z1/3600));
					clrscr;
					Writeln('Insira a Longitude: (Grau Minuto Segundo) ');
					read(x2,y2,z2);
					k2:=(x2+(y2/60)+(z2/3600));
					clrscr;
					Writeln('Insira a Latitude: (Grau Minuto Segundo) ');
					read(x3,y3,z3);
					k3:=(x3+(y3/60)+(z3/3600));
					clrscr;
					Writeln('Insira a Longitude: (Grau Minuto Segundo) ');
					read(x4,y4,z4);
					k4:=(x4+(y4/60)+(z4/3600));
					clrscr;
					//Condi��o imposta pelo quandrante	
					if (q ='1') then
						begin
							k1 := k1;
							k2 := k2;
							k3 := k3;
							k4 := k4;
						end;
					if (q ='2') then
							begin
						  	k1 := k1;
								k2 := -k2;
								k3 := k3;
								k4 := -k4;
							end;
					if (q ='3') then
							  begin	
									k1 := -k1;
									k2 := -k2;
									k3 := -k3;
									k4 := -k4;
								end;	
					if (q ='4') then
									begin	
										k1 := -k1;
										k2 := k2;
										k3 := -k3;
										k4 := k4;
									end;	 
					//Plote do Pol�gono a partir de duas lat/long  
				  Writeln('      ['); 
				  Writeln('          ',k2,','); 
				  Writeln('          ',k1,'');
				  Writeln('      ],'); 
				  Writeln('      ['); 
				  Writeln('          ',k4,','); 
				  Writeln('          ',k1,'');
				  Writeln('      ],'); 
				  Writeln('      ['); 
				  Writeln('          ',k4,','); 
				  Writeln('          ',k3,'');
				  Writeln('      ],'); 
				  Writeln('      ['); 
				  Writeln('          ',k2,','); 
				  Writeln('          ',k3,'');
				  Writeln('      ],'); 
				  Writeln('      ['); 
				  Writeln('          ',k2,','); 
				  Writeln('          ',k1,'');
				  Writeln('      ]');
					//Estrura de repeti��o
				 	writeln('------------------------------------------------------------------------------');
				 	Writeln('                            Pol�gono gerado para o quadrante ', q,'.'); 
			  	Writeln('Desaja gerar outro poligono?');
			  	read(outro);
				  	While (outro <> 'sim') and (outro <> 'n�o') and (outro <> 'nao') and (outro <> 'Sim') and (outro <> 'N�o') and (outro <> 's') and (outro <> 'n') and (outro <> 'SIM') and (outro <> 'N�O') and (outro <> 'NAO') and (outro <> 'S') and (outro <> 'N') do  
					  	begin
					  	  Writeln(' ');
					  		writeln('Digite sim ou n�o');
					  		readln(outro);
					  		writeln(' ');
					  	end;
				  	if (outro ='sim') or (outro = 'Sim') or (outro = 's') or (outro = 'SIM') or (outro = 'S') then
							clrscr;		 	 
				until (outro= 'n�o') or (outro = 'N�o') or (outro = 'n') or (outro = 'N�O') or (outro = 'NAO') or (outro = 'N') or (outro = 'nao');
				clrscr;
		 end;	
//-----------------------------------------------------------------------------------------------------
//--------------------------------------- Filtro de B�ias------------ ---------------------------------
  	if (o = '2') then
		 begin
		 		repeat
		 			//Posi��o da b�ia que se deseja filtrar
					Writeln('Insira a Latitude da b�ia: (Grau Minuto Segundo) ');
					read(x1,y1,z1);
					k1:=(x1+(y1/60)+(z1/3600));
					clrscr;
					Writeln('Insira a Longitude da b�ia: (Grau Minuto Segundo) ');
					read(x2,y2,z2);
					k2:=(x2+(y2/60)+(z2/3600));
					clrscr;
					//Limites do Poligono
						lat1:=(k1-0.001);
						long1:=(k2+0.001);						
						lat2:=(k1-0.001);
						long2:=(k2-0.001);
						lat3:=(k1+0.001);
						long3:=(k2-0.001);
						lat4:=(k1+0.001);
						long4:=(k2+0.001);
					//Plote do Filtro	
				  Writeln('db.getCollection(''encs'').find(');
					Writeln('        {$and:[');
				  Writeln(' {');
				  Writeln('   "location.coordinates": {');
				  Writeln('     $geoWithin: {');
				  Writeln('        $geometry: {');
				  Writeln('           type : "Polygon" ,');
				  Writeln('           coordinates:');    
					Writeln('		 [');
				  Writeln('  ['); 
				  Writeln('      ['); 
				  Writeln('          -',long1,','); 
				  Writeln('          -',lat1,'');
				  Writeln('      ],'); 
				  Writeln('      ['); 
				  Writeln('          -',long2,','); 
				  Writeln('          -',lat2,'');
				  Writeln('      ],'); 
				  Writeln('      ['); 
				  Writeln('          -',long3,','); 
				  Writeln('          -',lat3,'');
				  Writeln('      ],'); 
				  Writeln('      ['); 
				  Writeln('          -',long4,','); 
				  Writeln('          -',lat4,'');
				  Writeln('      ],'); 
				  Writeln('      ['); 
				  Writeln('          -',long1,','); 
				  Writeln('          -',lat1,'');
				  Writeln('      ]');
				  Writeln('  ]');
				  Writeln(']');
				  Writeln('        }');
				  Writeln('     }');
				  Writeln('   }');
				  Writeln(' },');
			    Writeln(' {"properties.name": ''Buoy, lateral''}]}');
				  Writeln(')');
				  Writeln(' ');
				  Writeln(' ');
				  //Estrura de repeti��o
				  writeln('---------------------------------------------------------------------------------------'); 
			  	Writeln('Desaja Filtrar outra b�ia?');
			  	read(outro);
				  	While (outro <> 'sim') and (outro <> 'n�o') and (outro <> 'nao') and (outro <> 'Sim') and (outro <> 'N�o') and (outro <> 's') and (outro <> 'n') and (outro <> 'SIM') and (outro <> 'N�O') and (outro <> 'NAO') and (outro <> 'S') and (outro <> 'N') do  
					  	begin
					  		writeln('Digite sim ou n�o');
					  		readln(outro)
					  	end;
				  	if (outro ='sim') or (outro = 'Sim') or (outro = 's') or (outro = 'SIM') or (outro = 'S') then
							clrscr;
			  until (outro= 'n�o') or (outro = 'N�o') or (outro = 'n') or (outro = 'N�O') or (outro = 'NAO') or (outro = 'N') or (outro = 'nao');
				clrscr;  
		 end;
until (o = '3');
//-----------------------------------------------------------------------------------------------------
//--------------------------------------- Encerramento-------------------------------------------------
  	if (o = '3') then
		 begin
			 Writeln(' ');
			 writeln('Encerrando a aplica��o em 3 Segundos...');
			 writeln('BY: Jo�o Gilberto');
			 delay(3000);
		 end;
//-----------------------------------------------------------------------------------------------------		
End.