function setup_afl
    echo core | sudo tee /proc/sys/kernel/core_pattern
    echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
end
