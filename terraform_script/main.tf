terraform {
  required_providers {
    grid = {
      source = "threefoldtech/grid"
    }
  }
}

provider "grid" {
}

resource "grid_network" "botnetwork" {
    nodes = [2]
    ip_range = "10.1.0.0/16"
    name = "bot_network"
    add_wg_access = true
}
resource "grid_deployment" "botVm" {
  node = 2
  network_name = grid_network.botnetwork.name
  ip_range = lookup(grid_network.botnetwork.nodes_ip_range, 2, "")
  vms {
    name = "tfgrid_bot"
    flist = "https://hub.grid.tf/andrew27.3bot/andrew271-chat_bot-latest.flist"
    cpu = 2 
    publicip = true
    memory = 4096
    env_vars = {
      SSH_KEY = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCztf0IrO2D9E0iPZ+G0oc68IX3q/FcSOs5cJVFTDMQ15CQIE2NqgYptSNV/OZEjkVK2hf0gzSWB9NR3k5NHxxsH2ZzFbTVHTsg1z6fjMy/5huCCerjeAOOPtg5QXrpwfUDItSW+mfdAdbu9pQblB+ChoW81uUkrqFxVGVqo3IJB3Q7kF3+nD+1vgT/xCljI92ME4V9fF/wr/1c9fYpzMMba3z9S4wdoC/VShmfQ1Ixq96JAPFEqZp/oiSRrYZVC40G+PsktlIKkwbeiCh9rr5ppaSHQxX6zcXd3AmtCy0T9vyVIJz8J74oV7TDHvNpcK8DVLHQI8xbmKC4PeOjGmwfiDH8dW+sp875GAcMv1up0qWjfB796A2m9QyTRKXL4Zt9+r04eRfgG9Cj0C8ajZ9jFu64CrmgH1GYjlou40RN4ExH6VGPnt3BLU9omnm45E8hwupB0x3x1tqMLo6Ja7nJkW8PPO6nSqvF81JWo8hiVmBbH2PE3U/WHXkLIFWPlYc= andrew@andrew-VirtualBox"
       }
    planetary = true
  }
  
}

output "public_ip" {
    value = grid_deployment.botVm.vms[0].computedip
}