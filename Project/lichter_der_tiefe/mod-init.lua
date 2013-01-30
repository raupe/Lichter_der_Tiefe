-- Copyright (C) 2007, 2010 - Bit-Blot
--
-- This file is part of Aquaria.
--
-- Aquaria is free software; you can redistribute it and/or
-- modify it under the terms of the GNU General Public License
-- as published by the Free Software Foundation; either version 2
-- of the License, or (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
--
-- See the GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.

if not v then v = {} end
if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

function init()
	setFlag(901, 0)
	setFlag(1100, 0)
	setFlag(306, 3) -- path
	setFlag(307, 0) -- songs
	loadMap("0_hafen")
	
	--debug:
	-- setFlag(307, 3) -- alle lieder gelernt -> dunkelheit aktiv
	-- setFlag(1100, 1) -- flag, lied gelernt... (wahrscheinlich egal)
	-- setFlag(701, 2) -- flag, untiefen betreten -> blumen komplett verwelkt
	-- setFlag(702, 1) -- cerajt besiegt -> wahllose verwandlung + angriff
	-- learnSong(104) -- lied lernen
end
