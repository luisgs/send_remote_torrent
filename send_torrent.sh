#!/bin/bash 
#===============================================================================
#
#          FILE:  send_torrent.sh
# 
#         USAGE:  ./send_torrent.sh 
# 
#   DESCRIPTION:  Enviar ficheros torrents al directorio remoto o al servidor
#		  local. Luego borrara estos torrents del directorio local
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR: luis.ild (luis.ild), luis.ild@gmail.com
#       COMPANY: Casa
#       CREATED: 13/08/11 17:05:00 CEST
#      REVISION: 1.0
#===============================================================================

set -o nounset                              # Treat unset variables as an error

###### Variables ######
source $HOME/Documentos/send_torrent/dir
#### fin vars #######


if [ `scp $dbase*.torrent $userser@$dirserv:$dserver` ];
then
	rm $dbase*.torrent     
	echo "Fichero enviados correctamente a "$dirserv", tambien se han borrado de "$dbase;
	exit;
elif [ `scp $dbase*.torrent $userrem@$dirremo:$dremote && rm $dbase*.torrent` ];
then
	echo "Fichero enviados correctamente a "$dirremo", tambien se han borrado de "$dbase;
	exit;
else
	echo "No se han podido en enviar los fichero a ningún destinatario.";
	exit;
fi
