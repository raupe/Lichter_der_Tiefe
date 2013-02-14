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
	
	setFlag(1, 0)
	setFlag(2, 0)
	setFlag(3, 0)
	setFlag(4, 0)
	setFlag(5, 0)
	setFlag(6, 0)
	setFlag(7, 0)
	
	setFlag(100, 0)
	setFlag(101, 0)
	setFlag(102, 0)
	setFlag(103, 0)
	setFlag(104, 0)
	setFlag(105, 0)
	setFlag(106, 0)
	setFlag(107, 0)
	setFlag(108, 0)
	
	setFlag(200, 0)
	setFlag(201, 0)
	setFlag(202, 0)
	setFlag(203, 0)
	setFlag(204, 0)
	
	setFlag(300, 0)
	setFlag(301, 0)
	setFlag(302, 0)
	setFlag(303, 0)
	setFlag(304, 0)
	setFlag(305, 0)
	setFlag(306, 3)
	setFlag(307, 0)
	setFlag(308, 0)
	setFlag(309, 0)
	setFlag(310, 0)
		
	setFlag(400, 0)
	setFlag(401, 0)
	setFlag(402, 0)
	setFlag(403, 0)
	setFlag(404, 0)
	setFlag(405, 0)
	
	setFlag(500, 0)
	setFlag(501, 0)
	setFlag(502, 0)
	setFlag(503, 0)
	setFlag(504, 0)
	setFlag(505, 0)
	setFlag(506, 0)
	
	setFlag(600, 0)
	setFlag(601, 0)
	setFlag(602, 0)
	setFlag(603, 0)
	setFlag(604, 0)
	setFlag(605, 0)
	setFlag(606, 0)
	
	setFlag(700, 0)
	setFlag(701, 0)
	setFlag(702, 0)
	setFlag(703, 0)
	setFlag(704, 0)
	setFlag(705, 0)
	
	setFlag(800, 0)
	setFlag(801, 0)
	setFlag(802, 0)
	setFlag(803, 0)
	
	setFlag(900, 0)
	setFlag(901, 0)
	
	setFlag(1000, 0)
	setFlag(1001, 0)
	
	
	setFlag(1100, 0)
	setFlag(1200, 0)
	
	loadMap("0_hafen")
	
	--debug:
	-- setFlag(307, 3) -- alle lieder gelernt -> dunkelheit aktiv
	-- setFlag(1100, 1) -- flag, lied gelernt... (wahrscheinlich egal)
	-- setFlag(701, 2) -- flag, untiefen betreten -> blumen komplett verwelkt
	-- setFlag(702, 1) -- cerajt besiegt -> wahllose verwandlung + angriff
	-- learnSong(104) -- lied lernen
end
