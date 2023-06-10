
function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
end

function job_setup()
    state.Buff['Mighty Strikes'] = buffactive['Mighty Strikes'] or false
end

function user_setup()
    state.OffenseMode:options('Normal','DT', 'SubtleBlow')
	state.IdleMode:options('Normal', 'Nyame')
		send_command('bind ^f9 input /equipset 25;wait1;input /echo Naegling;wait1;aws use savage blade')
		send_command('bind !f9 input /equipset 26;wait1;input /echo Chango')
		send_command('bind ^@!f9 input /equipset 27;wait1;input /echo Axe;wait1;aws use cloudsplitter')	
		send_command('bind ^!f9 input /equipset 23;wait1;input /echo Shining One')
		send_command('bind @f9 input /equipset 30;wait1;input /echo Club;wait1;aws use Judgment')
		send_command('bind !f11 gs disable main, sub;wait1;input /echo Disable Main')
		send_command('bind !f12 gs enable main, sub;wait1;input /echo Enable Main')
end

function init_gear_sets()
	sets.precast.JA.Warcry = {
        head="Agoge Mask +3",
    }
    sets.precast.JA["Mighty Strikes"] = {
        hands="Agoge Mufflers",
    }
	    sets.precast.JA.Tomahawk = {
        ammo="Thr. Tomahawk",
		feet="Agoge Calligae +2",
    }

	
    sets.precast.JA.Berserk = {
        back="Cichol's Mantle",
		body="Pummeler's Lorica",
		feet="Agoge Calligae +2",
    }
	sets.precast.JA["Blood Rage"] = {
		body="Boii Lorica +1",}
		
    sets.engaged = {
    ammo="Coiste Bodhar",
    head="Sakpata's Helm", 
    body="Sakpata's Plate",
    hands="Sakpata's Gauntlets",
    legs="Sakpata's Cuisses",
    feet="Sakpata's Leggings",
    neck={ name="War. Beads +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Schere Earring",
    right_ear="Boii Earring +1",
    left_ring="Moonlight Ring",
    right_ring="Chirich Ring +1",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
}
	sets.recphalanx = {
	    ammo="Crepuscular Pebble",
    head={ name="Yorium Barbuta", augments={'Mag. Evasion+20','Phalanx +3',}},
    body={ name="Yorium Cuirass", augments={'Mag. Evasion+20','Phalanx +3',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+65','Shield skill +15','Phys. dmg. taken -4',}},
    legs="Sakpata's Cuisses",
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Loricate Torque",
    waist="Ioskeha Belt",
    left_ear="Telos Earring",
    right_ear="Schere Earring",
    left_ring="Moonlight Ring",
    right_ring="Sulevia's Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
}
    
    sets.engaged.DT = set_combine(sets.engaged, {})
	sets.engaged.SubtleBlow = set_combine(sets.engaged, {body="Dagon Breastplate"})
    sets.idle = {
    ammo="Coiste Bodhar",
    head="Sakpata's Helm",
    body="Sakpata's Plate",
    hands="Sakpata's Gauntlets",
    legs="Sakpata's Cuisses",
    feet="Sakpata's Leggings",
    neck={ name="War. Beads +2", augments={'Path: A',}},
    waist="Ioskeha Belt",
    left_ear="Schere Earring",
    right_ear="Boii Earring +1",
    left_ring="Moonlight Ring",
    right_ring="Beithir Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
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
    left_ear="Schere Earring",
	right_ear="Boii Earring +1",
    left_ring="Vengeful Ring",
    right_ring="Supershear Ring",
    back={ name="Cichol's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
  sets.precast.WS = {
    ammo="Knobkierrie",
    head="Agoge Mask +3",
    body="Sakpata's Plate",
    hands="Boii Mufflers +3",
    legs="Boii Cuisses +3",
    feet="Sulev. Leggings +2",
    neck={ name="War. Beads +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Moonshade Earring",
    right_ear="Thrud Earring",
	 left_ring="Ephramad's Ring",
    right_ring="Beithir Ring",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
	sets.precast.WS.Upheaval = {
    ammo="Knobkierrie",
    head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}},
    body="Sakpata's Plate",
    hands="Boii Mufflers +3",
    legs="Boii Cuisses +3",
    feet="Sulev. Leggings +2",
    neck={ name="War. Beads +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
     left_ring="Ephramad's Ring",
    right_ring="Beithir Ring",
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
    left_ear="Moonshade Earring",
    right_ear="Thrud Earring",
     left_ring="Ephramad's Ring",
    right_ring="Epaminondas's ring",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
	sets.precast.WS["Ukko's Fury"] = {
	    ammo="Yetshila +1",
    head="Sakpata's Helm",
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
	legs="Boii Cuisses +3",
   -- legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Boii Calligae +3",
    neck={ name="War. Beads +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Moonshade Earring",
    right_ear="Thrud Earring",
     left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
		sets.precast.WS["Raging Rush"] = {
	    ammo="Yetshila +1",
    head="Sakpata's Helm",
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
	legs="Boii Cuisses +3",
   -- legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Boii Calligae +3",
    neck={ name="War. Beads +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Moonshade Earring",
    right_ear="Boii Earring +1",
     left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
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
    right_ear="Moonshade Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Epaminondas's Ring",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
	sets.precast.WS["Red Lotus Blade"] = {
    ammo="Knobkierrie",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="War. Beads +2", augments={'Path: A',}},
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear="Moonshade Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Epaminondas's Ring",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
	sets.precast.WS["Decimation"] = {
    ammo="Coiste Bodhar",
    head="Sakpata's Helm",
    body="Sakpata's Plate",
    hands="Sakpata's Gauntlets",
    legs="Boii Cuisses +3",
    feet="Sakpata's Leggings",
    neck="Flame Gorget",
    waist="Light Belt",
    left_ear="Schere Earring",
    right_ear="Boii Earring +1",
     left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}
		sets.precast.WS["Resolution"] = {
	    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs="Boii Cuisses +3",
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ear="Moonshade Earring",
     left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}
	sets.precast.WS["Armor Break"] = {     ammo="Oshasha's Treatise",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Boii Mufflers +3",
    legs="Boii Cuisses +3",
    feet="Boii Calligae +3",
    neck="Moonlight Necklace",
    waist="Eschan Stone",
    left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    right_ear="Boii Earring +1",
    left_ring="Flamma Ring",
    right_ring="Crepuscular Ring",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}
	
		sets.precast.WS["Full Break"] = {    ammo="Oshasha's Treatise",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Boii Mufflers +3",
    legs="Boii Cuisses +3",
    feet="Boii Calligae +3",
    neck="Moonlight Necklace",
    waist="Eschan Stone",
    left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    right_ear="Boii Earring +1",
    left_ring="Flamma Ring",
    right_ring="Crepuscular Ring",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}
	
		sets.precast.WS["Weapon Break"] = {     ammo="Oshasha's Treatise",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Boii Mufflers +3",
    legs="Boii Cuisses +3",
    feet="Boii Calligae +3",
    neck="Moonlight Necklace",
    waist="Eschan Stone",
    left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    right_ear="Boii Earring +1",
    left_ring="Flamma Ring",
    right_ring="Crepuscular Ring",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}
	
	sets.precast.WS["Shield Break"] = {      ammo="Oshasha's Treatise",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Boii Mufflers +3",
    legs="Boii Cuisses +3",
    feet="Boii Calligae +3",
    neck="Moonlight Necklace",
    waist="Eschan Stone",
    left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    right_ear="Boii Earring +1",
    left_ring="Flamma Ring",
    right_ring="Crepuscular Ring",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}
	

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