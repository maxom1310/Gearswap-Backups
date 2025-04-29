
function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
end

function job_setup()
    state.Buff['Mighty Strikes'] = buffactive['Mighty Strikes'] or false
end

function user_setup()
    state.OffenseMode:options('Normal', 'DT')
		send_command('bind ^f9 input /equipset 25;wait1;input /echo Naegling;wait1;aws use savage blade')
		send_command('bind !f9 input /equipset 26;wait1;input /echo Chango;wait1;aws use Upheaval')
		send_command('bind ^@!f9 input /equipset 27;wait1;input /echo Gsword;wait1;aws use Fimbulvetr')	
		send_command('bind @!f9 input /equipset 31;wait1;input /echo Gsword;wait1;aws use Disaster')	
		send_command('bind ^!f9 input /equipset 23;wait1;input /echo Shining One')
		send_command('bind @f9 input /equipset 30;wait1;input /echo Club;wait1;aws use Judgment')
		send_command('bind !f11 gs disable main, sub;wait1;input /echo Disable Main')
		send_command('bind !f12 gs enable main, sub;wait1;input /echo Enable Main')
		select_default_macro_book()
end

function init_gear_sets()
	sets.precast.JA.Warcry = {
        head="Agoge Mask +3",
    }
    sets.precast.JA["Mighty Strikes"] = {
    ammo="Crepuscular Pebble",
    head={ name="Ebur Armet", augments={'Path: B',}},
    body={ name="Ebon Breastplate", augments={'Path: B',}},
    hands={ name="Agoge Mufflers +1", augments={'Enhances "Mighty Strikes" effect',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Elite Royal Collar",
    waist="Plat. Mog. Belt",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Defending Ring",
    back={ name="Cichol's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Damage taken-5%',}},
    }
    sets.precast.JA.Berserk = {
        back="Cichol's Mantle",
		body="Pumm. Lorica +3",
		feet="Agoge calligae +3",
    }
		    sets.precast.JA.Tomahawk = {
		feet="Agoge calligae +3",
        ammo="Thr. Tomahawk",
    }
	sets.precast.JA["Blood Rage"] = {
		body="Boii Lorica +3",}
		
    sets.engaged = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body="Sakpata's Plate",
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck={ name="War. Beads +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ear={ name="Boii Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+14','Mag. Acc.+14','Crit.hit rate+5',}},
    left_ring="Niqmaddu Ring",
    right_ring="Moonlight Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
}
	sets.recphalanx = {
    ammo="Crepuscular Pebble",
    head={ name="Odyssean Helm", augments={'"Conserve MP"+3','Mag. Acc.+6','Phalanx +5','Accuracy+14 Attack+14','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
    body={ name="Odyss. Chestplate", augments={'Damage taken-2%','Weapon skill damage +3%','Phalanx +5','Accuracy+3 Attack+3',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Elite Royal Collar",
    waist="Asklepian Belt",
    left_ear="Flashward Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Niqmaddu Ring",
    right_ring="Moonlight Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
}

    
    sets.engaged.DT = set_combine(sets.engaged, {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body="Boii Lorica +3",
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck={ name="War. Beads +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ear={ name="Boii Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+14','Mag. Acc.+14','Crit.hit rate+5',}},
    left_ring="Niqmaddu Ring",
    right_ring="Moonlight Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},})
    sets.idle = {
	    ammo="Crepuscular Pebble",
    head="Sakpata's Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Elite Royal Collar",
    waist="Flume Belt +1",
    left_ear="Etiolation Earring",
    right_ear="Cryptic Earring",
    left_ring="Shneddick Ring",
    right_ring="Defending Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}
    sets.precast.WS = {
    ammo="Knobkierrie",
    head="Agoge Mask +3",
    body="Nyame Mail",
    hands="Boii Mufflers +3",
    legs="Boii Cuisses +3",
    feet="Nyame Sollerets",
    neck="War. Beads +2",
    waist="Sailfi Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's ring",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
    sets.precast.WS["Disaster"] = {
    ammo="Knobkierrie",
    head="Agoge Mask +3",
    body="Nyame Mail",
    hands="Boii Mufflers +3",
    legs="Boii Cuisses +3",
    feet="Nyame Sollerets",
    neck="War. Beads +2",
    waist="Sailfi Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
	left_ring="Niqmaddu Ring",
    right_ring="Ephramad's Ring",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
			sets.precast.WS["Impulse Drive"] = {
    main="Shining One",
    sub="Utu Grip",
    ammo="Knobkierrie",
    head="Nyame Helm",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Boii Mufflers +3",
    legs="Boii Cuisses +3",
    feet="Boii Calligae +3",
    neck={ name="War. Beads +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
    left_ring="Sroda Ring",
    right_ring="Ephramad's Ring",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
	sets.precast.WS.Resolution = {
   ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Sakpata's Helm",
    body="Sakpata's Plate",
    hands="Sakpata's Gauntlets",
   legs="Boii Cuisses +3",
    feet="Sakpata's Leggings",
    neck="Fotia Gorget",
    waist="Fotia Belt",
	 left_ear="Schere Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Niqmaddu Ring",
    right_ring="Ephramad's Ring",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},
}
	sets.precast.WS["Armor Break"] = {    ammo="Pemphredo Tathlum",
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body="Boii Lorica +3",
    hands="Boii Mufflers +3",
    legs="Boii Cuisses +3",
    feet="Boii Calligae +3",
    neck="Moonlight Necklace",
    waist="Eschan Stone",
    left_ear="Crep. Earring",
    right_ear={ name="Boii Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+14','Mag. Acc.+14','Crit.hit rate+5',}},
    left_ring="Crepuscular Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
	
		sets.precast.WS["Full Break"] = {    ammo="Pemphredo Tathlum",
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body="Boii Lorica +3",
    hands="Boii Mufflers +3",
    legs="Boii Cuisses +3",
    feet="Boii Calligae +3",
    neck="Moonlight Necklace",
    waist="Eschan Stone",
    left_ear="Crep. Earring",
    right_ear={ name="Boii Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+14','Mag. Acc.+14','Crit.hit rate+5',}},
    left_ring="Crepuscular Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
	
		sets.precast.WS["Weapon Break"] = {    ammo="Pemphredo Tathlum",
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body="Boii Lorica +3",
    hands="Boii Mufflers +3",
    legs="Boii Cuisses +3",
    feet="Boii Calligae +3",
    neck="Moonlight Necklace",
    waist="Eschan Stone",
    left_ear="Crep. Earring",
    right_ear={ name="Boii Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+14','Mag. Acc.+14','Crit.hit rate+5',}},
    left_ring="Crepuscular Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
		sets.precast.WS["Shield Break"] = {    ammo="Pemphredo Tathlum",
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body="Boii Lorica +3",
    hands="Boii Mufflers +3",
    legs="Boii Cuisses +3",
    feet="Boii Calligae +3",
    neck="Moonlight Necklace",
    waist="Eschan Stone",
    left_ear="Crep. Earring",
    right_ear={ name="Boii Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+14','Mag. Acc.+14','Crit.hit rate+5',}},
    left_ring="Crepuscular Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
	
	sets.precast.WS.Upheaval = {
      ammo="Knobkierrie",
    head="Agoge Mask +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Boii Mufflers +3",
    legs="Boii Cuisses +3",
    feet="Nyame Sollerets",
    neck="War. Beads +2",
    waist="Sailfi Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Ephramad's Ring",
    back={ name="Cichol's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Damage taken-5%',}},
}

    sets.buff['Mighty Strikes'] = {
       feet="Boii Calligae +3",
    }
end

function customize_melee_set(meleeSet)
    if buffactive['Brazen Rush'] then 
        return set_combine(meleeSet, {
       --     back={name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10',}},
        })
    else
        return meleeSet
    end
end

function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.type == 'WeaponSkill' and state.Buff['Mighty Strikes'] then
        equip(sets.buff['Mighty Strikes'])
        eventArgs.handled = true
    end
end
function select_default_macro_book()
    set_macro_page(2, 11)
end