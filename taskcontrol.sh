#!/bin/bash



#DIFININDO VARIAVEIS DE COR
RED='\033[0;31m'    # Vermelho
GREEN='\033[0;32m'  # Verde
YELLOW='\033[0;33m' # Amarelo
BLUE='\033[0;34m'   # Azul
NC='\033[0m'        # Reset (sem cor)
BLINK='\033[5m'       # Piscar


echo -e "$BLUE==================================================$NC"
echo -e "$BLUE|$NC$RED TASKCONTROL - CONTROLE DE ATIVIDADES E TAREFAS $NC$BLUE|$NC"
echo -e "$BLUE|================================================|$NC"
echo -e "$BLUE|$NC                                                $BLUE|$NC"
echo -e "$BLUE|$NC                      MENU                      $BLUE|$NC"
echo -e "$BLUE|$NC                                                $BLUE|$NC"
echo -e "$BLUE|$NC Validar a lista de tarefas $BLINK-------------->$NC $RED V $NC $BLUE|$NC"
echo -e "$BLUE|$NC Adicionar uma tarefa $BLINK-------------------->$NC $RED A $NC $BLUE|$NC"
echo -e "$BLUE|$NC Deletar uma tarefa $BLINK---------------------->$NC $RED D $NC $BLUE|$NC"
echo -e "$BLUE|$NC Resumo das atividades $BLINK------------------->$NC $RED R $NC $BLUE|$NC"
echo -e "$BLUE|$NC Sair $BLINK------------------------------------>$NC $RED Q $NC $BLUE|$NC"
echo -e "$BLUE|$NC                                                $BLUE|$NC"
echo -e "$BLUE|================================================|$NC"
read -p "Digita opcao desejada:" opcaodesformatada
clear

opcao=$(echo $opcaodesformatada | tr A-Z a-z)

case $opcao in

#
# INICIO MODULO DE VALIDACAO DE ATIVIDADE
#
"v")

	echo -e "$BLUE========================================================================================$NC"
	echo -e "$BLUE|                    $NC$RED TASKCONTROL - CONTROLE DE ATIVIDADES E TAREFAS $NC$BLUE                  |$NC"
	echo -e "$BLUE========================================================================================$NC"

	while IFS=';' read -r id nome descricao prioridade datai datat status id2
	do
		echo ""
		echo -e "$BLINK---------------------------------------------------------------------------------------$NC"
		echo ""
		echo -e "\033[0;33mID:$NC $id        $YELLOW Nome:$NC $nome      $YELLOW Prioridade:$NC $prioridade"
		echo -e "\033[0;33mData Inicial:$NC $datai"
		echo -e "\033[0;33mData Final:$NC $datat"
		echo -e "\033[0;33mDescricao:$NC $descricao"
		echo -e "\033[0;33mStatus:$NC $status"

	done < taskcontrol.db
	echo ""
        echo -e "$BLUE========================================================================================$NC"
	echo -e "$BLUE|$NC                                                                                      $BLUE|$NC"
	echo -e "$BLUE|$NC                                         MENU                                         $BLUE|$NC"
	echo -e "$BLUE|$NC                                                                                      $BLUE|$NC"
	echo -e "$BLUE|$NC Voltar ao MENU inicial $BLINK-------------------------------------------------------->$NC $RED M $NC $BLUE|$NC"
	echo -e "$BLUE|$NC Alterar Status $BLINK---------------------------------------------------------------->$NC $RED S $NC $BLUE|$NC"
	echo -e "$BLUE|$NC Deletar atividade $BLINK------------------------------------------------------------->$NC $RED D $NC $BLUE|$NC"
	echo -e "$BLUE|$NC Adicionar atividade $BLINK----------------------------------------------------------->$NC $RED A $NC $BLUE|$NC"
	echo -e "$BLUE|$NC Filtro: Tarefas Agendadas $BLINK----------------------------------------------------->$NC $RED G $NC $BLUE|$NC"
        echo -e "$BLUE|$NC Filtro: Tarefas Iniciadas $BLINK----------------------------------------------------->$NC $RED I $NC $BLUE|$NC"
        echo -e "$BLUE|$NC Filtro: Tarefas Pausadas $BLINK------------------------------------------------------>$NC $RED P $NC $BLUE|$NC"
        echo -e "$BLUE|$NC Filtro: Tarefas Canceladas $BLINK---------------------------------------------------->$NC $RED C $NC $BLUE|$NC"
        echo -e "$BLUE|$NC Filtro: Tarefas Finalizadas $BLINK--------------------------------------------------->$NC $RED F $NC $BLUE|$NC"
        echo -e "$BLUE|$NC Filtro: Prioridade $BLINK------------------------------------------------------------>$NC $RED O $NC $BLUE|$NC"
	echo -e "$BLUE|$NC Sair $BLINK-------------------------------------------------------------------------->$NC $RED Q $NC $BLUE|$NC"
	echo -e "$BLUE|$NC                                                                                      $BLUE|$NC"
        echo -e "$BLUE========================================================================================$NC"

	read -p "Digita opcao desejada:" opcaodesformatada
	opcao=$(echo $opcaodesformatada | tr A-Z a-z)
	case $opcao in

	"o")
		sort -t';' -k4 -r -n taskcontrol.db > taskcontrol.tmp
                clear
                echo -e "$BLUE========================================================================================$NC"
                echo -e "$BLUE|                    $NC$RED TASKCONTROL - CONTROLE DE ATIVIDADES E TAREFAS $NC$BLUE                  |$NC"
                echo -e "$BLUE========================================================================================$NC"
                echo -e "FILTRO: $RED Prioridade $NC"
                while IFS=';' read -r id nome descricao prioridade datai datat status id
                do
                echo ""
                echo -e "$BLINK---------------------------------------------------------------------------------------$NC"
                echo ""
                        echo -e "\033[0;33mID:$NC $id        $YELLOW Nome:$NC $nome      $YELLOW Prioridade:$NC $prioridade"
                        echo -e "\033[0;33mData Inicial:$NC $datai"
                        echo -e "\033[0;33mData Final:$NC $datat"
                        echo -e "\033[0;33mDescricao:$NC $descricao"
                        echo -e "\033[0;33mStatus:$NC $status"
                done < taskcontrol.tmp
		 echo ""
                 echo -e "$BLUE========================================================================================$NC"
                 echo -e "$BLUE|$NC Voltar ao MENU princial $BLINK------------------------------------------------------>$NC $RED M  $NC $BLUE|$NC"
                 echo -e "$BLUE|$NC Sair $BLINK------------------------------------------------------------------------->$NC $RED Q  $NC $BLUE|$NC"
                 echo -e "$BLUE========================================================================================$NC"
                 read -p "Digite a opcao desejada:" opcaodesformatada
                 opcao=$(echo $opcaodesformatada | tr A-Z a-z)
                 case $opcao in
                 "m")
                         clear
                         ./taskcontrol.sh
                 ;;
                 "q")
                         clear
                         echo ""
                         echo -e "$RED GOODBYE!!!!! $NC"
                         sleep 2
                         clear
                 ;;
		 *)
         		 echo -e "OPCAO $RED INVALIDA $NC !!"
         		 echo -e "RETORNANDO AO MENU PRINCIPAL $BLINK ... $NC"
         		 sleep 2
         		 clear
         		./taskcontrol.sh
                 esac


	;;

	"g") #OPCAO DE FILTRAGEM DE TAREFAS AGENDADAS

		clear
        	echo -e "$BLUE========================================================================================$NC"
        	echo -e "$BLUE|                    $NC$RED TASKCONTROL - CONTROLE DE ATIVIDADES E TAREFAS $NC$BLUE                  |$NC"
	        echo -e "$BLUE========================================================================================$NC"
		echo -e "FILTRO: $RED Agendadas $NC"
		cat taskcontrol.db | grep -i "agendada" > taskcontrol.tmp
                while IFS=';' read -r id nome descricao prioridade datai datat status id
        	do
                echo ""
                echo -e "$BLINK---------------------------------------------------------------------------------------$NC"
                echo ""
                	echo -e "\033[0;33mID:$NC $id        $YELLOW Nome:$NC $nome      $YELLOW Prioridade:$NC $prioridade"
                	echo -e "\033[0;33mData Inicial:$NC $datai"
                	echo -e "\033[0;33mData Final:$NC $datat"
                	echo -e "\033[0;33mDescricao:$NC $descricao"
                	echo -e "\033[0;33mStatus:$NC $status"
        	done < taskcontrol.tmp

		echo ""
                echo -e "$BLUE========================================================================================$NC"
        	echo -e "$BLUE|$NC Voltar ao MENU princial $BLINK------------------------------------------------------>$NC $RED M  $NC $BLUE|$NC"
        	echo -e "$BLUE|$NC Sair $BLINK------------------------------------------------------------------------->$NC $RED Q  $NC $BLUE|$NC"
                echo -e "$BLUE========================================================================================$NC"
         	read -p "Digite a opcao desejada:" opcaodesformatada
                opcao=$(echo $opcaodesformatada | tr A-Z a-z)
	        case $opcao in
         	"m")
                	clear
                 	./taskcontrol.sh
         	;;
         	"q")
                 	clear
                 	echo ""
                 	echo -e "$RED GOODBYE!!!!! $NC"
                 	sleep 2
                 	clear
		 ;;
                 *)
                          echo -e "OPCAO $RED INVALIDA $NC !!"
                          echo -e "RETORNANDO AO MENU PRINCIPAL $BLINK ... $NC"
                          sleep 2
                          clear
                         ./taskcontrol.sh
         	;;
         	esac

	;;

      "i") #OPCAO DE FILTRAGEM DE TAREFAS INICIADAS

                 clear
                 echo -e "$BLUE========================================================================================$NC"
                 echo -e "$BLUE|                    $NC$RED TASKCONTROL - CONTROLE DE ATIVIDADES E TAREFAS $NC$BLUE                  |$NC"
                 echo -e "$BLUE========================================================================================$NC"
                 echo -e "FILTRO: $RED Iniciadas $NC"
                 cat taskcontrol.db | grep -i "iniciada" > taskcontrol.tmp
                 while IFS=';' read -r id nome descricao prioridade datai datat status id
                 do
                 echo ""
                 echo -e "$BLINK---------------------------------------------------------------------------------------$NC"
                 echo ""
                         echo -e "\033[0;33mID:$NC $id        $YELLOW Nome:$NC $nome      $YELLOW Prioridade:$NC $prioridade"
                         echo -e "\033[0;33mData Inicial:$NC $datai"
                         echo -e "\033[0;33mData Final:$NC $datat"
                         echo -e "\033[0;33mDescricao:$NC $descricao"
                         echo -e "\033[0;33mStatus:$NC $status"
                 done < taskcontrol.tmp
				echo ""
                echo -e "$BLUE========================================================================================$NC"
                echo -e "$BLUE|$NC Voltar ao MENU princial $BLINK------------------------------------------------------>$NC $RED M  $NC $BLUE|$NC"
                echo -e "$BLUE|$NC Sair $BLINK------------------------------------------------------------------------->$NC $RED Q  $NC $BLUE|$NC"
                echo -e "$BLUE========================================================================================$NC"
		read -p "Digite a opcao desejada:" opcaodesformatada
                opcao=$(echo $opcaodesformatada | tr A-Z a-z)
		case $opcao in
		"m")
                         clear
                         ./taskcontrol.sh
                 ;;
                 "q")
                         clear
                         echo ""
                         echo -e "$RED GOODBYE!!!!! $NC"
                         sleep 2
                         clear
		 ;;
                 *)
                          echo -e "OPCAO $RED INVALIDA $NC !!"
                          echo -e "RETORNANDO AO MENU PRINCIPAL $BLINK ... $NC"
                          sleep 2
                          clear
                         ./taskcontrol.sh
                 ;;
                 esac
	;;

      "p") #OPCAO DE FILTRAGEM DE TAREFAS PAUSADAS

                 clear
                 echo -e "$BLUE========================================================================================$NC"
                 echo -e "$BLUE|                    $NC$RED TASKCONTROL - CONTROLE DE ATIVIDADES E TAREFAS $NC$BLUE                  |$NC"
                 echo -e "$BLUE========================================================================================$NC"
                 echo -e "FILTRO: $RED Pausadas $NC"
                 cat taskcontrol.db | grep -i "pausada" > taskcontrol.tmp
                 while IFS=';' read -r id nome descricao prioridade datai datat status id
                 do
                 echo ""
                 echo -e "$BLINK---------------------------------------------------------------------------------------$NC"
                 echo ""
                         echo -e "\033[0;33mID:$NC $id        $YELLOW Nome:$NC $nome      $YELLOW Prioridade:$NC $prioridade"
                         echo -e "\033[0;33mData Inicial:$NC $datai"
                         echo -e "\033[0;33mData Final:$NC $datat"
                         echo -e "\033[0;33mDescricao:$NC $descricao"
                         echo -e "\033[0;33mStatus:$NC $status"
                 done < taskcontrol.tmp
				echo ""
                echo -e "$BLUE========================================================================================$NC"
                echo -e "$BLUE|$NC Voltar ao MENU princial $BLINK------------------------------------------------------>$NC $RED M  $NC $BLUE|$NC"
                echo -e "$BLUE|$NC Sair $BLINK------------------------------------------------------------------------->$NC $RED Q  $NC $BLUE|$NC"
                echo -e "$BLUE========================================================================================$NC"
		read -p "Digite a opcao desejada:" opcaodesformatada
                opcao=$(echo $opcaodesformatada | tr A-Z a-z)
		case $opcao in
		"m")
                         clear
                         ./taskcontrol.sh
                 ;;
                 "q")
                         clear
                         echo ""
                         echo -e "$RED GOODBYE!!!!! $NC"
                         sleep 2
                         clear
		 ;;
                 *)
                          echo -e "OPCAO $RED INVALIDA $NC !!"
                          echo -e "RETORNANDO AO MENU PRINCIPAL $BLINK ... $NC"
                          sleep 2
                          clear
                         ./taskcontrol.sh
                 ;;
                 esac
	;;

      "c") #OPCAO DE FILTRAGEM DE TAREFAS CANCELADAS

                 clear
                 echo -e "$BLUE========================================================================================$NC"
                 echo -e "$BLUE|                    $NC$RED TASKCONTROL - CONTROLE DE ATIVIDADES E TAREFAS $NC$BLUE                  |$NC"
                 echo -e "$BLUE========================================================================================$NC"
                 echo -e "FILTRO: $RED Canceladas $NC"
                 cat taskcontrol.db | grep -i "cancelada" > taskcontrol.tmp
                 while IFS=';' read -r id nome descricao prioridade datai datat status id
                 do
                 echo ""
                 echo -e "$BLINK---------------------------------------------------------------------------------------$NC"
                 echo ""
                         echo -e "\033[0;33mID:$NC $id        $YELLOW Nome:$NC $nome      $YELLOW Prioridade:$NC $prioridade"
                         echo -e "\033[0;33mData Inicial:$NC $datai"
                         echo -e "\033[0;33mData Final:$NC $datat"
                         echo -e "\033[0;33mDescricao:$NC $descricao"
                         echo -e "\033[0;33mStatus:$NC $status"
                 done < taskcontrol.tmp
				echo ""
                echo -e "$BLUE========================================================================================$NC"
                echo -e "$BLUE|$NC Voltar ao MENU princial $BLINK------------------------------------------------------>$NC $RED M  $NC $BLUE|$NC"
                echo -e "$BLUE|$NC Sair $BLINK------------------------------------------------------------------------->$NC $RED Q  $NC $BLUE|$NC"
                echo -e "$BLUE========================================================================================$NC"
		read -p "Digite a opcao desejada:" opcaodesformatada
                opcao=$(echo $opcaodesformatada | tr A-Z a-z)
		case $opcao in
		"m")
                         clear
                         ./taskcontrol.sh
                 ;;
                 "q")
                         clear
                         echo ""
                         echo -e "$RED GOODBYE!!!!! $NC"
                         sleep 2
                         clear
                 ;;
		  *)
                          echo -e "OPCAO $RED INVALIDA $NC !!"
                          echo -e "RETORNANDO AO MENU PRINCIPAL $BLINK ... $NC"
                          sleep 2
                          clear
                         ./taskcontrol.sh
                 ;;
                 esac
	;;

      "f") #OPCAO DE FILTRAGEM DE TAREFAS CANCELADAS

                 clear
                 echo -e "$BLUE========================================================================================$NC"
                 echo -e "$BLUE|                    $NC$RED TASKCONTROL - CONTROLE DE ATIVIDADES E TAREFAS $NC$BLUE                  |$NC"
                 echo -e "$BLUE========================================================================================$NC"
                 echo -e "FILTRO: $RED Finalizadas $NC"
                 cat taskcontrol.db | grep -i "finalizada" > taskcontrol.tmp
                 while IFS=';' read -r id nome descricao prioridade datai datat status id
                 do
                 echo ""
                 echo -e "$BLINK---------------------------------------------------------------------------------------$NC"
                 echo ""
                         echo -e "\033[0;33mID:$NC $id        $YELLOW Nome:$NC $nome      $YELLOW Prioridade:$NC $prioridade"
                         echo -e "\033[0;33mData Inicial:$NC $datai"
                         echo -e "\033[0;33mData Final:$NC $datat"
                         echo -e "\033[0;33mDescricao:$NC $descricao"
                         echo -e "\033[0;33mStatus:$NC $status"
                 done < taskcontrol.tmp
				echo ""
                echo -e "$BLUE========================================================================================$NC"
                echo -e "$BLUE|$NC Voltar ao MENU princial $BLINK------------------------------------------------------>$NC $RED M  $NC $BLUE|$NC"
                echo -e "$BLUE|$NC Sair $BLINK------------------------------------------------------------------------->$NC $RED Q  $NC $BLUE|$NC"
                echo -e "$BLUE========================================================================================$NC"
		read -p "Digite a opcao desejada:" opcaodesformatada
                opcao=$(echo $opcaodesformatada | tr A-Z a-z)
		case $opcao in
		"m")
                         clear
                         ./taskcontrol.sh
                 ;;
                 "q")
                         clear
                         echo ""
                         echo -e "$RED GOODBYE!!!!! $NC"
                         sleep 2
                         clear
		 ;;
                 *)
                          echo -e "OPCAO $RED INVALIDA $NC !!"
                          echo -e "RETORNANDO AO MENU PRINCIPAL $BLINK ... $NC"
                          sleep 2
                          clear
                         ./taskcontrol.sh
                 ;;
                 esac
	;;

	"m") #OPCAO DE VOLTAR AO MENU PRINCIPAL
		clear
		./taskcontrol.sh
	;;
	"a") #OPCAO DE ADICIONAR UMA TAREFA

        	read -p "[+]Nome: " attnome
        	read -p "[+]Descricao: " attdes
        	read -p "[+]Prioridade (1 - 10): " attprd
        	read -p "[+]Data inicio prevista (dd/mm/aaaa): " attsdate
        	read -p "[+]Data termino prevista (dd/mm/aaaa): " atttdate

        	validar_base=$(ls -l | grep taskcontrol.db | wc -l)
        	if [ $validar_base -eq 0 ]
        	then
                	linha="1;$attnome;$attdes;$attprd;$attsdate;$atttdate;Agendada;1"
                	echo $linha > taskcontrol.db
                	echo ""
                        echo -e "    $BLINK  DADOS IMPORTADOS COM SUCESSO... $NC        "
                        echo -e "      ID DA ATIVIDAD:$RED 1 $NC"
                	sleep 2
                	clear
                	./taskcontrol.sh
        	else
                	validar_id=$(tail -1 taskcontrol.db | cut -d ";" -f 1)
                	let id=$validar_id+1
                	linha="$id;$attnome;$attdes;$attprd;$attsdate;$atttdate;Agendada;$id"
                	echo $linha >> taskcontrol.db
                	echo ""
                	echo -e "    $BLINK  DADOS IMPORTADOS COM SUCESSO... $NC        "
                	echo -e "      ID DA ATIVIDAD:$RED $id $NC"
                	sleep 2
                	clear
                	./taskcontrol.sh

        	fi

	;;
	"d") #OPCAO DE DELETAR UMA TAREFA
		read -p "ID da tarefa Deletada: " id

		sed -i "/^$id;/d" taskcontrol.db
		echo ""
		echo -e "       TAREFA $RED $id $NC EXCLUIDA COM SUCESSO...        "
        	sleep 2
        	clear
        	./taskcontrol.sh
	;;
	"q") #OPCAO DE SAIR DO PROGRAMA
		clear
		echo ""
		echo -e "$RED GOODBYE!!!!! $NC"
		sleep 2
		clear
	;;
	"s") #OPCAO DE ALTERAR O STATUS DE UMA TAREFA

		clear
        	echo -e "$BLUE========================================================================================$NC"
        	echo -e "$BLUE|$NC                  $RED TASKCONTROL - CONTROLE DE ATIVIDADES E TAREFAS $NC                    $BLUE|$NC"
	        echo -e "$BLUE========================================================================================$NC"
		echo -e "$BLUE|$NC                                                                                      $BLUE|$NC"
        	echo -e "$BLUE|$NC                   MODO SELECIONADO - MODIFICAR STATUS ATIVIDADES                     $BLUE|$NC"
		echo -e "$BLUE|$NC                                                                                      $BLUE|$NC"
		echo -e "$BLUE|$NC Agendada $BLINK---------------------------------------------------------------------->$NC $RED A $NC $BLUE|$NC"
		echo -e "$BLUE|$NC Iniciada $BLINK---------------------------------------------------------------------->$NC $RED I $NC $BLUE|$NC"
		echo -e "$BLUE|$NC Pausada $BLINK----------------------------------------------------------------------->$NC $RED P $NC $BLUE|$NC"
		echo -e "$BLUE|$NC Cancelada $BLINK--------------------------------------------------------------------->$NC $RED C $NC $BLUE|$NC"
		echo -e "$BLUE|$NC Finalizada $BLINK-------------------------------------------------------------------->$NC $RED F $NC $BLUE|$NC"
		echo -e "$BLUE|$NC Voltar ao MENU inicial $BLINK-------------------------------------------------------->$NC $RED M $NC $BLUE|$NC"
		echo -e "$BLUE|$NC                                                                                      $BLUE|$NC"
                echo -e "$BLUE========================================================================================$NC"

		echo "Tarefas Cadastradas:"

		echo ""
		echo -e "$BLINK---------------------------------------------------------------$NC"
                while IFS=';' read -r id nome descricao prioridade datai datat status id
                do
                        echo -e "\033[0;33mID:$NC $id    $YELLOW Nome:$NC $nome     $YELLOW Status:$NC $status"
                        echo -e "$BLINK---------------------------------------------------------------$NC"
                done < taskcontrol.db

                read -p "Digite a opcao: " opcaodesformatada
		opcao=$(echo $opcaodesformatada | tr A-Z a-z)
		if [ $opcao == "m" ]
		then
			clear
			./taskcontrol.sh
		else
			read -p "Digite o ID da atividade: " id

			if [ $opcao == "a" ]
			then
				sed -i 's/Iniciada;'$id'/Agendada;'$id'/' taskcontrol.db
				sed -i 's/Pausada;'$id'/Agendada;'$id'/' taskcontrol.db
				sed -i 's/Cancelada;'$id'/Agendada;'$id'/' taskcontrol.db
				sed -i 's/Finalizada;'$id'/Agendada;'$id'/' taskcontrol.db

                        	echo -e "Status da atividade $RED $id $NC alterado para: $RED Agendada $NC"
                        	sleep 2
                        	clear
                        	./taskcontrol.sh

			elif [ $opcao == "i" ]
			then
				sed -i 's/Agendada;'$id'/Iniciada;'$id'/' taskcontrol.db
       	        	        sed -i 's/Pausada;'$id'/Iniciada;'$id'/' taskcontrol.db
       		                sed -i 's/Cancelada;'$id'/Iniciada;'$id'/' taskcontrol.db
                        	sed -i 's/Finalizada;'$id'/Iniciada;'$id'/' taskcontrol.db

                        	echo -e "Status da atividade $RED $id $NC alterado para: $RED Iniciada $NC"
	                        sleep 2
        	                clear
                	        ./taskcontrol.sh

        	        elif [ $opcao == "p" ]
	                then
                	        sed -i 's/Agendada;'$id'/Pausada;'$id'/' taskcontrol.db
                	        sed -i 's/Iniciada;'$id'/Pausada;'$id'/' taskcontrol.db
                	        sed -i 's/Cancelada;'$id'/Pausada;'$id'/' taskcontrol.db
	                        sed -i 's/Finalizada;'$id'/Pausada;'$id'/' taskcontrol.db

        	                echo -e "Status da atividade $RED $id $NC alterado para: $RED Pausada $NC"
                	        sleep 2
                        	clear
                        	./taskcontrol.sh

                	elif [ $opcao == "c" ]
                	then
                        	sed -i 's/Agendada;'$id'/Cancelada;'$id'/' taskcontrol.db
  	    	        	sed -i 's/Pausada;'$id'/Cancelada;'$id'/' taskcontrol.db
       		                sed -i 's/Iniciada;'$id'/Cancelada;'$id'/' taskcontrol.db
                        	sed -i 's/Finalizada;'$id'/Cancelada;'$id'/' taskcontrol.db

	                        echo -e "Status da atividade $RED $id $NC alterado para: $RED Cancelada $NC"
	                        sleep 2
        	                clear
                	        ./taskcontrol.sh

			elif [ $opcao == "f" ]
        	        then
                	        sed -i 's/Agendada;'$id'/Finalizada;'$id'/' taskcontrol.db
                        	sed -i 's/Pausada;'$id'/Finalizada;'$id'/' taskcontrol.db
		                sed -i 's/Cancelada;'$id'/Finalizada;'$id'/' taskcontrol.db
	                        sed -i 's/Finalizada;'$id'/Finalizada;'$id'/' taskcontrol.db

				echo -e "Status da atividade $RED $id $NC alterado para: $RED Finalizada $NC"
				sleep 2
				clear
				./taskcontrol.sh
			else
				echo "Opcao invalida. Retornado para o Menu..."
				sleep 2
                	        clear
        	                ./taskcontrol.sh
			fi
		fi

		;;
		*)
			clear
        		echo -e "OPCAO $RED INVALIDA $NC !!"
        		echo -e "RETORNANDO AO MENU PRINCIPAL $BLINK ... $NC"
        		sleep 2
        		clear
        		./taskcontrol.sh
		;;
		esac

#
# INICIO MODULO ADICAO DE ATIVIDADE
#
;;
"a")
	echo -e "$BLUE===================================================$NC"
	echo -e "$BLUE|$NC $RED TASKCONTROL - CONTROLE DE ATIVIDADES E TAREFAS$NC $BLUE|$NC"
	echo -e "$BLUE|=================================================|$NC"
        echo -e "$BLUE|$NC     MODO SELECIONADO - ADICIONAR ATIVIDADE      $BLUE|$NC"
	echo -e "$BLUE---------------------------------------------------$NC"
	read -p "[+]Nome: " attnome
	read -p "[+]Descricao: " attdes
	read -p "[+]Prioridade (1 - 10): " attprd
	read -p "[+]Data inicio prevista (dd/mm/aaaa): " attsdate
	read -p "[+]Data termino prevista (dd/mm/aaaa): " atttdate

	validar_base=$(ls -l | grep taskcontrol.db | wc -l)
	if [ $validar_base -eq 0 ]
	then
		linha="1;$attnome;$attdes;$attprd;$attsdate;$atttdate;Agendada;1"
		echo $linha > taskcontrol.db
		echo ""
		echo -e "      $BLINK DADOS IMPORTADOS COM SUCESSO... $NC        "
		echo -e "       ID DA ATIVIDAD: $RED 1 $NC"
	        sleep 2
                clear
		./taskcontrol.sh
	else
		validar_id=$(tail -1 taskcontrol.db | cut -d ";" -f 1)
		let id=$validar_id+1
		linha="$id;$attnome;$attdes;$attprd;$attsdate;$atttdate;Agendada;$id"
                echo $linha >> taskcontrol.db
		echo ""
                echo -e "      $BLINK DADOS IMPORTADOS COM SUCESSO... $NC        "
		echo -e "       ID DA ATIVIDAD: $RED $id $NC"
		sleep 2
		clear
		./taskcontrol.sh

	fi

 		sleep 2
                clear
                ./taskcontrol.sh


;;
"d")
        echo -e "$BLUE====================================================$NC"
        echo -e "$BLUE|$NC $RED TASKCONTROL - CONTROLE DE ATIVIDADES E TAREFAS $NC $BLUE|$NC"
        echo -e "$BLUE|==================================================|$NC"
        echo -e "$BLUE|$NC       MODO SELECIONADO - DELETAR ATIVIDADE       $BLUE|$NC"
        echo -e "$BLUE----------------------------------------------------$NC"
	echo ""
	echo "Listando tarefas ativas no sistema..."
     	echo ""
	while IFS=';' read -r id nome descricao prioridade datai datat
        do
                echo -e "\033[0;33mID: $NC $id       $YELLOW Nome: $NC $nome"
		echo -e "$BLINK------------------------------------------------$NC"
	done < taskcontrol.db

	read -p "ID da tarefa Deletada: " id


	sed -i "/^$id;/d" taskcontrol.db
	echo ""
	echo -e "       TAREFA $RED $id $NC EXCLUIDA COM SUCESSO...        "
        sleep 2
        clear
        ./taskcontrol.sh

#
# FIM MODULO DE ADICAO DE ATIVIDADE
#

#
# INICIO MODULO DE RESUMO
#
;;
"r")
	echo -e "$BLUE=================================================================$NC"
	echo -e "$BLUE|$NC       $RED TASKCONTROL - CONTROLE DE ATIVIDADES E TAREFAS $NC        $BLUE|$NC"
	echo -e "$BLUE|===============================================================|$NC"
        echo -e "$BLUE|$NC           MODO SELECIONADO - RESUMO DE ATIVIDADES             $BLUE|$NC"
        echo -e "$BLUE-----------------------------------------------------------------$NC"
	echo ""
	echo "Listando tarefas ativas no sistema..."
	echo ""
	while IFS=';' read -r id nome descricao prioridade datai datat status id
	do
                echo -e "\033[0;33mID: $NC $id  $YELLOW Nome: $NC $nome   $YELLOW Status: $NC $status"
                echo -e "$BLINK-----------------------------------------------------------------$NC"

	done < taskcontrol.db


	taskagendadas=$(cat taskcontrol.db | grep -i "agendada" | wc -l)
	taskiniciadas=$(cat taskcontrol.db | grep -i "iniciada" | wc -l)
	taskcanceladas=$(cat taskcontrol.db | grep -i "cancelada" | wc -l)
	taskpausadas=$(cat taskcontrol.db | grep -i "pausada" | wc -l)
	taskpfinalizadas=$(cat taskcontrol.db | grep -i "finalizada" | wc -l)
	tasktotal=$(cat taskcontrol.db | wc -l)

	echo ""
	echo -e "$BLUE=================================================================$NC"
	echo -e "$BLUE|$NC                           RESUMO                              $BLUE|$NC  "
	echo -e "$BLUE=================================================================$NC"
	echo ""

	#DEFININDO AS CONFIGURACOES DE PORCENTAGEM DAS TAREFAS AGENDADAS
	echo -e "Tarefas Agendadas: $RED $taskagendadas $NC"

	let ptaskagendadas=$taskagendadas*100/$tasktotal
	porcentagem=""
	for ((i=0; i<$ptaskagendadas; i++))
	do
		porcentagem="$porcentagem|"
	done
	echo -e "\033[0;33m$porcentagem $NC $ptaskagendadas %"
	echo ""

	#DEFININDO AS CONFIGURACOES DE PORCENTAGEM DAS TAREFAS INICIADAS
	echo -e "Tarefas Iniciadas: $RED $taskiniciadas $NC"

        let ptaskiniciadas=$taskiniciadas*100/$tasktotal
        porcentagem=""
        for ((i=0; i<$ptaskiniciadas; i++))
        do
                porcentagem="$porcentagem|"
        done
        echo -e "\033[0;33m$porcentagem $NC $ptaskiniciadas %"
        echo ""

	#DEFININDO AS CONFIGURACOES DE PORCENTAGEM DAS TAREFAS CANCELADAS
	echo -e "Tarefas canceladas: $RED $taskcanceladas $NC"

        let ptaskcanceladas=$taskcanceladas*100/$tasktotal
        porcentagem=""
        for ((i=0; i<$ptaskcanceladas; i++))
        do
                porcentagem="$porcentagem|"
        done
        echo -e "\033[0;33m$porcentagem $NC $ptaskcanceladas %"
        echo ""

	#DEFININDO AS CONFIGURACOES DE PORCENTAGEM DAS TAREFAS PAUSADAS
	echo -e "Tarefas Pausadas: $RED $taskpausadas $NC"

        let ptaskpausadas=$taskpausadas*100/$tasktotal
        porcentagem=""
        for ((i=0; i<$ptaskpausadas; i++))
        do
                porcentagem="$porcentagem|"
        done
        echo -e "\033[0;33m$porcentagem $NC $ptaskpausadas %"
        echo ""

	#DEFININDO AS CONFIGURACOES DE PORCENTAGEM DAS TAREFAS FINALIZADAS
        echo -e "Tarefas Finalizadas: $RED $taskfinalizadas $NC"

        let ptaskfinalizadas=$taskpfinalizadas*100/$tasktotal
        porcentagem=""
        for ((i=0; i<$ptaskfinalizadas; i++))
        do
                porcentagem="$porcentagem|"
        done
        echo -e "\033[0;33m$porcentagem $NC $ptaskfinalizadas %"
        echo ""

	echo -e "Total de Tarefas ativas: $RED $tasktotal $NC"
	echo ""
	echo -e "$BLUE=================================================================$NC"
	echo -e "$BLUE|$NC Voltar ao MENU princial $BLINK------------------------------->$NC $RED M  $NC $BLUE|$NC"
	echo -e "$BLUE|$NC Sair $BLINK-------------------------------------------------->$NC $RED Q  $NC $BLUE|$NC"
	echo -e "$BLUE=================================================================$NC"
	read -p "Digite a opcao desejada:" opcaodesformatada
        opcao=$(echo $opcaodesformatada | tr A-Z a-z)
	case $opcao in
	"m")
		clear
		./taskcontrol.sh
	;;
	"q")

		clear
                echo ""
                echo -e "$RED GOODBYE!!!!! $NC"
                sleep 2
                clear
	;;
	*)
		echo -e "OPCAO $RED INVALIDA $NC !!"
		echo -e "RETORNANDO AO MENU PRINCIPAL $BLINK ... $NC"
		sleep 2
		clear
		./taskcontrol.sh
	;;
	esac

;;

#
#FIM MOFULO DE RESUMO
#

#
# INICIO MODULO DE SAIR
#
"q")
                echo ""
                echo -e "$RED GOODBYE!!!!! $NC"
                sleep 2
                clear
;;

#
# FIM MODULO DE SAIR
#

*)
        echo -e "OPCAO $RED INVALIDA $NC !!"
        echo -e "RETORNANDO AO MENU PRINCIPAL $BLINK ... $NC"
        sleep 2
        clear
        ./taskcontrol.sh
;;
esac
