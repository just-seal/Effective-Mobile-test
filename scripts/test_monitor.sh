#!/bin/bash

# Конфигурация
  # Название процесса для мониторинга
PROCESS_NAME="test"
  # URL с api процесса
MONITOR_URL="https://test.com/monitoring/test/api"
  # Файл с логами
LOG_FILE="/home/ubuntu/var/log/monitor.log"
  # Файл для хранения состояния процесса
PID_FILE="/home/ubuntu/var/log/test_process_status"

# Функция записи в лог
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') $1" >> "$LOG_FILE"
}

# Проверяем, запущен ли процесс
if pgrep -x "$PROCESS_NAME" > /dev/null; then

    # Процесс работает, пытаемся стучаться на сервер мониторинга
    RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" "$MONITOR_URL")
      if [[ "$RESPONSE" -eq 200 ]]; then
        log_message("  - Процесс $PROCESS_NAME запущен. Мониторинг успешен.")
      else
        log_message("  - Процесс $PROCESS_NAME запущен. ERROR: $RESPONSE")
      fi

    # Проверяем, перезапускался ли процесс
    LAST_PID=$(cat "$STATUS_FILE" 2>/dev/null)
    CURRENT_PID=$(pgrep -x "$PROCESS_NAME")
    if [[ "$LAST_PID" -ne "$CURRENT_PID" ]]; then
        log_message "Process $PROCESS_NAME was restarted (PID: $CURRENT_PID)."
        echo "$CURRENT_PID" > "$STATUS_FILE"
    fi
else
    # Если процесс не запущен, ничего не делаем

fi

