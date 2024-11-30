# Привет! 👋

## 📂 Базовые скрипты
Все базовые скрипты находятся в директории:  
`./scripts`

---

## 🤔 Что дальше?  
Я подумал, что можно немного **автоматизировать** процесс развертывания.

- ✨ Написал **Ansible playbook** для:
  - Установки и запуска самого скрипта.
  
- ⚙️ Чтобы не писать много букав в терминале, я завернул всё в **Makefile** для удобства запуска.
  - правда из коробки не заведется, нужно прописать настройки в ansible/inventory/hosts

Теперь весь процесс можно выполнить командой **make up**    🚀


# Структура репозитория

## ansible
- **group_vars/** 
- **inventory/**
  - `hosts`
- **playbooks/**
  - `monitoring-playbook.yaml`
- **roles/**
  - **test_monitor/**
    - **files/**
      - `test_monitor.service`
      - `test_monitor.sh`
      - `test_monitor.timer`
    - **tasks/**
      - `main.yaml`
    - **templates/**
      - `test_monitor.service.j2`
      - `test_monitor.sh.j2`

## scripts
- `monitor_test.service`
- `monitor_test.sh`
- `monitor_test.timer`

## something
- `.gitignore`
- `Makefile`
- `README.md`


Если до сюда кто-то дочитал, мое почтение 0_0