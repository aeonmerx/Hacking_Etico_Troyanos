# README: Guía para el Uso de Metasploit y FatRat para Explotación y Control Remoto

## Índice
1. [Introducción](#introducción)
2. [Configuración del Entorno](#configuración-del-entorno)
3. [Uso de FatRat para Generar un Payload](#uso-de-fatrat-para-generar-un-payload)
4. [Configuración y Ejecución de Metasploit](#configuración-y-ejecución-de-metasploit)
5. [Ejecución del Payload en la Máquina Víctima](#ejecución-del-payload-en-la-máquina-víctima)
6. [Solución de Problemas](#solución-de-problemas)
7. [Notas Adicionales](#notas-adicionales)

## Introducción

Este documento proporciona una guía detallada sobre cómo usar Metasploit y FatRat para generar un payload, configurarlo y explotarlo en una máquina Windows desde una máquina Kali Linux en la nube.

- **IP Pública**: TU IP DE ATAQUE ejemplo 0.0.0.0
- **Puerto Utilizado**: Elige el puerto que quieras ejemplo 555

## Configuración del Entorno

### Máquina Kali Linux

1. **Instalación**: 
   - Asegúrate de que Kali Linux esté correctamente instalado en un entorno en la nube (por ejemplo, Azure).

2. **Herramientas Necesarias**:
   - **Metasploit**: Debe estar instalado y actualizado.
   - **FatRat**: Debe estar instalado y actualizado.

### Máquina Windows (Víctima)

1. **Configuración del Sistema**:
   - Usa Windows 10 para pruebas.
   - Asegúrate de permitir conexiones entrantes para que el payload funcione correctamente.

## Uso de FatRat para Generar un Payload

1. **Inicia FatRat en Kali Linux**:
   - Abre una terminal en Kali Linux y ejecuta FatRat.

2. **Selecciona el Tipo de Payload**:
   - Para Windows, selecciona la opción correspondiente.

3. **Configura el Payload**:
   - **LHOST**: La IP pública de tu máquina Kali Linux ([TU IP] EJEMPLO: 0.0.0.0).
   - **LPORT**: Puerto a usar (Ejemplo : 555).
   - **Tipo de Payload**: Elige `windows/meterpreter/reverse_tcp`.

4. **Genera el Payload**:
   - Proporciona un nombre base para el archivo, como `ejecutable`.
   - FatRat generará un archivo `.exe` en el directorio especificado.

## Configuración y Ejecución de Metasploit

1. **Inicia Metasploit**:
   - Abre una terminal en Kali Linux y ejecuta Metasploit.

2. **Configura el Handler en Metasploit**:
   - Utiliza el módulo `exploit/multi/handler`.
   - Configura el payload para `windows/meterpreter/reverse_tcp`.
   - Establece `LHOST` a la IP pública de la máquina Kali (0.0.0.0).
   - Establece `LPORT` al puerto en el que Metasploit escuchará las conexiones entrantes (555).
   - Inicia el handler con el comando `exploit`.

## Ejecución del Payload en la Máquina Víctima

1. **Transfiere el Payload al Sistema Windows**:
   - Usa un método de transferencia, como HTTP, FTP o una unidad USB, para mover el archivo `ejecutable.exe` a la máquina Windows.

2. **Ejecuta el Payload**:
   - En la máquina Windows, abre el archivo `ejecutable.exe`. Esto iniciará una conexión de reverso hacia tu máquina Kali.

3. **Establece la Sesión Meterpreter**:
   - Cuando el payload se ejecute correctamente, Metasploit debería abrir una sesión Meterpreter en la consola.

## Solución de Problemas

- **Problemas de Conexión**:
   - Verifica que el firewall en la máquina Windows y en la máquina Kali no esté bloqueando el puerto que estás usando.
   - Asegúrate de que la máquina Windows pueda comunicarse con la IP pública de Kali.

- **Errores en la Ejecución**:
   - Asegúrate de que el archivo `ejecutable.exe` no esté siendo bloqueado o eliminado por software antivirus en la máquina Windows.
   - Si experimentas problemas con el timeout de las sesiones, ajusta el valor en Metasploit.

## Notas Adicionales

- **Seguridad**:
   - Realiza estas pruebas solo en un entorno controlado y con permisos adecuados para evitar problemas legales.

- **Actualizaciones**:
   - Mantén tanto Metasploit como FatRat actualizados para asegurar la compatibilidad y las últimas características.
