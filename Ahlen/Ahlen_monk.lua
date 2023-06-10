-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
 
-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
     
    -- Load and initialize the include file.
    include('Mote-Include.lua')
end
 
 
-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff.Impetus = buffactive.Impetus or false
 
     
    info.impetus_hit_count = 0
    windower.raw_register_event('action', on_action_for_impetus)
	
	lockstyleset = 17
end
 
 
-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------
 
-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Hybrid', 'Mpaca')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.HybridMode:options('Normal', 'PDT','Fodder')
    state.PhysicalDefenseMode:options('PDT')
    update_melee_groups()
 
    select_default_macro_book()
	set_lockstyle()
	send_command('bind ^f9 input /equipset 28;wait1;input /echo Godhands')
	send_command('bind @f9 input /equipset 31;wait1;input /echo Vere')
	send_command('bind !f9 input /equipset 29;wait1;input /echo Staff')
end
 
 
-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
     
    -- Precast Sets
     
    -- Precast sets to enhance JAs on use
    sets.precast.JA['Hundred Fists'] = {legs="Hesychast's Hose +1"}
    sets.precast.JA['Boost'] = {}--hands="Anchorite's Gloves +3"}
    sets.precast.JA['Dodge'] = {}--feet="Anchorite's Gaiters +3"}
    sets.precast.JA['Focus'] = {}--head="Anchorite's Crown +1"}
    sets.precast.JA['Counterstance'] = {}--feet="Melee Gaiters +2"}
    sets.precast.JA['Footwork'] = {feet="Shukuyu Sune-Ate"}
    sets.precast.JA['Formless Strikes'] = {}
    sets.precast.JA['Mantra'] = {feet="Melee Gaiters +2"}
 
    sets.precast.JA['Chi Blast'] = {head="Hesychast's Crown +3"}
 
    sets.precast.JA['Chakra'] = {
    ammo="Crepuscular Pebble",
    head={ name="Mpaca's Cap", augments={'Path: A',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Mpaca's Hose", augments={'Path: A',}},
    feet={ name="Mpaca's Boots", augments={'Path: A',}},
    neck="Elite Royal Collar",
    waist="Moonbow Belt +1",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Genmei Earring",
    right_ring="Niqmaddu Ring",
    left_ring="Regal Ring",
    back={ name="Segomo's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','"Dbl.Atk."+10','Damage taken-5%',}},}
 
    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
         
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
 
    sets.precast.Step = {}
    sets.precast.Flourish1 = {}
	
	-- RUN magic damage sets
	sets.precast.JA['Swipe'] = {
		ammo="Pemphredo tathlum",
		head={ name="Herculean Helm", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','VIT+3','Mag. Acc.+15','"Mag.Atk.Bns."+13',}},
		body="Malignance Tabard",
		back="Argochampsa Mantle",
		neck="Baetyl Pendant",
		hands="Leyline Gloves",
		waist="Eschan Stone",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		ring1="Shiva Ring +1",
		ring2="Mujin Band",
		ear1="Novio Earring",
		ear2="Friomisi Earring"}
	sets.precast.JA['Lunge'] = {
		ammo="Pemphredo tathlum",
		head={ name="Herculean Helm", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','VIT+3','Mag. Acc.+15','"Mag.Atk.Bns."+13',}},
		body="Malignance Tabard",
		back="Argochampsa Mantle",
		neck="Baetyl Pendant",
		hands="Leyline Gloves",
		waist="Eschan Stone",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		ring1="Shiva Ring +1",
		ring2="Mujin Band",
		ear1="Novio Earring",
		ear2="Friomisi Earring"}
 
 
    -- Fast cast sets for spells
     
    sets.precast.FC = {
    ammo="Sapience Orb",
    head={ name="Herculean Helm", augments={'"Fast Cast"+6','STR+7','Mag. Acc.+4',}},
    body={ name="Adhemar Jacket +1", augments={'HP+105','"Fast Cast"+10','Magic dmg. taken -4',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs={ name="Herculean Trousers", augments={'"Fast Cast"+6','STR+6','"Mag.Atk.Bns."+9',}},
    feet={ name="Herculean Boots", augments={'Mag. Acc.+17','"Fast Cast"+5','"Mag.Atk.Bns."+11',}},
    neck="Orunmila's Torque",
    waist="Moonbow Belt +1",
    left_ear="Enchntr. Earring +1",
    right_ear="Loquac. Earring",
    left_ring="Prolix Ring",
    right_ring="Rahab Ring",
    back="Moonlight Cape",
	}
 
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})
 
        
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
	-- 1152 Accuracy
    sets.precast.WS = {
      ammo="Crepuscular Pebble",
    head={ name="Mpaca's Cap", augments={'Path: A',}},
    body={ name="Mpaca's Doublet", augments={'Path: A',}},
    hands={ name="Mpaca's Gloves", augments={'Path: A',}},
    legs={ name="Mpaca's Hose", augments={'Path: A',}},
    feet={ name="Mpaca's Boots", augments={'Path: A',}},
    neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ring="Ephramad's Ring",
    left_ring="Gere Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}
    -- 1289 Accuracy
	sets.precast.WSAcc = {
      ammo="Crepuscular Pebble",
    head={ name="Mpaca's Cap", augments={'Path: A',}},
    body={ name="Mpaca's Doublet", augments={'Path: A',}},
    hands={ name="Mpaca's Gloves", augments={'Path: A',}},
    legs={ name="Mpaca's Hose", augments={'Path: A',}},
    feet={ name="Mpaca's Boots", augments={'Path: A',}},
    neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ring="Ephramad's Ring",
    left_ring="Gere Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},
		}
    sets.precast.WSMod = {}
    sets.precast.MaxTP = {}
    sets.precast.WS.Acc = set_combine(sets.precast.WS, sets.precast.WSAcc)
    sets.precast.WS.Mod = set_combine(sets.precast.WS, sets.precast.WSMod)
 
    -- Specific weaponskill sets.
     
    -- 1152 Accuracy
    sets.precast.WS["Raging Fists"] = {
    ammo="Crepuscular Pebble",
    head={ name="Mpaca's Cap", augments={'Path: A',}},
    body={ name="Mpaca's Doublet", augments={'Path: A',}},
    hands={ name="Herculean Gloves", augments={'Accuracy+27','"Triple Atk."+4','STR+7','Attack+14',}},
    legs={ name="Mpaca's Hose", augments={'Path: A',}},
    feet={ name="Mpaca's Boots", augments={'Path: A',}},
    neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ring="Ephramad's Ring",
    left_ring="Gere Ring",
  back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},
}
    -- 1159 Accuracy
	sets.precast.WS["Howling Fist"] = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Mpaca's Cap", augments={'Path: A',}},
    body={ name="Mpaca's Doublet", augments={'Path: A',}},
    hands={ name="Mpaca's Gloves", augments={'Path: A',}},
    legs={ name="Mpaca's Hose", augments={'Path: A',}},
    feet={ name="Mpaca's Boots", augments={'Path: A',}},
    neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ring="Ephramad's Ring",
    left_ring="Gere Ring",
    back={ name="Segomo's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','"Dbl.Atk."+10','Damage taken-5%',}},
                                   }
    -- 1159 Accuracy
	sets.precast.WS["Asuran Fists"] = {
    ammo="Crepuscular Pebble",
    head={ name="Mpaca's Cap", augments={'Path: A',}},
    body={ name="Mpaca's Doublet", augments={'Path: A',}},
    hands={ name="Mpaca's Gloves", augments={'Path: A',}},
    legs={ name="Mpaca's Hose", augments={'Path: A',}},
    feet={ name="Mpaca's Boots", augments={'Path: A',}},
    neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear="Sherida Earring",
    right_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ring="Ephramad's Ring",
    left_ring="Gere Ring",
    back={ name="Segomo's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}
    -- 1164 Accuracy
	sets.precast.WS["Ascetic's Fury"] = {
																		ammo="Knobkierrie",
                                                                        head="Adhemar bonnet +1", --4 TA
                                                                        body="Kendatsuba Samue +1", --6 TA and 9 CR
                                                                        hands="Ryuo tekko +1", --CR 5
                                                                        legs="Kendatsuba Hakama +1", --5 TA and 7 CR
                                                                        feet={ name="Herculean Boots", augments={'Accuracy+16','Crit. hit damage +5%','STR+9',}},
                                                                        neck="Monk's nodowa +2",
                                                                        waist="Moonbow belt +1", --8 TA
                                                                        left_ear="Sherida earring",  --5 DA
                                                                        right_ear="Moonshade earring",
                                                                            right_ring="Ephramad's Ring",
																			left_ring="Gere Ring",
                                                                        back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Crit.hit rate+10','Damage taken-5%',}}} --10 CR
    -- 1164 Accuracy 
	sets.precast.WS["Victory Smite"] = {
    ammo="Crepuscular Pebble",
    head={ name="Mpaca's Cap", augments={'Path: A',}},
    body={ name="Mpaca's Doublet", augments={'Path: A',}},
    hands={ name="Mpaca's Gloves", augments={'Path: A',}},
    legs={ name="Mpaca's Hose", augments={'Path: A',}},
    feet={ name="Mpaca's Boots", augments={'Path: A',}},
    neck="Fotia Gorget",
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ring="Ephramad's Ring",
    left_ring="Gere Ring",
    back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}
    -- 1286 Accuracy
	sets.precast.WS["Shoulder Tackle"] = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Mpaca's Cap", augments={'Path: A',}},
    body={ name="Mpaca's Doublet", augments={'Path: A',}},
    hands={ name="Herculean Gloves", augments={'Accuracy+27','"Triple Atk."+4','STR+7','Attack+14',}},
    legs={ name="Mpaca's Hose", augments={'Path: A',}},
    feet={ name="Mpaca's Boots", augments={'Path: A',}},
    neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ring="Ephramad's Ring",
    left_ring="Gere Ring",
    back={ name="Segomo's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','"Dbl.Atk."+10','Damage taken-5%',}},}
	-- 1286 Accuracy
	sets.precast.WS["Shijin Spiral"] = {
    ammo="Crepuscular Pebble",
    head={ name="Mpaca's Cap", augments={'Path: A',}},
    body={ name="Mpaca's Doublet", augments={'Path: A',}},
    hands={ name="Mpaca's Gloves", augments={'Path: A',}},
    legs={ name="Mpaca's Hose", augments={'Path: A',}},
    feet={ name="Mpaca's Boots", augments={'Path: A',}},
    neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Mache Earring +1",
    right_ring="Ephramad's Ring",
    left_ring="Gere Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}
		sets.precast.WS["Shell Crusher"] = {
    ammo="Knobkierrie",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Digni. Earring",
    right_ring="Ephramad's Ring",
    left_ring="Gere Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}
    -- 1144 Accuracy
	sets.precast.WS["Dragon Kick"] = {
   ammo="Crepuscular Pebble",
    head={ name="Mpaca's Cap", augments={'Path: A',}},
    body={ name="Mpaca's Doublet", augments={'Path: A',}},
    hands={ name="Mpaca's Gloves", augments={'Path: A',}},
    legs={ name="Mpaca's Hose", augments={'Path: A',}},
    feet={ name="Mpaca's Boots", augments={'Path: A',}},
    neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ring="Ephramad's Ring",
    left_ring="Gere Ring",
    back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},
	--feet="Anchorite's Gaiters +3", I need to get these asap 
	}
    -- 1144 Accuracy
	sets.precast.WS["Tornado Kick"] = {
    ammo="Crepuscular Pebble",
    head={ name="Mpaca's Cap", augments={'Path: A',}},
    body={ name="Mpaca's Doublet", augments={'Path: A',}},
    hands={ name="Mpaca's Gloves", augments={'Path: A',}},
    legs={ name="Mpaca's Hose", augments={'Path: A',}},
    feet={ name="Mpaca's Boots", augments={'Path: A',}},
    neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ring="Ephramad's Ring",
    left_ring="Gere Ring",
    back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},
	--feet="Anchorite's Gaiters +3", I need to get these asap 
	}
    sets.precast.WS["Spinning Attack"] = set_combine(sets.precast.WS, {})
 
	-- 1266 Accuracy
    sets.precast.WS["Raging Fists"].Acc = {
																		ammo="Knobkierrie",
																		head="Kendatsuba Jinpachi +1",
																		body="Kendatsuba Samue +1",
																		hands="Kendatsuba Tekko +1",
																		legs="Kendatsuba Hakama +1",
																		feet="Kendatsuba Sune-Ate +1",
																		neck="Monk's nodowa +2",
																		waist="Moonbow belt +1",
																		left_ear="Sherida earring",
																		right_ear="Moonshade earring",
																		right_ring="Ephramad's Ring",
																		left_ring="Gere Ring",
																		back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10', 'Damage taken-5%',}}}
    -- 1266 Accuracy
	sets.precast.WS["Howling Fist"].Acc = {
																		ammo="Knobkierrie",
																		head="Kendatsuba Jinpachi +1",
																		body="Kendatsuba Samue +1",
																		hands="Kendatsuba Tekko +1",
																		legs="Kendatsuba Hakama +1",
																		feet="Kendatsuba Sune-Ate +1",
																		neck="Monk's nodowa +2",
																		waist="Moonbow belt +1",
																		left_ear="Sherida earring",
																		right_ear="Moonshade earring",
																		right_ring="Ephramad's Ring",
																		left_ring="Gere Ring",
																		back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10', 'Damage taken-5%',}}}
    -- 1257 Accuracy
	sets.precast.WS["Asuran Fists"].Acc = {
																		ammo="Knobkierrie",
                                                                        head="Malignance Chapeau",
																		body="Malignance Tabard",
																		hands="Malignance Gloves",
																		legs="Malignance Tights",
                                                                        feet="Malignance Boots",
                                                                        neck="Monk's nodowa +2",
                                                                        waist="Moonbow belt +1",
                                                                        left_ear="Sherida earring",
                                                                        right_ear="Moonshade earring",
																		right_ring="Ephramad's Ring",
																		left_ring="Gere Ring",
																		back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10', 'Damage taken-5%',}}}
    -- 1261 Accuracy
	sets.precast.WS["Ascetic's Fury"].Acc = {
																		ammo="Knobkierrie",
                                                                        head="Kendatsuba Jinpachi +1", --4 TA and 5 CR
                                                                        body="Kendatsuba Samue +1", --6 TA and 9 CR
                                                                        hands="Ryuo tekko +1", --CR 5
                                                                        legs="Kendatsuba Hakama +1", --5 TA and 7 CR
                                                                        feet="Kendatsuba Sune-Ate +1", --4 TA and 5 CR
                                                                        neck="Monk's nodowa +2",
                                                                        waist="Moonbow belt +1", --8 TA
                                                                        left_ear="Sherida earring", --5 DA
                                                                        right_ear="Moonshade earring",
																		right_ring="Ephramad's Ring",
																		left_ring="Gere Ring",
                                                                        back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10', 'Damage taken-5%',}}} --10 DA
    -- 1261 Accuracy
	sets.precast.WS["Victory Smite"].Acc = {
																		ammo="Knobkierrie",
                                                                        head="Kendatsuba Jinpachi +1", --4 TA and 5 CR
                                                                        body="Kendatsuba Samue +1", --6 TA and 9 CR
                                                                        hands="Ryuo tekko +1", --CR 5
                                                                        legs="Kendatsuba Hakama +1", --5 TA and 7 CR
                                                                        feet="Kendatsuba Sune-Ate +1", --4 TA and 5 CR
                                                                        neck="Monk's nodowa +2",
                                                                        waist="Moonbow belt +1", --8 TA
                                                                        left_ear="Sherida earring", --5 DA
                                                                        right_ear="Moonshade earring",
																		right_ring="Ephramad's Ring",
																		left_ring="Gere Ring",
                                                                        back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10', 'Damage taken-5%',}}} --10 DA
    --1286 Accuracy
	sets.precast.WS["Shoulder Tackle"].Acc = {
																		ammo="Knobkierrie",
                                                                        head="Malignance Chapeau",
																		body="Malignance Tabard",
																		hands="Malignance Gloves",
																		legs="Malignance Tights",
                                                                        feet="Malignance Boots",
                                                                        neck="Monk's nodowa +2",
                                                                        waist="Moonbow belt +1",
                                                                        left_ear="Sherida earring",
                                                                        right_ear="Dignitary's earring",
																		right_ring="Ephramad's Ring",
																		left_ring="Gere Ring",
                                                                        back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}}}
	--1286 Accuracy
	sets.precast.WS["Shijin Spiral"].Acc = {
																		ammo="Knobkierrie",
                                                                        head="Malignance Chapeau",
																		body="Malignance Tabard",
																		hands="Malignance Gloves",
																		legs="Malignance Tights",
                                                                        feet="Malignance Boots",
                                                                        neck="Monk's nodowa +2",
                                                                        waist="Moonbow belt +1",
                                                                        left_ear="Sherida earring",
                                                                        right_ear="Dignitary's earring",
																		right_ring="Ephramad's Ring",
																		left_ring="Gere Ring",
                                                                        back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}}}   
   -- 1276 Accuracy
	sets.precast.WS["Dragon Kick"].Acc = {
																		ammo="Knobkierrie",
																		head="Kendatsuba Jinpachi +1",
																		body="Kendatsuba Samue +1",
																		hands="Kendatsuba Tekko +1",
																		legs="Kendatsuba Hakama +1",
																		feet="Anchorite's Gaiters +3",
																		neck="Monk's nodowa +2",
																		waist="Moonbow belt +1",
																		left_ear="Sherida earring",
																		right_ear="Moonshade earring",
																		right_ring="Ephramad's Ring",
																		left_ring="Gere Ring",
																		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10', 'Damage taken-5%',}}}
    -- 1276 Accuracy
	sets.precast.WS["Tornado Kick"].Acc = {
																		ammo="Knobkierrie",
																		head="Kendatsuba Jinpachi +1",
																		body="Kendatsuba Samue +1",
																		hands="Kendatsuba Tekko +1",
																		legs="Kendatsuba Hakama +1",
																		feet="Anchorite's Gaiters +3",
																		neck="Monk's nodowa +2",
																		waist="Moonbow belt +1",
																		left_ear="Sherida earring",
																		right_ear="Moonshade earring",
																			right_ring="Ephramad's Ring",
																			left_ring="Gere Ring",
																		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10', 'Damage taken-5%',}}}
 
    sets.precast.WS["Raging Fists"].Mod = set_combine(sets.precast.WS["Raging Fists"], sets.precast.WSMod)
    sets.precast.WS["Howling Fist"].Mod = set_combine(sets.precast.WS["Howling Fist"], sets.precast.WSMod)
    sets.precast.WS["Asuran Fists"].Mod = set_combine(sets.precast.WS["Asuran Fists"], sets.precast.WSMod)
    sets.precast.WS["Ascetic's Fury"].Mod = set_combine(sets.precast.WS["Ascetic's Fury"], sets.precast.WSMod)
    sets.precast.WS["Victory Smite"].Mod = set_combine(sets.precast.WS["Victory Smite"], sets.precast.WSMod)
    sets.precast.WS["Shijin Spiral"].Mod = set_combine(sets.precast.WS["Shijin Spiral"], sets.precast.WSMod)
    sets.precast.WS["Dragon Kick"].Mod = set_combine(sets.precast.WS["Dragon Kick"], sets.precast.WSMod)
    sets.precast.WS["Tornado Kick"].Mod = set_combine(sets.precast.WS["Tornado Kick"], sets.precast.WSMod)
 
 
    sets.precast.WS["Cataclysm"] = {
	ammo="Knobkierrie",
    head="Pixie Hairpin +1",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sanctity Necklace",
    waist="Orpheus's Sash",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Friomisi Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Archon Ring",
    back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},
		}
     
     
    -- Midcast Sets
    sets.midcast.FastRecast = {}
         
    -- Specific spells
    sets.midcast.Utsusemi = {}
 
     
    -- Sets to return to when not performing an action.
     
    -- Resting sets
    sets.resting = {}
     
 
    -- Idle sets
    sets.idle = {
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back="Moonlight Cape",
		}
 
    sets.idle.Town = {
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back="Moonlight Cape",
		}
     
    sets.idle.Weak = {
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back="Moonlight Cape",
		} --6
     
    -- Defense sets
    sets.defense.PDT = {
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back="Moonlight Cape",
	} --
 
    sets.defense.HP = {}
 
    sets.defense.MDT = {
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Etiolation Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back="Moonlight Cape",} --5
 
    sets.Kiting = {right_ring="Shneddick Ring",}
 
    sets.ExtraRegen = {}
 
    -- Engaged sets
 
    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
     
    -- Normal melee sets
	-- 1158 Accuracy
    sets.engaged = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Ken. Jinpachi +1",
    body={ name="Mpaca's Doublet", augments={'Path: A',}},
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs="Bhikku Hose +3",
    feet={ name="Herculean Boots", augments={'Accuracy+26','"Triple Atk."+4','DEX+10','Attack+13',}},
    neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ring="Niqmaddu Ring",
    left_ring="Gere Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},
		}
    sets.engaged.SomeAcc = {}
	
    sets.engaged.Hybrid = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Bhikku Hose +3",
    feet="Malignance Boots",
    neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ring="Niqmaddu Ring",
    left_ring="Gere Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}
	    sets.engaged.Mpaca = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Mpaca's Cap", augments={'Path: A',}},
    body={ name="Mpaca's Doublet", augments={'Path: A',}},
    hands={ name="Mpaca's Gloves", augments={'Path: A',}},
    legs="Mpaca's Hose",
    feet={ name="Mpaca's Boots", augments={'Path: A',}},
    neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ring="Niqmaddu Ring",
    left_ring="Gere Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}
    sets.engaged.Mod = {}
 
    -- Defensive melee hybrid sets
	-- 1274 Accuracy
    sets.engaged.PDT = {
		ammo="Staunch Tathlum +1", --3
        head="Malignance Chapeau", --6
        body="Malignance Tabard", --9
        hands="Malignance Gloves", --5
        legs="Malignance Tights", --7
        feet="Malignance Boots",
        neck="Monk's nodowa +2",
        waist="Moonbow belt +1", --6
        left_ear="Sherida earring",
        right_ear="Telos earring",
        left_ring="Defending Ring", --10
        right_ring="Niqmaddu Ring",
        back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10', 'Damage taken-5%',}}} --5
    sets.engaged.SomeAcc.PDT = {}
    
	sets.engaged.Hybrid.PDT = {
		ammo="Staunch Tathlum +1", --3
        head="Malignance Chapeau", --6
        body="Malignance Tabard", --9
        hands="Malignance Gloves", --5
        legs="Malignance Tights", --7
        feet="Malignance Boots",
        neck="Monk's nodowa +2",
        waist="Moonbow belt +1", --6
        left_ear="Sherida earring",
        right_ear="Telos earring",
        left_ring="Defending Ring", --10
        right_ring="Niqmaddu Ring",
        back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10', 'Damage taken-5%',}}} --5
    sets.engaged.Counter = {}
    sets.engaged.Hybrid.Counter = {}
 
 
    -- Hundred Fists/Impetus melee set mods
    sets.engaged.HF = set_combine(sets.engaged)
    sets.engaged.HF.Impetus = set_combine(sets.engaged, {body="Bhikku Cyclas +3",})
    sets.engaged.Hybrid.HF = set_combine(sets.engaged.Hybrid)
    sets.engaged.Hybrid.HF.Impetus = set_combine(sets.engaged.Hybrid, {body="Bhikku Cyclas +3",})
    sets.engaged.Counter.HF = set_combine(sets.engaged.Counter)
    sets.engaged.Counter.HF.Impetus = set_combine(sets.engaged.Counter, {body="Bhikku Cyclas +3",})
    sets.engaged.Hybrid.Counter.HF = set_combine(sets.engaged.Hybrid.Counter)
    sets.engaged.Hybrid.Counter.HF.Impetus = set_combine(sets.engaged.Hybrid.Counter, {body="Bhikku Cyclas +3", })
  
    
    -- Quick sets for post-precast adjustments, listed here so that the gear can be Validated.
    sets.impetus_body = {body="Bhikku Cyclas +3",} 
end
 
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
 
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
 
--modify your melee set based on logic
function customize_melee_set(meleeSet) 
    if info.impetus_hit_count > 6 and buffactive.impetus then
        meleeSet = set_combine(meleeSet,sets.impetus_body)
    end
    return meleeSet
end
 
-- Run after the general precast() is done.
function job_post_precast(spell, action, spellMap, eventArgs)
    -- add_to_chat(122,'spell type '..spell.type)
    -- add_to_chat(122,'impetus on '..tostring(state.Buff.Impetus))
    -- add_to_chat(122,'spell english '..spell.english)
    if spell.type == 'WeaponSkill' then
        if state.Buff.Impetus and (spell.english == "Ascetic's Fury" or spell.english == "Victory Smite") then
            -- Need 6 hits at capped dDex, or 9 hits if dDex is uncapped, for Tantra to tie or win.
            --if (state.OffenseMode.current == 'Fodder' and info.impetus_hit_count > 5) or (info.impetus_hit_count > 8) then
            if info.impetus_hit_count > 6 then
                equip(sets.impetus_body)
                add_to_chat(122,'Impetus Body Equipped, Hits: '..tostring(info.impetus_hit_counter))
            else
                add_to_chat(122,'Impetus Body Not Equipped, Hits: '..tostring(info.impetus_hit_counter))
            end
        end
         
        -- Replace Moonshade Earring if we're at cap TP
        if player.tp == 3000 then
            equip(sets.precast.MaxTP)
        end
    end
end
 
 
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------
 
-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.

    
    -- Hundred Fists and Impetus modify the custom melee groups
    if buff == "Hundred Fists" or buff == "Impetus" then
        classes.CustomMeleeGroups:clear()
         
        if (buff == "Hundred Fists" and gain) or buffactive['hundred fists'] then
            classes.CustomMeleeGroups:append('HF')
        end
         
        if (buff == "Impetus" and gain) or buffactive.impetus then
            classes.CustomMeleeGroups:append('Impetus')
        end
    end
 
    -- Update gear if any of the above changed
    if buff == "Hundred Fists" or buff == "Impetus" then
        handle_equipping_gear(player.status)
    end

 
 
-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------
 
function customize_idle_set(idleSet)
    if player.hpp < 75 then
        idleSet = set_combine(idleSet, sets.ExtraRegen)
    end
     
    return idleSet
end
 
-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    update_melee_groups()
end
 
 
-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
 
 
function update_melee_groups()
    classes.CustomMeleeGroups:clear()
     
    if buffactive['hundred fists'] then
        classes.CustomMeleeGroups:append('HF')
    end
     
    if buffactive.impetus then
        classes.CustomMeleeGroups:append('Impetus')
    end
end
 
 
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(6, 1)
    elseif player.sub_job == 'NIN' then
        set_macro_page(6, 1)
    elseif player.sub_job == 'WAR' then
        set_macro_page(6, 1)
    elseif player.sub_job == 'RUN' then
        set_macro_page(6, 1)
    else
        set_macro_page(6, 1)
    end
end
 
 function set_lockstyle()
    send_command('wait 2; input /lockstyleset ' .. lockstyleset)
end
  
-------------------------------------------------------------------------------------------------------------------
-- Custom event hooks.
-------------------------------------------------------------------------------------------------------------------
 
switched_impetus = 0
unswitched_impetus = 1
-- Keep track of the current hit count while Impetus is up.
function on_action_for_impetus(action)
    if state.Buff.Impetus then
        -- count melee hits by player
        if action.actor_id == player.id then
            if action.category == 1 then
                for _,target in pairs(action.targets) do
                    for _,action in pairs(target.actions) do
                        -- Reactions (bitset):
                        -- 1 = evade
                        -- 2 = parry
                        -- 4 = block/guard
                        -- 8 = hit
                        -- 16 = JA/weaponskill?
                        -- If action.reaction has bits 1 or 2 set, it missed or was parried. Reset count.
                        if (action.reaction % 4) > 0 then
                            info.impetus_hit_count = 0
                            switched_impetus = 0
                        else
                            info.impetus_hit_count = info.impetus_hit_count + 1
                        end
                    end
                end
            elseif action.category == 3 then
                -- Missed weaponskill hits will reset the counter.  Can we tell?
                -- Reaction always seems to be 24 (what does this value mean? 8=hit, 16=?)
                -- Can't tell if any hits were missed, so have to assume all hit.
                -- Increment by the minimum number of weaponskill hits: 2.
                for _,target in pairs(action.targets) do
                    for _,action in pairs(target.actions) do
                        -- This will only be if the entire weaponskill missed or was parried.
                        if (action.reaction % 4) > 0 then
                            info.impetus_hit_count = 0
                            switched_impetus = 0
                        else
                            info.impetus_hit_count = info.impetus_hit_count + 2
                        end
                    end
                end
            end
        elseif action.actor_id ~= player.id and action.category == 1 then
            -- If mob hits the player, check for counters.
            for _,target in pairs(action.targets) do
                if target.id == player.id then
                    for _,action in pairs(target.actions) do
                        -- Spike effect animation:
                        -- 63 = counter
                        -- ?? = missed counter
                        if action.has_spike_effect then
                            -- spike_effect_message of 592 == missed counter
                            if action.spike_effect_message == 592 then
                                info.impetus_hit_count = 0
                                switched_impetus = 0
                            elseif action.spike_effect_animation == 63 then
                                info.impetus_hit_count = info.impetus_hit_count + 1
                            end
                        end
                    end
                end
            end
        end
         
        --add_to_chat(123,'Current Impetus hit count = ' .. tostring(info.impetus_hit_count))
        if info.impetus_hit_count > 6 and switched_impetus == 0 then
            --switched_impetus = 1
            --add_to_chat(225,"Chugging Impetus Koolaid")
            --handle_equipping_gear(player.status)
            --switched_impetus = 1
            send_command('gs c equip_impetus_body')
        elseif info.impetus_hit_count < 7 then 
            send_command('gs c unequip_impetus_body')
        end
    else
        info.impetus_hit_count = 0
        switched_impetus = 0
    end
end
 
function job_self_command(cmdParams, eventArgs)
    command = cmdParams[1]:lower()
    if command =='equip_impetus_body' then
            add_to_chat(225,"Equipping Impetus Body")
            switched_impetus = 1
            unswitched_impetus = 0
            equip(sets.impetus_body)
    elseif command =='unequip_impetus_body' then
            if unswitched_impetus == 0 then
                add_to_chat(225,"Removing Impetus Body")
                handle_equipping_gear(player.status)
                unswitched_impetus = 1
            end
            switched_impetus = 0
    end
end