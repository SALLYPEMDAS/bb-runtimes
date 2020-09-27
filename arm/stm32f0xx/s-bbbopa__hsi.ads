------------------------------------------------------------------------------
--                                                                          --
--                  GNAT RUN-TIME LIBRARY (GNARL) COMPONENTS                --
--                                                                          --
--            S Y S T E M . B B . B O A R D _ P A R A M E T E R S           --
--                                                                          --
--                                  S p e c                                 --
--                                                                          --
--                   Copyright (C) 2016-2017, AdaCore                       --
--                                                                          --
-- GNAT is free software;  you can  redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  GNAT is distributed in the hope that it will be useful, but WITH- --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.                                     --
--                                                                          --
-- As a special exception under Section 7 of GPL version 3, you are granted --
-- additional permissions described in the GCC Runtime Library Exception,   --
-- version 3.1, as published by the Free Software Foundation.               --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
-- GNAT was originally developed  by the GNAT team at  New York University. --
-- Extensive contributions were provided by Ada Core Technologies Inc.      --
--                                                                          --
-- The port of GNARL to bare board targets was initially developed by the   --
-- Real-Time Systems Group at the Technical University of Madrid.           --
--                                                                          --
------------------------------------------------------------------------------

--  This package defines board parameters for the generic STM32F0xx
--  boards using the HSI internal clock as the clock source.
--
--  This file is suitable for the STM32F04x/STM32F07x/STM32F09x devices
--  where the HSI clock is used for the PLL input (no forced /2 divder)

with System.STM32;

package System.BB.Board_Parameters is
   pragma No_Elaboration_Code_All;
   pragma Preelaborate (System.BB.Board_Parameters);

   --------------------
   -- Hardware clock --
   --------------------

   Main_Clock_Frequency : constant := 48_000_000;
   --  Optimal frequency of the system clock.

   HSE_Clock_Frequency : constant := 8_000_000;
   --  Frequency of High Speed External clock.

   --  If either of the above values are changed then the clock configuration
   --  below will need to be updated to generate the requested clock freq.

   -------------------------
   -- Clock configuration --
   -------------------------

   HSE_Bypass  : constant Boolean := False; --  Don't bypass ext. resonator
   LSI_Enabled : constant Boolean := True;  --  Use low-speed int. clock

   --  Selection of clock sources

   PLL_Src    : constant System.STM32.PLL_Source    :=
     System.STM32.PLL_SRC_HSI_PREDIV;

   SYSCLK_Src : constant System.STM32.SYSCLK_Source :=
     System.STM32.SYSCLK_SRC_PLL;

   --  Configure derived clocks

   PREDIV       : constant System.STM32.PREDIV_Range := 1;
   PLLMUL_Value : constant                           := 6;

   AHB_PRE : constant System.STM32.AHB_Prescaler :=
     System.STM32.AHBPRE_DIV1;

   APB_PRE : constant System.STM32.APB_Prescaler :=
     System.STM32.APBPRE_DIV1;

end System.BB.Board_Parameters;
