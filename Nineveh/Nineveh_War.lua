
function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
end

function job_setup()
    state.Buff['Mighty Strikes'] = buffactive['Mighty Strikes'] or false
end

function user_setup()
    state.OffenseMode:options('Normal','DT', 'SubtleBlow','Counter')
	state.IdleMode:options('Normal', 'Nyame')
		send_command('bind ^f9 input /equipset 25;wait1;input /echo Naegling;wait1;aws use savage blade')
		send_command('bind !f9 input /equipset 26;wait1;input /echo Chango;wait1;aws use upheaval')
		send_command('bind ^@!f9 input /equipset 32;wait1;input /echo Gsword;wait1;aws use Resolution')	
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
        hands="Agoge Mufflers",
    }
	    sets.precast.JA.Tomahawk = {
		feet="Agoge calligae +3",
        ammo="Thr. Tomahawk",
    }
sets.precast.JA.Restraint = {
	  hands="Boii Mufflers +3",
	  }
    sets.precast.JA.Berserk = {
        back="Cichol's Mantle",
		body="Pumm. Lorica +3",
		feet="Agoge calligae +3",
    }
	sets.precast.JA["Blood Rage"] = {
		body="Boii Lorica +3",}
		
    sets.engaged = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck={ name="War. Beads +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Schere Earring",
    right_ear="Boii Earring +2",
    left_ring="Chirich Ring +1",
    right_ring="Moonlight Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}
	
	sets.engaged.Counter = {
	    main={ name="Ukonvasara", augments={'Path: A',}},
    sub="Utu Grip",
    ammo="Yetshila +1",
    head="Boii Mask +3",
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet="Boii Calligae +3",
    neck={ name="War. Beads +2", augments={'Path: A',}},
    waist="Cornelia's Belt",
    left_ear="Cryptic Earring",
    right_ear={ name="Boii Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','Crit.hit rate+5',}},
    left_ring="Ephramad's Ring",
    right_ring="Moonlight Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10','System: 1 ID: 640 Val: 4',}},

}
	sets.recphalanx = {
	    ammo="Crepuscular Pebble",
    head={ name="Odyssean Helm", augments={'Attack+8','Crit. hit damage +2%','Phalanx +3','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
    body={ name="Valorous Mail", augments={'Weapon skill damage +4%','"Dbl.Atk."+2','Phalanx +4','Accuracy+2 Attack+2',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Engraved Belt",
    left_ear="Genmei Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Niqmaddu Ring",
    right_ring="Moonlight Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
}
    
    sets.engaged.DT = set_combine(sets.engaged, {})
	sets.engaged.SubtleBlow = set_combine(sets.engaged, {body="Dagon Breastplate"})
    sets.idle = {
	    ammo="Crepuscular Pebble",
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Engraved Belt",
    left_ear="Genmei Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Regal Ring",
    right_ring="Shneddick Ring",
    back={ name="Cichol's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
      sets.idle.Nyame = {
    ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Engraved Belt",
    left_ear="Genmei Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Vengeful Ring",
    right_ring="Shneddick Ring",
    back={ name="Cichol's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Damage taken-5%',}},
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
    right_ring="Sroda ring",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
	sets.precast.WS.Upheaval = {
    ammo="Knobkierrie",
      head="Agoge Mask +3",
  -- body={ name="Sakpata's Plate", augments={'Path: A',}},
	 body={ name="Nyame Mail", augments={'Path: B',}},
       hands="Boii Mufflers +3",
	legs="Boii Cuisses +3",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="War. Beads +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Ephramad's Ring",
    back={ name="Cichol's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
	  sets.precast.WS["King's Justice"] = {
    ammo="Knobkierrie",
       head="Agoge Mask +3",
    body="Sakpata's Plate",
    hands="Sakpata's Gauntlets",
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
	  sets.precast.WS["Calamity"] = {
    ammo="Knobkierrie",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Boii Mufflers +3",
    legs="Boii Cuisses +3",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="War. Beads +2", augments={'Path: A',}},
    waist="Peiste Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
    left_ring="Ephramad's Ring",
    right_ring="Chirich Ring +1",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
	  sets.precast.WS["Mistral Axe"] = {
    ammo="Knobkierrie",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Boii Mufflers +3",
    legs="Boii Cuisses +3",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="War. Beads +2", augments={'Path: A',}},
    waist="Peiste Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
    left_ring="Ephramad's Ring",
    right_ring="Chirich Ring +1",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
	sets.precast.WS["Ukko's Fury"] = {
    head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs="Boii Cuisses +3",
    feet="Boii Calligae +3",
    neck={ name="War. Beads +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ear="Boii Earring +2",
    left_ring="Sroda Ring",
    right_ring="Ephramad's Ring",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
		sets.precast.WS["Raging Rush"] = {
	    ammo="Yetshila +1",
    head="Sakpata's Helm",
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
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
			sets.precast.WS["Impulse Drive"] = {
	 ammo="Knobkierrie",
    head="Sakpata's Helm",
    body={ name="Sakpata's Plate", augments={'Path: A',}},
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
	sets.precast.WS["Cloudsplitter"] = {
    ammo="Knobkierrie",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="War. Beads +2", augments={'Path: A',}},
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Epaminondas's Ring",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
	sets.precast.WS["Decimation"] = {
	    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs="Boii Cuisses +3",
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ear="Boii Earring +1",
    left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
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
    right_ear="Boii Earring +2",
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
    right_ear="Boii Earring +2",
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
    right_ear="Boii Earring +2",
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
    right_ear="Boii Earring +2",
    left_ring="Crepuscular Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
	
	sets.precast.WS["Resolution"] = {
	    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs="Boii Cuisses +3",
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
	left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Boii Earring +2",
    left_ring="Niqmaddu Ring",
    right_ring="Ephramad's Ring",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}

    sets.buff['Mighty Strikes'] = {
        feet="Boii Calligae +3",
    }
end

function customize_melee_set(meleeSet)
    if buffactive['Brazen Rush'] then 
        return set_combine(meleeSet, {
        --    back={name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10',}},
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
    set_macro_page(2, 1)
end