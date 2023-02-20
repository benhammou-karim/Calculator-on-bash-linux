#! /bin/bash

title="calculator"
prompt="selectionner votre choix:"
option=("standard" "scientifique" "programmable" "operation ascii" "equation")
re='^[0-9]+$'

while opt=$(zenity --width=600 --height=300 --title="$title" --text="$prompt" --list --column="Mode" "${option[@]}");do
	
	case "$opt" in 
		
		"${option[0]}") cal=$( zenity --width=600 --height=350 --text="$prompt" --list --column="operation" --title="$title" \
			"Addition" \
			"Sous" \
			"mul" \
			"div" \
			"Mod" )
		
		case $cal in
			"Addition")
				
				num1=$(zenity --entry --width=600 --height=350 --title="Addition" --text="donner le nombre 1 :")
				
				while [[ -z $num1 ]] || ! [[ $num1 =~ $re ]];do
					zenity --width=600 --height=350 --info --text="veuillez saisir un nombre!"
					num1=$(zenity --entry --width=600 --height=350 --title="Addition" --text="donner le nombre 1 :")
				
				done
				
				num2=$(zenity --entry --width=600 --height=350 --title="Addition" --text="donner le nombre 2 :")
				
				while [[ -z $num2 ]] || ! [[ $num2 =~ $re ]];do
                                        zenity --width=600 --height=350 --info --text="veuillez saisir un nombre!"
                                        num2=$(zenity --entry --width=600 --height=350 --title="Addition" --text="donner le nombre 2 :")
                                done
				
				result=$[num1+num2]
				zenity --width=600 --height=350	--info --text="le resultat est=$result";;
			
			"Sous")
			        
			        num1=$(zenity --entry --width=600 --height=350 --title="Soustraction" --text="donner le nombre 1 :")
                    
                                while [[ -z $num1 ]] || ! [[ $num1 =~ $re ]];do
                                        zenity --width=600 --height=350 --info --text="veuillez saisir un nombre!"
                                        num1=$(zenity --entry --width=600 --height=350 --title="Soustraction" --text="donner le nombre 1 :")
                                done
                    
                                num2=$(zenity --entry --width=600 --height=350 --title="Soustraction" --text="donner le nombre 2 :")
                    
                                while [[ -z $num2 ]] || ! [[ $num2 =~ $re ]];do
                                        zenity --width=600 --height=350 --info --text="veuillez saisir un nombre!"
                                        num2=$(zenity --entry --width=600 --height=350 --title="Soustraction" --text="donner le nombre 2 :")
                                done
                    
                                result=$[num1-num2]
                                zenity --width=600 --height=350 --info --text="le resultat est=$result";;
			
			"mul") 
				num1=$(zenity --entry --width=600 --height=350 --title="Multiplication" --text="donner le nombre 1 :")
                
                                while [[ -z $num1 ]] || ! [[ $num1 =~ $re ]];do
                                        zenity --width=600 --height=350 --info --text="veuillez saisir un nombre!"
                                        num1=$(zenity --entry --width=600 --height=350 --title="Multiplication" --text="donner le nombre 1 :")
                                done
                
                                num2=$(zenity --entry --width=600 --height=350 --title="Multiplication" --text="donner le nombre 2 :")
                
                                while [[ -z $num2 ]] || ! [[ $num2 =~ $re ]];do
                                        zenity --width=600 --height=350 --info --text="veuillez saisir un nombre!"
                                        num2=$(zenity --entry --width=600 --height=350 --title="Multiplication" --text="donner le nombre 2 :")
                                done
                
                                result=$[num1*num2]
                                zenity --width=600 --height=350 --info --text="le resultat est=$result";;
			
			"div") 
				num1=$(zenity --entry --width=600 --height=350 --title="Division" --text="donner le nombre 1 :")
                
                                while [[ -z $num1 ]] || ! [[ $num1 =~ $re ]];do
                                        zenity --width=600 --height=350 --info --text="veuillez saisir un nombre!"
                                        num1=$(zenity --entry --width=600 --height=350 --title="Division" --text="donner le nombre 1 :")
                                done
                
                                num2=$(zenity --entry --width=600 --height=350 --title="Division" --text="donner le nombre 2 :")
                
                                while [[ -z $num2 ]] || ! [[ $num2 =~ $re ]] || [[ $num2 -eq 0 ]];do
				
									if [[ $num2 -eq 0 ]];then
											zenity --width=600 --height=350 --info --text="la divsion sur zéro est impossible ! veuillez saisir un autre nombre!"

									else
                                        	zenity --width=600 --height=350 --info --text="veuillez saisir un nombre!"
									fi
				
									num2=$(zenity --entry --width=600 --height=350 --title="Division" --text="donner le nombre 2 :")
                                done
                
                                result=$[num1/num2]
                                zenity --width=600 --height=350 --info --text="le resultat est=$result";;

			"Mod") 
                                num1=$(zenity --entry --width=600 --height=350 --title="Modulo" --text="donner le nombre 1 :")
                                
                                while [[ -z $num1 ]] || ! [[ $num1 =~ $re ]];do
                                        zenity --width=600 --height=350 --info --text="veuillez saisir un nombre!"
                                        num1=$(zenity --entry --width=600 --height=350 --title="Addition" --text="donner le nombre 1 :")
                                done
                                
                                num2=$(zenity --entry --width=600 --height=350 --title="Modulo" --text="donner le nombre 2 :")
                                
                                while [[ -z $num2 ]] || ! [[ $num2 =~ $re ]];do
                                        zenity --width=600 --height=350 --info --text="veuillez saisir un nombre!"
                                        num2=$(zenity --entry --width=600 --height=350 --title="Modulo" --text="donner le nombre 2 :")
                                done
                                
                                result=$[num1%num2]
                                zenity --width=600 --height=350 --info --text="le resultat est=$result";;

		esac;;
		"${option[1]}") cal2=$( zenity --width=600 --height=350 --text="$prompt" --list --column="operation" --title="$title" \
			"Puissance" \
			"Racine" \
	       		"Ln" \
			"Log" \
			"exp" \
			"cos" \
			"sin" \
			"factorielle" 	)
		
		case $cal2 in 
			"Puissance")
				
				num1=$(zenity --entry --width=600 --height=350 --title="Puissance" --text="donner un  nombre :")
                
                                while [[ -z $num1 ]] || ! [[ $num1 =~ $re ]];do
                                        zenity --width=600 --height=350 --info --text="veuillez saisir un nombre!"
                                        num1=$(zenity --entry --width=600 --height=350 --title="Puissance" --text="donner un nombre :")
                                done
                
                                num2=$(zenity --entry --width=600 --height=350 --title="Puissance" --text="a la puissance :")
                
                                while [[ -z $num2 ]] || ! [[ $num2 =~ $re ]];do
                                        zenity --width=600 --height=350 --info --text="veuillez saisir un nombre!"
                                        num2=$(zenity --entry --width=600 --height=350 --title="Puissance" --text="a la puissance :")
                                done
                
                        	result=$[num1**num2]
                                zenity --width=600 --height=350 --info --text="le resultat est=$result";;

			"Racine") 
				num=$(zenity --entry --width=600 --height=350 --title="Racine" --text="donner un nombre :")
                
                                while [[ -z $num ]] || ! [[ $num =~ $re ]] || [[ $num -lt 0  ]];do
									if [[ $num -lt 0 ]];then
                                                zenity --width=600 --height=350 --info --text="donner un nombre positif!"

                                        else
                                        	zenity --width=600 --height=350 --info --text="veuillez saisir un nombre!"
											num=$(zenity --entry --width=600 --height=350 --title="Racine" --text="donner un nombre :")
									fi
								done
				
				b=$(echo "sqrt($num)" | bc)
                zenity --width=600 --height=350 --info --text="le resultat est=$b";;
			
			"Ln")
                                num=$(zenity --entry --width=600 --height=350 --title="Ln" --text="donner un nombre :")
            
                                while [[ -z $num ]] || ! [[ $num =~ $re ]] || [[ $num -lt 0  ]];do
									if [[ $num -lt 0 ]];then
                                                zenity --width=600 --height=350 --info --text="donner un nombre positif!"
                                        else
                                        	zenity --width=600 --height=350 --info --text="veuillez saisir un nombre!"
                                        	num=$(zenity --entry --width=600 --height=350 --title="Ln" --text="donner un nombre :")
									fi				
								done
                                
                                b=$(echo "l($num)" | bc -l)
                                zenity --width=600 --height=350 --info --text="le resultat est=$b";;
			
			"Log")
                                num=$(zenity --entry --width=600 --height=350 --title="Log" --text="donner un nombre :")
            
                                while [[ -z $num ]] || ! [[ $num =~ $re ]] || [[ $num -lt 0 ]];do
									if [[ $num -lt 0 ]];then
                                                zenity --width=600 --height=350 --info --text="donner un nombre positif!"
                                        else
                                        	zenity --width=600 --height=350 --info --text="veuillez saisir un nombre!"
                                        	num=$(zenity --entry --width=600 --height=350 --title="Log" --text="donner un nombre :")
									fi
								done
					
								b=$(echo "l($num)/l(10)" | bc -l)
                                zenity --width=600 --height=350 --info --text="le resultat est=$b";;
			
			"exp")
                                num=$(zenity --entry --width=600 --height=350 --title="exp" --text="donner un nombre :")
             
                                while [[ -z $num ]] || ! [[ $num =~ $re ]];do
                                        zenity --width=600 --height=350 --info --text="veuillez saisir un nombre!"
                                        num=$(zenity --entry --width=600 --height=350 --title="exp" --text="donner un nombre :")
                                done
                            
                                b=$(echo "e($num)" | bc -l)
                                zenity --width=600 --height=350 --info --text="le resultat est=$b";;
			
			"cos")
                                num=$(zenity --entry --width=600 --height=350 --title="cos" --text="donner un nombre :")
                    
                                while [[ -z $num ]] || ! [[ $num =~ $re ]];do
                                        zenity --width=600 --height=350 --info --text="veuillez saisir un nombre!"
                                        num=$(zenity --entry --width=600 --height=350 --title="cos" --text="donner un nombre :")
                                done
				
				b=$(echo "scale=3;c($num*0.017453293)" | bc -l)
				zenity --width=600 --height=350 --info --text="le resultat est=0$b";;
			
			"sin")
                                num=$(zenity --entry --width=600 --height=350 --title="sin" --text="donner un nombre :")
              
                                while [[ -z $num ]] || ! [[ $num =~ $re ]];do
                                        zenity --width=600 --height=350 --info --text="veuillez saisir un nombre!"
                                        num=$(zenity --entry --width=600 --height=350 --title="sin" --text="donner un nombre :")
                                done
			
				res=$(echo "scale=3;s($num*0.017453293)" | bc -l)
                                zenity --width=600 --height=350 --info --text="le resultat est=0$res";;
			
			"factorielle")
                                num=$(zenity --entry --width=600 --height=350 --title="factorielle" --text="donner un nombre :")
            
                                while [[ -z $num ]] || ! [[ $num =~ $re ]] || [[ $num -lt 0 ]];do
									if [[ $num -lt 0 ]];then
                                                zenity --width=600 --height=350 --info --text="donner un nombre positif!"
                                        else
                                        	zenity --width=600 --height=350 --info --text="veuillez saisir un nombre!"
                                        	num=$(zenity --entry --width=600 --height=350 --title="factorielle" --text="donner un nombre :")
									fi
								done
				
				b=$num
				for((i=1;i<num;i++));do
					if [[ $num -eq 0 ]];then
						zenity --width=600 --height=350 --info --text="le resultat est=1"
						break			
					fi
					b=$(($i*$b))
				done
				
				if [[ $num -eq 0 ]];then
                                        zenity --width=600 --height=350 --info --text="le resultat est=1"
                                else
					zenity --width=600 --height=350 --info --text="le resultat est=$b"
				fi;;
		esac;;
		
		"${option[2]}") cal3=$( zenity --width=600 --height=350 --text="$prompt" --list --column="operation" --title="$title" \
                        "binaire" \
						"octal" \
                        "decimal" \
	       	        "hexadecimal" )
        
                case $cal3 in 
					"binaire")
						bin=$( zenity --width=600 --height=350 --text="$prompt" --list --column="choisir quel base" --title="$title" \
                        		"decimal" \
                        		"octal" \
			       		"hexadecimal"	)
				
				case $bin in 
					"decimal")
				 		num=$(zenity --entry --width=600 --height=350 --title="vers binaire" --text="donner le nombre :")
		             
		                                while [[ -z $num ]] || ! [[ $num =~ $re ]];do
                		                        zenity --width=600 --height=350 --info --text="veuillez saisir un nombre!"
                                		        num=$(zenity --entry --width=600 --height=350 --title="vers binaire" --text="donner le nombre :")
                               			done
				 	
				 		b=$(echo "obase=2;$num" | bc)
                                		zenity --width=600 --height=350 --info --text="le resultat est=$b";;
					"octal")
						num=$(zenity --entry --width=600 --height=350 --title="vers binaire" --text="donner le nombre  :")
					
						while [[ -z $num ]] || ! [[ $num =~ $re ]];do
                                                        zenity --width=600 --height=350 --info --text="veuillez saisir un nombre!"
                                                        num=$(zenity --entry --width=600 --height=350 --title="vers binaire" --text="donner le nombre :")
                                                done
                    
                                                b=$(echo "obase=2;ibase=8;$num" | bc)
                                                zenity --width=600 --height=350 --info --text="le resultat est=$b";;
					"hexadecimal")
						num=$(zenity --entry --width=600 --height=350 --title="vers binaire" --text="donner un nombre  :")
                    
                                                while [[ -z $num ]] || ! [[ $num =~ $re ]];do
                                                        zenity --width=600 --height=350 --info --text="veuillez saisir un nombre!"
                                                        num=$(zenity --entry --width=600 --height=350 --title="vers binaire" --text="donner le nombre :")
                                                done
					
						b=$(echo "obase=2;ibase=16;$num" | bc)
                                                zenity --width=600 --height=350 --info --text="le resultat est=$b";;
				esac;;
			"octal")
                                oct=$( zenity --width=600 --height=350 --text="$prompt" --list --column="choisir quel base" --title="$title" \
                                        "binaire" \
                                        "decimal" \
                                        "hexadecimal"   )
                                case $oct in
                                        "binaire")
                                                num=$(zenity --entry --width=600 --height=350 --title="vers octal" --text="donner le nombre :")
                                                while [[ -z $num ]] || ! [[ $num =~ $re ]];do
                                                        zenity --width=600 --height=350 --info --text="veuillez saisir un nombre!"
                                                        num=$(zenity --entry --width=600 --height=350 --title="vers octal" --text="donner le nombre :")
                                                done
						b=$(echo "obase=8;ibase=2;$num" | bc)
                                                zenity --width=600 --height=350 --info --text="le resultat est=$b";;
                                        "decimal")
                                                num=$(zenity --entry --width=600 --height=350 --title="vers octal" --text="donner le nombre  :")
                                                while [[ -z $num ]] || ! [[ $num =~ $re ]];do
                                                        zenity --width=600 --height=350 --info --text="veuillez saisir un nombre!"
                                                        num=$(zenity --entry --width=600 --height=350 --title="vers octal" --text="donner le nombre :")
                                                done
					       	b=$(echo "obase=8;ibase=10;$num" | bc)
                                                zenity --width=600 --height=350 --info --text="le resultat est=$b";;
                                        "hexadecimal")
                                                num=$(zenity --entry --width=600 --height=350 --title="vers octal" --text="donner le nombre :")
                                                while [[ -z $num ]] || ! [[ $num =~ $re ]];do
                                                        zenity --width=600 --height=350 --info --text="veuillez saisir un nombre!"
                                                        num=$(zenity --entry --width=600 --height=350 --title="vers octal" --text="donner le nombre :")
                                                done
						b=$(echo "obase=8;ibase=16;$num" | bc)
                                                zenity --width=600 --height=350 --info --text="le resultat est=$b";;
                                esac;;

                        "decimal")
				dec=$( zenity --width=600 --height=350 --text="$prompt" --list --column="choisir quel base" --title="$title" \
                                        "binaire" \
                                        "octal" \
                                        "hexadecimal"   )
                                case $dec in
                                        "binaire")
                                                num=$(zenity --entry --width=600 --height=350 --title="vers decimal" --text="donner le nombre  :")
                                                while [[ -z $num ]] || ! [[ $num =~ $re ]];do
                                                        zenity --width=600 --height=350 --info --text="veuillez saisir un nombre!"
                                                        num=$(zenity --entry --width=600 --height=350 --title="vers decimal" --text="donner le nombre :")
                                                done
						b=$(echo "obase=10;ibase=2;$num" | bc)
                                                zenity --width=600 --height=350 --info --text="le resultat est=$b";;
                                        "octal")
                                                num=$(zenity --entry --width=600 --height=350 --title="vers decimal" --text="donner le nombre :")
                                                while [[ -z $num ]] || ! [[ $num =~ $re ]];do
                                                        zenity --width=600 --height=350 --info --text="veuillez saisir un nombre!"
                                                        num=$(zenity --entry --width=600 --height=350 --title="vers decimal" --text="donner le nombre :")
                                                done
						b=$(echo "obase=10;ibase=8;$num" | bc)
                                                zenity --width=600 --height=350 --info --text="le resultat est=$b";;
                                        "hexadecimal")
                                                num=$(zenity --entry --width=600 --height=350 --title="vers decimal" --text="donner le nombre 1 :")
                                                while [[ -z $num ]] || ! [[ $num =~ $re ]];do
                                                        zenity --width=600 --height=350 --info --text="veuillez saisir un nombre!"
                                                        num=$(zenity --entry --width=600 --height=350 --title="vers decimal" --text="donner le nombre :")
                                                done
						b=$(echo "obase=10;ibase=16;$num" | bc)
                                                zenity --width=600 --height=350 --info --text="le resultat est=$b";;
                                esac;;
			"hexadecimal")
                                hex=$( zenity --width=600 --height=350 --text="$prompt" --list --column="choisir quel base" --title="$title" \
                                        "binaire" \
                                        "octal" \
                                        "decimal"   )
                                case $dec in
                                        "binaire")
                                                num=$(zenity --entry --width=600 --height=350 --title="vers hexadecimal" --text="donner le nombre 1 :")
                                                while [[ -z $num ]] || ! [[ $num =~ $re ]];do
                                                        zenity --width=600 --height=350 --info --text="veuillez saisir un nombre!"
                                                        num=$(zenity --entry --width=600 --height=350 --title="vers hexadecimal" --text="donner le nombre :")
                                                done
						b=$(echo "obase=16;ibase=2;$num" | bc)
                                                zenity --width=600 --height=350 --info --text="le resultat est=$b";;
                                        "octal")
                                                num=$(zenity --entry --width=600 --height=350 --title="vers hexadecimal" --text="donner le nombre 1 :")
                                                while [[ -z $num ]] || ! [[ $num =~ $re ]];do
                                                        zenity --width=600 --height=350 --info --text="veuillez saisir un nombre!"
                                                        num=$(zenity --entry --width=600 --height=350 --title="vers hexadecimal" --text="donner le nombre :")
                                                done
						b=$(echo "obase=16;ibase=8;$num" | bc)
                                                zenity --width=600 --height=350 --info --text="le resultat est=$b";;
                                        "decimal")
                                                num=$(zenity --entry --width=600 --height=350 --title="vers hexadecimal" --text="donner le nombre 1 :")
                                                while [[ -z $num ]] || ! [[ $num =~ $re ]];do
                                                        zenity --width=600 --height=350 --info --text="veuillez saisir un nombre!"
                                                        num=$(zenity --entry --width=600 --height=350 --title="vers hexadecimal" --text="donner le nombre :")
                                                done
						b=$(echo "obase=16;ibase=10;$num" | bc)
                                                zenity --width=600 --height=350 --info --text="le resultat est=$b";;
                                esac;;
				
		esac;;
		"${option[3]}") cal4=$( zenity --width=600 --height=350 --text="$prompt" --list --column="operation" --title="$title" \
                        "Addition" \
                        "Sous" \
                        "mul" \
                        "div" \
                        "Mod" )
                case $cal4 in
                        "Addition")
                                num1=$(zenity --entry --width=600 --height=350 --title="Addition" --text="donner le nombre 1 :")
                                while [[ -z $num1 ]];do
                                        zenity --width=600 --height=350 --info --text="veuillez saisir un nombre!"
                                        num1=$(zenity --entry --width=600 --height=350 --title="Addition" --text="donner le nombre 1 :")
                                done
				if ! [[ $num1 =~ $re ]];then
					num1=$(printf %d "'$num1")
				fi
                                num2=$(zenity --entry --width=600 --height=350 --title="Addition" --text="donner le nombre 2 :")
                                while [[ -z $num2 ]];do
                                        zenity --width=600 --height=350 --info --text="veuillez saisir un nombre!"
                                        num2=$(zenity --entry --width=600 --height=350 --title="Addition" --text="donner le nombre 1 :")
                                done
				if ! [[ $num2 =~ $re ]];then
                                        num2=$(printf %d "'$num2")
                                fi
                                result=$[num1+num2]
				result=$(echo "$result" | awk '{ printf("%c",$0); }')
                                zenity --width=600 --height=350 --info --text="le resultat est=$result";;
                        "Sous")
                                num1=$(zenity --entry --width=600 --height=350 --title="soustraction" --text="donner le nombre 1 :")
                                while [[ -z $num1 ]];do
                                        zenity --width=600 --height=350 --info --text="veuillez saisir un nombre!"
                                        num1=$(zenity --entry --width=600 --height=350 --title="soustraction" --text="donner le nombre 1 :")
                                done
                                if ! [[ $num1 =~ $re ]];then
                                        num1=$(printf %d "'$num1")
                                fi
                                num2=$(zenity --entry --width=600 --height=350 --title="soustraction" --text="donner le nombre 2 :")
                                while [[ -z $num2 ]];do
                                        zenity --width=600 --height=350 --info --text="veuillez saisir un nombre!"
                                        num2=$(zenity --entry --width=600 --height=350 --title="soustraction" --text="donner le nombre 1 :")
                                done
                                if ! [[ $num2 =~ $re ]];then
                                        num2=$(printf %d "'$num2")
                                fi
                                result=$[num1-num2]
                                result=$(echo "$result" | awk '{ printf("%c",$0); }')
                                zenity --width=600 --height=350 --info --text="le resultat est=$result";;
                        "mul") 
                                num1=$(zenity --entry --width=600 --height=350 --title="multiplication" --text="donner le nombre 1 :")
                                while [[ -z $num1 ]];do
                                        zenity --width=600 --height=350 --info --text="veuillez saisir un nombre!"
                                        num1=$(zenity --entry --width=600 --height=350 --title="multiplication" --text="donner le nombre 1 :")
                                done
                                if ! [[ $num1 =~ $re ]];then
                                        num1=$(printf %d "'$num1")
                                fi
                                num2=$(zenity --entry --width=600 --height=350 --title="multiplication" --text="donner le nombre 2 :")
                                while [[ -z $num2 ]];do
                                        zenity --width=600 --height=350 --info --text="veuillez saisir un nombre!"
                                        num2=$(zenity --entry --width=600 --height=350 --title="multiplication" --text="donner le nombre 1 :")
                                done
                                if ! [[ $num2 =~ $re ]];then
                                        num2=$(printf %d "'$num2")
                                fi
                                result=$[num1*num2]
                                result=$(echo "$result" | awk '{ printf("%c",$0); }')
                                zenity --width=600 --height=350 --info --text="le resultat est=$result";;
                        "div") 
                                num1=$(zenity --entry --width=600 --height=350 --title="division" --text="donner le nombre 1 :")
                                while [[ -z $num1 ]];do
                                        zenity --width=600 --height=350 --info --text="veuillez saisir un nombre!"
                                        num1=$(zenity --entry --width=600 --height=350 --title="division" --text="donner le nombre 1 :")
                                done
                                if ! [[ $num1 =~ $re ]];then
                                        num1=$(printf %d "'$num1")
                                fi
                                num2=$(zenity --entry --width=600 --height=350 --title="division" --text="donner le nombre 2 :")
                                while [[ -z $num2 ]];do
                                        zenity --width=600 --height=350 --info --text="veuillez saisir un nombre!"
                                        num2=$(zenity --entry --width=600 --height=350 --title="division" --text="donner le nombre 1 :")
                                done
                                if ! [[ $num2 =~ $re ]];then
                                        num2=$(printf %d "'$num2")
                                fi
                                result=$[num1/num2]
                                result=$(echo "$result" | awk '{ printf("%c",$0); }')
                                zenity --width=600 --height=350 --info --text="le resultat est=$result";;

                        "Mod")
                                num1=$(zenity --entry --width=600 --height=350 --title="modulo" --text="donner le nombre 1 :")
                                while [[ -z $num1 ]];do
                                        zenity --width=600 --height=350 --info --text="veuillez saisir un nombre!"
                                        num1=$(zenity --entry --width=600 --height=350 --title="modulo" --text="donner le nombre 1 :")
                                done
                                if ! [[ $num1 =~ $re ]];then
                                        num1=$(printf %d "'$num1")
                                fi
                                num2=$(zenity --entry --width=600 --height=350 --title="modulo" --text="donner le nombre 2 :")
                                while [[ -z $num2 ]];do
                                        zenity --width=600 --height=350 --info --text="veuillez saisir un nombre!"
                                        num2=$(zenity --entry --width=600 --height=350 --title="modulo" --text="donner le nombre 1 :")
                                done
                                if ! [[ $num2 =~ $re ]];then
                                        num2=$(printf %d "'$num2")
                                fi
                                result=$[num1%num2]
                                result=$(echo "$result" | awk '{ printf("%c",$0); }')
                                zenity --width=600 --height=350 --info --text="le resultat est=$result";;
			esac;;
		"${option[4]}") cal5=$( zenity --width=600 --height=350 --text="$prompt" --list --column="operation" --title="$title" \
                        "1 degree" \
                        "2 degree" )
                case $cal5 in
                        "1 degree")
                                num1=$(zenity --entry --width=600 --height=350 --title="coefficient 1" --text="donner le premier coefficient :")
                                while [[ -z $num1 ]] || ! [[ $num1 =~ $re ]] || [[ $num1 -eq 0 ]];do
                                        zenity --width=600 --height=350 --info --text="veuillez saisir un nombre!"
                                        num1=$(zenity --entry --width=600 --height=350 --title="coefficient 1" --text="donner le premier coefficient :")
                                done
                                num2=$(zenity --entry --width=600 --height=350 --title="coefficient 2" --text="donner le deusieme coefficient :")
                                while [[ -z $num2 ]] || ! [[ $num2 =~ $re ]];do
                                        zenity --width=600 --height=350 --info --text="veuillez saisir un nombre!"
                                        num2=$(zenity --entry --width=600 --height=350 --title="coefficient 2" --text="donner le deusieme coefficient :")
                                done
				num2=$(($num2*-1))
				result=$(echo "scale=3;$num2/$num1" | bc -l)
                                zenity --width=600 --height=350 --info --text="le resultat est=$result";;
                        "2 degree")
                                num1=$(zenity --entry --width=600 --height=350 --title="coefficient 2" --text="donner le premier coefficient :")
                                while [[ -z $num1 ]] || ! [[ $num1 =~ $re ]];do
                                        zenity --width=600 --height=350 --info --text="veuillez saisir un nombre!"
                                        num1=$(zenity --entry --width=600 --height=350 --title="coefficient 2" --text="donner le premier coefficient :")
                                done
                                num2=$(zenity --entry --width=600 --height=350 --title="coefficient 2" --text="donner le deusieme coefficient :")
                                while [[ -z $num2 ]] || ! [[ $num2 =~ $re ]];do
                                        zenity --width=600 --height=350 --info --text="veuillez saisir un nombre!"
                                        num2=$(zenity --entry --width=600 --height=350 --title="coefficient 2" --text="donner le deusieme coefficient :")
                                done
                                num3=$(zenity --entry --width=600 --height=350 --title="coefficient 2" --text="donner le troisieme coefficient :")
                                while [[ -z $num3 ]] || ! [[ $num3 =~ $re ]];do
                                        zenity --width=600 --height=350 --info --text="veuillez saisir un nombre!"
                                        num3=$(zenity --entry --width=600 --height=350 --title="coefficient 2" --text="donner le troisieme coefficient :")
                                done
                                delta=$(($num2*$num2-4*$num1*$num3))
                                if [[ $delta -gt 0 ]];then
					res=$(echo "sqrt($delta)" | bc)
					res1=$((-1*$num2-$res))
					a=$((2*$num1))
					result1=$(($res1/$a))
					res2=$((-1*$num2+$res))
					result2=$(($res2/$a))
					zenity --width=600 --height=350 --info --text="le resultat est=$result1 et $result2"
				
				elif [[ $delta -eq 0 ]];then
					a=$((2*$num1))
					result=$((-1*$num2/$a))
					zenity --width=600 --height=350 --info --text="le resultat est=$result"
				else
					res=$(echo "scale=3;sqrt($((-1*$delta)))" | bc -l)
					a=$((2*$num1))
					b=$((-1*$num2))
					res1=$(echo "scale=3;$b/$a" | bc -l)
					res2=$(echo "scale=3;$res/$a" | bc -l)
					zenity --width=600 --height=350 --info --text="le resultat est= $res1+i$res2 et $res1-i$res2"
				fi

	esac;;
esac
done
