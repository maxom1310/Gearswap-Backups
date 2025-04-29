-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
 
-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
 
    -- Load and initialize the include file.
    include('Mote-Include.lua')
end
 
-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------
 
-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal','Aminon','Subtle')
    state.HybridMode:options ('Normal','Aminon','Subtle')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.CastingMode:options('Normal', 'Resistant')
    state.PhysicalDefenseMode:options('PDT')
    state.MagicalDefenseMode:options('MDT')
     
    select_default_macro_book()
 send_command('bind ^f7 input /equipset 102;wait1;input /echo Calad')
 send_command('bind @f7 input /equipset 103;wait1;input /echo Gaxe')
  send_command('bind !@^f7 input /equipset 104;wait1;input /echo Sword')
    send_command('bind !f7 input /equipset 105;wait1;input /echo Scythe')
     
 
end
 
    -- Define sets and vars used by this job file.
    function init_gear_sets()
            --------------------------------------
            -- Start defining the sets
            --------------------------------------
            -- Precast Sets
            sets.WSDayBonus = {}
 
            -- Precast sets to enhance JAs
            sets.precast.JA['Diabolic Eye'] = {hands="Fallen's finger gauntlets +1"}
            sets.precast.JA['Arcane Circle'] = {feet="Ignominy Sollerets +1"}
            sets.precast.JA['Nether Void'] = {legs="Heath. Flanchard +3",}
            sets.precast.JA['Souleater'] = {head="Ignominy Burgeonet +1"}
            sets.precast.JA['Weapon Bash'] = {hands="Ignominy Gauntlets +1"}
            sets.precast.JA['Last Resort'] = {back="Ankou's Mantle",feet="Abyss Sollerets"}
            sets.precast.JA['Dark Seal'] = {head="Fallen's Burgeonet"}
            sets.precast.JA['Blood Weapon'] = {head="Fallen's Cuirass"}
			sets.precast.JA['Jump'] = {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Heath. Bur. +3",
    body="Crepuscular Mail",
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs="Flamma Dirs +2",
    feet="Ostro Greaves",
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist={ name="Kentarch Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear={ name="Schere Earring", augments={'Path: A',}},
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
			sets.precast.JA['High Jump'] = {    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Heath. Bur. +3",
    body="Crepuscular Mail",
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs="Flamma Dirs +2",
    feet="Ostro Greaves",
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist={ name="Kentarch Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear={ name="Schere Earring", augments={'Path: A',}},
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
 
             
           -- Waltz set (chr and vit)
    sets.precast.Waltz = {}        
            
            -- Fast cast sets for spells
                      
            -- Precast Sets
    sets.precast.FC = {    ammo="Sapience Orb",
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
    neck="Orunmila's Torque",
    waist="Ioskeha Belt +1",
    left_ear="Enchntr. Earring +1",
    right_ear="Malignance Earring",
    left_ring="Rahab Ring",
    right_ring="Kishar Ring",
    back={ name="Ankou's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},}
     
	sets.precast.FC.Impact = {    ammo="Sapience Orb",
    head=empty,
    body="Crepuscular Cloak",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
    neck="Orunmila's Torque",
    waist="Ioskeha Belt +1",
    left_ear="Enchntr. Earring +1",
    right_ear="Malignance Earring",
    left_ring="Rahab Ring",
    right_ring="Kishar Ring",
    back={ name="Ankou's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},	}
            -- Specific spells
    sets.midcast.Utsusemi = {}
      
    sets.midcast.DarkMagic = { ammo="Pemphredo Tathlum",
    head="Heath. Bur. +3",
    body="Heath. Cuirass +3",
    hands="Heath. Gauntlets +3",
    legs="Heath. Flanchard +3",
    feet="Heath. Sollerets +3",
    neck="Erra Pendant",
    waist="Orpheus's Sash",
    left_ear="Malignance Earring",
    right_ear="Heath. Earring +2",
    left_ring="Stikini Ring +1",
    right_ring="Metamor. ring +1",
    back={ name="Ankou's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},}
	    
		sets.midcast.Impact = {       ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    body="Crepuscular Cloak",
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs="Flamma Dirs +2",
    feet="Heath. Sollerets +3",
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist="Oneiros Rope",
    left_ear="Dedition Earring",
    right_ear="Wyvern Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Ankou's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},}
             
    sets.midcast.Endark = {    sub="Utu Grip",
    ammo="Pemphredo Tathlum",
    head="Heath. Bur. +3",
    body="Heath. Cuirass +3",
    hands="Heath. Gauntlets +3",
    legs="Heath. Flanchard +3",
    feet="Heath. Sollerets +3",
    neck="Erra Pendant",
    waist="Orpheus's Sash",
    left_ear="Malignance Earring",
    right_ear="Heath. Earring +2",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Ankou's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},}
             
    sets.midcast['Endark II'] = sets.midcast.Endark
            
    sets.midcast['Dread Spikes'] = {
	    ammo="Aqreqaq Bomblet",
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body="Heath. Cuirass +3",
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck="Sanctity Necklace",
    waist="Ioskeha Belt +1",
    left_ear="Cryptic Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back="Moonlight Cape",}
             
    sets.midcast['Elemental Magic'] = {     ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Hjarrandi Helm",
    body="Crepuscular Mail",
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs="Flamma Dirs +2",
    feet="Heath. Sollerets +3",
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist="Oneiros Rope",
    left_ear="Dedition Earring",
    right_ear={ name="Schere Earring", augments={'Path: A',}},
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Ankou's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Store TP"+10','Damage taken-5%',}},}
             
    sets.midcast['Enfeebling Magic'] = {}
            
    sets.midcast.Stun = {}
             
    sets.midcast.Absorb = {  ammo="Pemphredo Tathlum",
    head="Heath. Bur. +3",
    body="Heath. Cuirass +3",
    hands="Heath. Gauntlets +3",
    legs="Heath. Flanchard +3",
    feet="Heath. Sollerets +3",
    neck="Erra Pendant",
    waist="Orpheus's Sash",
    left_ear="Malignance Earring",
    right_ear="Heath. Earring +2",
    left_ring="Stikini Ring +1",
    right_ring="Kishar Ring",
    back="Chuparrosa Mantle",}
	
    sets.midcast['Absorb-VIT'] = {  ammo="Pemphredo Tathlum",
    head="Heath. Bur. +3",
    body="Heath. Cuirass +3",
    hands="Heath. Gauntlets +3",
    legs="Heath. Flanchard +3",
    feet="Heath. Sollerets +3",
    neck="Erra Pendant",
    waist="Orpheus's Sash",
    left_ear="Malignance Earring",
    right_ear="Heath. Earring +2",
    left_ring="Stikini Ring +1",
    right_ring="Kishar Ring",
    back="Chuparrosa Mantle",}
	
	    sets.midcast['Absorb-TP'] = {  ammo="Pemphredo Tathlum",
    head="Heath. Bur. +3",
    body="Heath. Cuirass +3",
    hands="Heath. Gauntlets +3",
    legs="Heath. Flanchard +3",
    feet="Heath. Sollerets +3",
    neck="Erra Pendant",
    waist="Eschan Stone",
    left_ear="Malignance Earring",
    right_ear="Heath. Earring +2",
    left_ring="Stikini Ring +1",
    right_ring="Kishar Ring",
    back={ name="Ankou's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},}
                    
    sets.midcast.Drain = {  ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body="Heath. Cuirass +3",
    hands="Heath. Gauntlets +3",
    legs="Heath. Flanchard +3",
    feet="Heath. Sollerets +3",
    neck="Erra Pendant",
    waist="Orpheus's Sash",
    left_ear="Malignance Earring",
    right_ear="Heath. Earring +2",
    left_ring="Stikini Ring +1",
    right_ring="Archon Ring",
    back={ name="Ankou's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},}
                    
    sets.midcast['Aspir'] = {  ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body="Heath. Cuirass +3",
    hands="Heath. Gauntlets +3",
    legs="Heath. Flanchard +3",
    feet="Heath. Sollerets +3",
    neck="Erra Pendant",
    waist="Orpheus's Sash",
    left_ear="Malignance Earring",
    right_ear="Heath. Earring +2",
    left_ring="Stikini Ring +1",
    right_ring="Archon Ring",
    back={ name="Ankou's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},}
                 
    sets.midcast['Aspir II'] = {  ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body="Heath. Cuirass +3",
    hands="Heath. Gauntlets +3",
    legs="Heath. Flanchard +3",
    feet="Heath. Sollerets +3",
    neck="Erra Pendant",
    waist="Orpheus's Sash",
    left_ear="Malignance Earring",
    right_ear="Heath. Earring +2",
    left_ring="Stikini Ring +1",
    right_ring="Archon Ring",
    back={ name="Ankou's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},}
             
 
    sets.midcast['Drain II'] = {  ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body="Heath. Cuirass +3",
    hands="Heath. Gauntlets +3",
    legs="Heath. Flanchard +3",
    feet="Heath. Sollerets +3",
    neck="Erra Pendant",
    waist="Orpheus's Sash",
    left_ear="Malignance Earring",
    right_ear="Heath. Earring +2",
    left_ring="Stikini Ring +1",
    right_ring="Archon Ring",
    back={ name="Ankou's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},}
             
    sets.midcast['Drain III'] = {    ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body="Heath. Cuirass +3",
    hands="Heath. Gauntlets +3",
    legs="Heath. Flanchard +3",
    feet="Heath. Sollerets +3",
    neck="Erra Pendant",
    waist="Orpheus's Sash",
    left_ear="Malignance Earring",
    right_ear="Heath. Earring +2",
    left_ring="Stikini Ring +1",
    right_ring="Archon Ring",
    back={ name="Ankou's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},}
 
                                            
            -- Weaponskill sets
            -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
	    ammo="Knobkierrie",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Thrud Earring",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},

	}
 
 
            -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Catastrophe'] = {     ammo="Knobkierrie",
    head="Heath. Bur. +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Heath. Sollerets +3",
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Thrud Earring",
    right_ear="Heath. Earring +2",
    left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}
	    sets.precast.WS['Steel Cyclone'] = {     ammo="Knobkierrie",
    head="Heath. Bur. +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Heath. Sollerets +3",
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Thrud Earring",
    right_ear="Heath. Earring +2",
    left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}
                     
    sets.precast.WS['Catastrophe'].Acc = {}
                     
    sets.precast.WS['Sanguine Blade'] = {}
      
    sets.precast.WS['Torcleaver'] = {    

    sub="Utu Grip",
    ammo="Knobkierrie",
    head="Heath. Bur. +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Heath. Sollerets +3",
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Heath. Earring +2",
	left_ring="Niqmaddu Ring",
    right_ring="Ephramad's Ring",
    back={ name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Damage taken-5%',}},}
	
    sets.precast.WS['Origin'] = {                    
    ammo="Knobkierrie",
    head="Heath. Bur. +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Heath. Sollerets +3",
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	right_ear="Heath. Earring +2",
  --  right_ear={ name="Schere Earring", augments={'Path: A',}},
    left_ring="Ephramad's Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
	
					 
    sets.precast.WS['Torcleaver'].Acc = {}
     
	 sets.precast.WS['Upheaval'] = {    

    sub="Utu Grip",
    ammo="Knobkierrie",
    head="Heath. Bur. +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Heath. Sollerets +3",
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Heath. Earring +2",
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Damage taken-5%',}},}
  
  sets.precast.WS['Scourge'] = {}
 
    sets.precast.WS['Scourge'].Acc = {}
 
    sets.precast.WS['Savage Blade'] = {
    ammo="Knobkierrie",
    head="Heath. Bur. +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Heath. Sollerets +3",
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Heath. Earring +2",
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}
	
	    sets.precast.WS['Judgment'] = {
    ammo="Knobkierrie",
    head="Heath. Bur. +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Heath. Sollerets +3",
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Heath. Earring +2",
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}
             
    sets.precast.WS['Requiescat'] = {}
             
    sets.precast.WS['Cross Reaper'] = {     ammo="Knobkierrie",
    head="Heath. Bur. +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Heath. Sollerets +3",
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Heath. Earring +2",
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}
                     
    sets.precast.WS['Cross Reaper'].Acc = {}
                     
    sets.precast.WS['Quietus'] = {    ammo="Knobkierrie",
    head="Heath. Bur. +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Heath. Sollerets +3",
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Thrud Earring",
    right_ear="Heath. Earring +2",
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}
                     
    sets.precast.WS['Quietus'].Acc = {}
                     
    sets.precast.WS['Entropy'] = {     ammo="Knobkierrie",
    head="Heath. Bur. +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Heath. Sollerets +3",
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Heath. Earring +2",
    left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
    back={ name="Ankou's Mantle", augments={'INT+20','Accuracy+20 Attack+20','INT+10','Weapon skill damage +10%','Damage taken-5%',}},}
 
                     
    sets.precast.WS['Entropy'].Acc = {}
 
    sets.precast.WS['Insurgency'] = {    sub="Utu Grip",
    ammo="Crepuscular Pebble",
     head="Heath. Bur. +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Heath. Sollerets +3",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist="Fotia Belt",
      right_ear="Heath. Earring +2",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Niqmaddu Ring",
    right_ring="Ephramad's Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},}
 
                     
    sets.precast.WS['Insurgency'].Acc = {}
                     
    sets.precast.WS['Resolution'] = {

    sub="Utu Grip",
    ammo="Crepuscular Pebble",
     head="Heath. Bur. +3",
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist="Fotia Belt",
      right_ear="Heath. Earring +2",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Niqmaddu Ring",
    right_ring="Ephramad's Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},}
                     
    sets.precast.WS['Resolution'].Acc = {}
	
	    sets.precast.WS['Decimation'] = {
    main="Dolichenus",
    sub={ name="Sangarius +1", augments={'Path: A',}},
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
     head="Heath. Bur. +3",
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear={ name="Schere Earring", augments={'Path: A',}},
     right_ear="Heath. Earring +2",
    left_ring="Niqmaddu Ring",
    right_ring="Ephramad's Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},}
	
	sets.precast.WS['Armor Break'] = {
	    main="Lycurgos",
    sub="Utu Grip",
    ammo="Pemphredo Tathlum",
    head="Heath. Bur. +3",
    body="Heath. Cuirass +3",
    hands="Heath. Gauntlets +3",
    legs="Heath. Flanchard +3",
    feet="Heath. Sollerets +3",
    neck="Erra Pendant",
    waist="Eschan Stone",
    left_ear="Crep. Earring",
    right_ear="Heath. Earring +2",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Crepuscular Ring",
    back={ name="Ankou's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
	}
		sets.precast.WS['Weapon Break'] = {
	    main="Lycurgos",
    sub="Utu Grip",
    ammo="Pemphredo Tathlum",
    head="Heath. Bur. +3",
    body="Heath. Cuirass +3",
    hands="Heath. Gauntlets +3",
    legs="Heath. Flanchard +3",
    feet="Heath. Sollerets +3",
    neck="Erra Pendant",
    waist="Eschan Stone",
    left_ear="Crep. Earring",
    right_ear="Heath. Earring +2",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Crepuscular Ring",
    back={ name="Ankou's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
	}
		sets.precast.WS['Full Break'] = {
	    main="Lycurgos",
    sub="Utu Grip",
    ammo="Pemphredo Tathlum",
    head="Heath. Bur. +3",
    body="Heath. Cuirass +3",
    hands="Heath. Gauntlets +3",
    legs="Heath. Flanchard +3",
    feet="Heath. Sollerets +3",
    neck="Erra Pendant",
    waist="Eschan Stone",
    left_ear="Crep. Earring",
    right_ear="Heath. Earring +2",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Crepuscular Ring",
    back={ name="Ankou's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
	}
                                
            -- Sets to return to when not performing an action.
            
            -- Resting sets
    sets.resting = {}
            
      
            -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {	  
    sub="Utu Grip",
    ammo="Crepuscular Pebble",
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck="Elite Royal Collar",
    waist="Flume Belt +1",
    left_ear="Cryptic Earring",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}
 
            -- Defense sets
    sets.defense.PDT = {}
    
	sets.defense.Normal = {   
    sub="Utu Grip",
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist="Ioskeha Belt +1",
    left_ear="Schere Earring",
--	left_ear="Dedition Earring",
	right_ear="Brutal Earring",
  --  right_ear="Telos Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Moonlight Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
  
  sets.defense.Subtle = {   
    sub="Utu Grip",
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body="Dagon Breastplate",
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck={ name="Abyssal Beads +2", augments={'Path: A',}},
    waist="Ioskeha Belt +1",
	left_ear="Dedition Earring",
	right_ear="Telos Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Moonlight Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
      
    sets.defense.MDT = {     sub="Utu Grip",
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Ratri Sallet +1",
    body="Ratri Plate +1",
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck={ name="Vim Torque +1", augments={'Path: A',}},
    waist="Ioskeha Belt +1",
    left_ear="Cessance Earring",
    right_ear="Brutal Earring",
    left_ring="Roller's Ring",
    right_ring="Moonlight Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
      
      
      
            -- Engaged sets
             
    sets.engaged.Normal = {
    sub="Utu Grip",
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Vim Torque +1", augments={'Path: A',}},
    waist="Ioskeha Belt +1",
    left_ear="Cessance Earring",
--	left_ear="Dedition Earring",
	right_ear="Brutal Earring",
  --  right_ear="Telos Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Moonlight Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}
             
	sets.engaged.Aminon = {		     sub="Utu Grip",
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Ratri Sallet +1",
    body="Ratri Plate +1",
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck={ name="Vim Torque +1", augments={'Path: A',}},
    waist="Ioskeha Belt +1",
    left_ear="Cessance Earring",
    right_ear="Brutal Earring",
    left_ring="Roller's Ring",
    right_ring="Moonlight Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}
			 
			 
    sets.engaged.Subtle = {   
    sub="Utu Grip",
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body="Dagon Breastplate",
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck={ name="Vim Torque +1", augments={'Path: A',}},
    waist="Ioskeha Belt +1",
	left_ear="Schere Earring",
	right_ear="Digni. Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Moonlight Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
             
     	sets.recphalanx = {
    ammo="Crepuscular Pebble",
    head={ name="Valorous Mask", augments={'"Cure" potency +2%','Accuracy+24 Attack+24','Phalanx +4',}},
    body={ name="Valorous Mail", augments={'Weapon skill damage +4%','"Dbl.Atk."+2','Phalanx +4','Accuracy+2 Attack+2',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck="Elite Royal Collar",
    waist="Ioskeha Belt +1",
    left_ear="Genmei Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Niqmaddu Ring",
    right_ring="Moonlight Ring",
    back={ name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Damage taken-5%',}},
}
     
    end
     
function precast(spell,abil)
    --equips favorite weapon if disarmed
    if player.equipment.main == "empty" or player.equipment.sub == "empty" then
        equip({main="Fornaria",
        sub="Utu Grip"})
    end
end
 
-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Elemental Magic' then
        if spell.element == world.day_element or spell.element == world.weather_element then
     --       equip(sets.midcast['Elemental Magic'], {waist="Hachirin-No-Obi"})
        end
    end
end
------------------------------------------------------------------------------
function job_post_midcast(spell, action, spellMap, eventArgs)
    if (skillchain_elements[spell.skillchain_a]:contains(world.day_element) or skillchain_elements[spell.skillchain_b]:contains(world.day_element) or skillchain_elements[spell.skillchain_c]:contains(world.day_element))
        then 
    end
end 
 
 
function job_post_midcast(spell, action, spellMap, eventArgs)
    if S{"Drain","Drain II","Drain III"}:contains(spell.english) and (spell.element==world.day_element or spell.element==world.weather_element) then
        equip({waist="Hachirin-no-obi"})
    end
end
-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if state.Buff[buff] ~= nil then
        state.Buff[buff] = gain
    end
    if buff:lower()=='sleep' then
        if gain and player.hp > 120 and player.status == "Engaged" then -- Equip Berserker's Torque When You Are Asleep
            equip({neck={ name="Vim Torque +1", augments={'Path: A',}},})
        elseif not gain then -- Take Berserker's off
            handle_equipping_gear(player.status)
        end
    end
end
 
function customize_melee_set(meleeSet)
    if state.Buff.Sleep and player.hp > 120 and player.status == "Engaged" then -- Equip Berserker's Torque When You Are Asleep
        meleeSet = set_combine(meleeSet,{neck={ name="Vim Torque +1", augments={'Path: A',}},})
    end
    return meleeSet
end
 
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(2, 16)
end