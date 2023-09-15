
function uniconnect
    sudo openconnect vpn.uibk.ac.at -u c7031199
end
function unislice 
        sudo openconnect vpn.uibk.ac.at -u c7031199 -s 'vpn-slice 138.232.0.0/16'
end

function autoslice
        spawn firefox --new-window https://fwauth-tech.uibk.ac.at
        op item get LFU --fields label=password | sudo openconnect vpn.uibk.ac.at --passwd-on-stdin -u c7031199
end

