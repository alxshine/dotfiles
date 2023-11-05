function lid_suspend_off --wraps=echo\ \'PNP0C0D:00\'\ \|\ sudo\ tee\ /sys/bus/acpi/drivers/button/unbind --description alias\ lid_suspend_off\ echo\ \'PNP0C0D:00\'\ \|\ sudo\ tee\ /sys/bus/acpi/drivers/button/unbind
  echo 'PNP0C0D:00' | sudo tee /sys/bus/acpi/drivers/button/unbind $argv
        
end

function lid_suspend_on --wraps=echo\ \'PNP0C0D:00\'\ \|\ sudo\ tee\ /sys/bus/acpi/drivers/button/bind --description alias\ lid_suspend_on\ echo\ \'PNP0C0D:00\'\ \|\ sudo\ tee\ /sys/bus/acpi/drivers/button/bind
  echo 'PNP0C0D:00' | sudo tee /sys/bus/acpi/drivers/button/bind $argv
        
end
