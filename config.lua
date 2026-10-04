Config = {}

Config.Components = {
    piston = {
        variants = {
            {name = 'Stock Piston', performance = 1.0, price = 0},
            {name = 'Performance Piston', performance = 1.2, price = 500},
            {name = 'Race Piston', performance = 1.5, price = 1000}
        }
    },
    connecting_rod = {
        variants = {
            {name = 'Stock Connecting Rod', performance = 1.0, price = 0},
            {name = 'Performance Connecting Rod', performance = 1.2, price = 500},
            {name = 'Race Connecting Rod', performance = 1.5, price = 1000}
        }
    },
    cylinder_head = {
        variants = {
            {name = 'Stock Cylinder Head', performance = 1.0, price = 0},
            {name = 'Performance Cylinder Head', performance = 1.2, price = 500},
            {name = 'Race Cylinder Head', performance = 1.5, price = 1000}
        }
    },
    valve_command = {
        variants = {
            {name = 'Stock Valve Command', performance = 1.0, price = 0},
            {name = 'Performance Valve Command', performance = 1.2, price = 500},
            {name = 'Race Valve Command', performance = 1.5, price = 1000}
        }
    },
    radiator = {
        variants = {
            {name = 'Stock Radiator', performance = 1.0, price = 0},
            {name = 'Performance Radiator', performance = 1.2, price = 500},
            {name = 'Race Radiator', performance = 1.5, price = 1000}
        }
    },
    turbocharger = {
        variants = {
            {name = 'Stock Turbocharger', performance = 1.0, price = 0},
            {name = 'Performance Turbocharger', performance = 1.2, price = 500},
            {name = 'Race Turbocharger', performance = 1.5, price = 1000}
        }
    }
}

Config.AntiExploit = {
    max_upgrades = 3,
    cooldown = 30000 -- 30 seconds
}