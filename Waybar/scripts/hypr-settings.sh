#!/usr/bin/env bash

# Выбор действия через rofi/wofi
OPTION=$(echo -e "🔵 Цвет темы\n🌀 Blur\n🎭 X-Ray\n📏 Размер окна\n⚡ Показать FPS\n🔄 Анимации\n🕒 Задержка анимаций\n✨ Плавное открытие\n🧹 Пыль при закрытии" | wofi --dmenu --prompt "Настройки Hyprland")

case "$OPTION" in
    "🔵 Цвет темы")
        # Выбор цветовой схемы (пример через pywal)
        wal -i ~/Pictures/wallpapers/
        ;;
    "🌀 Blur")
        # Включение/выключение blur (изменение в hyprland.conf)
        sed -i 's/blur = .*/blur = !blur/' ~/.config/hypr/hyprland.conf
        hyprctl reload
        ;;
    "📏 Размер окна")
        # Изменение размера окна (пример для активного окна)
        hyprctl resizeactive exact 800 600
        ;;
    "⚡ Показать FPS")
        # Включение/выключение FPS (через hyprctl или другой мониторинг)
        killall -SIGUSR1 waybar  # Если Waybar поддерживает FPS-виджет
        ;;
    "🔄 Анимации")
        # Включение/выключение анимаций
        sed -i 's/animations = .*/animations = !animations/' ~/.config/hypr/hyprland.conf
        hyprctl reload
        ;;
    "🕒 Задержка анимаций")
        # Изменение задержки анимаций (через hyprctl)
        hyprctl setprop animation:curve linear
        ;;
    "✨ Плавное открытие")
        # Настройка плавного открытия окон
        hyprctl setprop animation:windowspeed 0.5
        ;;
esac
