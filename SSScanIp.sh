
#!/bin/bash
#logo
clear
logo_ssscanip() {
    echo -e "\e[1;36m"
    cat << "EOF"
  .--.--.      .--.--.      .--.--.                                            ,---,
 /  /    '.   /  /    '.   /  /    '.                                       ,`--.' | ,-.----.
|  :  /`. /  |  :  /`. /  |  :  /`. /                                ,---,  |   :  : \    /  \
;  |  |--`   ;  |  |--`   ;  |  |--`                             ,-+-. /  | :   |  ' |   :    |
|  :  ;_     |  :  ;_     |  :  ;_        ,---.      ,--.--.    ,--.'|'   | |   :  | |   | .\ :
\  \    `.   \  \    `.   \  \    `.    /     \    /        \   |   |  ,"' |'   '  ; .   : |: |
 `----.   \   `----.   \   `----.   \  /    / '   .--.  .-.  |  |   | /  | ||   |  | |     \  :
 __ \  \  |   __ \  \  |   __ \  \   | .   ' /     \__\/: .  .  |   | |  | |'      ; |   : .  |
/  /`--'  /  /  /`--'  /  /  /`--'   / '   ; :__    ," .--.; |  |   | |  |/ |   |  ' :     |`-'
'--'.     /  '--'.     /  '--'.     /  '   | '.'|  /  /  ,.  |  |   | |--'  '   :  | :   : :
  `--'---'     `--'---'     `--'---'   |   :    : ;  :   .'   \ |   |/      ;   |.'  |   | :
                                       \   \  /   | ,     .-./ '---'        '---'    `---'.|
                                        `----'    `--`---'                             `---`
EOF
    echo -e "\e[0m"
}
 logo_ssscanip

echo "Bienvenido a SSScanIp - Herramienta de Escaneo de IP"
echo -e "\e[34m#Version 1.0.0\e[0m"

sleep 2
#opciones
mostrar_opciones() {
  echo -e "\e[34mOpciones disponibles:\e[0m"
  echo -e "\e[91m[1]\e[0m Hacer ping "
  echo -e "\e[91m[2]\e[0m Realizar escaneo con Nmap"
  echo -e "\e[91m[3]\e[0m Salir"
}
fecha_hora=$(date +"%Y-%m-%d %H:%M:%S")

# Bucle principal
while true; do

  clear
  logo_ssscanip
  mostrar_opciones

  # Solicitar Scan
  echo -n -e  "\e[34mIngrese una opcion \e[91m(1, 2, 3):\e[1;97m "
  read opcion

  case $opcion in
   1 |1)
      echo -n -e "\e[34mIngrese la direccion IP para hacer ping:\e[97m "
      read ip
{  
       echo "Direccion ip: $ip fech: $fecha_hora"
       echo -e "\e[0m"
      
      ping -c  4 $ip
} | tee -a scanip.txt
      sleep 0.5
   read -n 1 -s -r -p "Presione cualquier tecla para continuar..."
      ;;
    2 |2)
      echo -n -e "\e[34mIngrese la direccion IP para el escaneo con Nmap:\e[97m "
      read  ip_nmap
 {
      echo "Direccion ip: $ip fech: $fecha_hora"
      echo -e "\e[0m"

      nmap $ip_nmap
} | tee -a scanip.txt
      sleep 0.5
    read -n 1 -s -r -p  "Presione cualquier tecla para continuar..."     
     
     ;;
    3 |3)
      echo "Saliendo del Script."
      
     sleep 1
     clear
      exit 0
      ;;
    *)
      echo "Opcion no valida. Por favor, elija 1, 2 o 3."
      sleep 1
      ;;
  esac
done

#Version 1.0.0
